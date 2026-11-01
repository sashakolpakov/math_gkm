"""Bounded subprocess watchdog. Live transport is only launched by study CLI.

Fixture transport runs a labeled deterministic Python child, never a model.
The watchdog inherits the study lock and survives controller interruption.
"""
import argparse
import json
import os
from pathlib import Path
import selectors
import signal
import subprocess
import sys
import time
from .study_common import (ROOT, PYTHON, read, write, inventory, sha, authorize_live,
                           validate_model, REASONING_EFFORT, Invalid)
from .worker import inline
from .resources import admission, Guard, ResourceFailure, cleanup_hold, child_exited, cleanup_private_group, disk_scope_roots
from .event_stream import events

SCHEMA = {'type': 'object', 'additionalProperties': False, 'properties': {
    'request_id': {'type': 'string'}, 'payload_json': {'type': 'string'}},
    'required': ['request_id', 'payload_json']}

def classify_outcome(error,returncode,final_exists):
    # No final response/nonzero CLI exit is operational, not a schema repair.
    if returncode is None or returncode!=0:
        return error if error and not error.startswith('invalid_report:') else 'nonzero_exit'
    if not final_exists and (not error or error.startswith('invalid_report:')):
        return 'missing_final_report'
    return error or 'completed'


def decode_report(job, spec):
    """Strict adapter decoding; other roles retain their existing parsing."""
    if spec['role'] == 'adapter':
        from .adapter_protocol import decode_final, AdapterProtocolError
        try:
            limit = min(spec['output_bytes'], 4*1024**2)
            with (job/'final.json').open('rb') as source:
                raw = source.read(limit + 1)
            if len(raw) > limit:
                raise AdapterProtocolError('input_too_large')
            request = read(job/'request.json')
            return decode_final(raw, spec['request_id'], [t['id'] for t in request['tasks']])
        except (OSError, KeyError, TypeError, ValueError, RecursionError) as exc:
            if isinstance(exc, AdapterProtocolError):
                raise
            raise AdapterProtocolError('invalid_artifact') from None
    if (job/'final.json').stat().st_size > min(spec['output_bytes'],4*1024**2):
        raise ValueError('final payload exceeds bounded parser capacity')
    final = read(job/'final.json')
    if final['request_id'] != spec['request_id']:
        raise ValueError('request mismatch')
    payload = json.loads(final['payload_json'])
    if not isinstance(payload, dict):
        raise ValueError('report must be object')
    return payload, None


def permissions(workspace, *, readonly=False, retained_sources=None, research_notes=None):
    profile = read(ROOT/'config/study-base-permissions.json')
    fs = profile['filesystem']
    fs[':tmpdir'] = 'write'  # TMPDIR is this role's workspace/.scratch.
    fs[str(ROOT)] = 'deny'
    # No inherited workspace, bootstrap, old history or evaluator read grant.
    fs[':workspace_roots'] = {'.git': 'deny', '.bootstrap': 'deny',
        'history': 'read', 'inbox': 'read', 'contract.json': 'read',
        'MISSION.md': 'read', 'docs': 'read', 'lean-toolchain': 'read',
        'lakefile.toml': 'read', 'lake-manifest.json': 'read',
        'MathGKM/Markov.lean': 'read', 'MathGKM/Protocol.lean': 'read',
        '.lake/packages': 'read'}
    if (workspace/'contract.json').exists():
        fs[':workspace_roots'][read(workspace/'contract.json')['root_file']] = 'read'
    for name in ('MathGKM/ResearchSemantics.lean', 'MathGKM/ContinuationObligations.lean'):
        fs[':workspace_roots'][name] = 'read'
    for name in (retained_sources or {}):
        fs[':workspace_roots'][name] = 'read'
    if research_notes is not None:
        from .snapshot_routing import verify_delivery
        fs[str(verify_delivery(research_notes))] = 'read'
    fs[str(workspace)] = 'read' if readonly else 'write'
    if readonly:
        fs[':workspace_roots']['.scratch'] = 'write'
    return profile

def command(job, spec):
    """Pure argv construction, exercised without live launch in tests."""
    validate_model(spec['model'])
    if spec.get('reasoning_effort', REASONING_EFFORT) != REASONING_EFFORT:
        raise Invalid('study reasoning effort must remain high')
    workspace = Path(spec['workspace'])
    from .snapshot_routing import verify_job_context
    verify_job_context(job)
    routed = 'research_context_binding' in spec
    write(job/'permissions.json', permissions(workspace, readonly=spec['readonly'],
        retained_sources=spec.get('retained_sources'),
        research_notes=spec.get('research_notes') if routed else None))
    write(job/'schema.json', SCHEMA)
    env = {'PATH': '/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin:/usr/sbin:/sbin',
        'HOME': '/Users/sasha', 'LANG': 'en_US.UTF-8', 'GIT_CONFIG_NOSYSTEM': '1',
        'GIT_CONFIG_GLOBAL': '/dev/null', 'TMPDIR': str(workspace/'.scratch')}
    write(job/'tool-environment.json', env)
    argv = ['/opt/homebrew/bin/codex', '--no-daemon', '-a', 'never', 'exec',
        '--model', spec['model'], '--ephemeral', '--ignore-user-config',
        '--skip-git-repo-check', '--json', '--color', 'never', '-C', str(workspace),
        '-c', 'default_permissions="cleanroom"',
        '-c', 'permissions.cleanroom='+inline(read(job/'permissions.json')),
        '-c', 'web_search="live"', '-c', 'model_reasoning_effort="'+REASONING_EFFORT+'"',
        '-c', 'shell_environment_policy.inherit="none"',
        '-c', 'shell_environment_policy.set='+inline(env),
        '--output-schema', str(job/'schema.json'), '--output-last-message', str(job/'final.json')]
    for key in ['features.memories', 'memories.use_memories', 'memories.generate_memories',
                'features.apps', 'features.plugins', 'features.remote_plugin', 'features.hooks',
                'features.browser_use', 'features.computer_use', 'features.shell_snapshot',
                'features.multi_agent']:
        argv += ['-c', key+'=false']
    return argv + ['-c', 'features.skip_host_skill_discovery=true', '-c', 'project_doc_max_bytes=0', '-']

# Conservative supported-config roots for the inherited native broker process,
# not the separate tool shell environment. Optional state/log defaults are under
# CODEX_HOME. This finite table does not assert whole-host or undocumented native
# broker coverage; outside-arm roots retain the prior observer's blind spots.
BROKER_HOME_DEFAULTS = {'CODEX_HOME': '.codex', 'XDG_CONFIG_HOME': '.config',
    'XDG_CACHE_HOME': '.cache', 'XDG_DATA_HOME': '.local/share',
    'XDG_STATE_HOME': '.local/state'}
BROKER_OPTIONAL_ROOTS = ('CODEX_SQLITE_HOME','CODEX_LOG_DIR','XDG_RUNTIME_DIR','TMP','TEMP')

def broker_root_preflight(arm, roots, env, cwd):
    """Keep the inherited environment exact; reject missed in-arm write roots."""
    def path(value, key):
        if not isinstance(value,str) or not value or '\x00' in value or value.startswith('~'):
            raise ResourceFailure('monitor_unavailable: ambiguous broker root '+key)
        try:
            value=Path(value)
            return (value if value.is_absolute() else cwd/value).resolve()
        except (OSError,ValueError,RuntimeError):
            raise ResourceFailure('monitor_unavailable: invalid broker root '+key) from None
    if 'HOME' in env:
        home=env['HOME']
    else:
        import pwd
        try: home=pwd.getpwuid(os.getuid()).pw_dir
        except (KeyError,OSError):
            raise ResourceFailure('monitor_unavailable: missing broker home') from None
    home=path(home,'HOME')
    selected={'HOME': home}
    for key,suffix in BROKER_HOME_DEFAULTS.items():
        selected[key]=path(env[key] if key in env else str(home/suffix),key)
    for key in BROKER_OPTIONAL_ROOTS:
        if key in env: selected[key]=path(env[key],key)
    if 'TMPDIR' not in env:
        raise ResourceFailure('monitor_unavailable: missing broker TMPDIR')
    selected['TMPDIR']=path(env['TMPDIR'],'TMPDIR')
    for key,value in selected.items():
        # HOME is contextual: its actual default state/cache descendants above
        # are classified separately. State/temp roots may not broadly cover an
        # unobserved part of the arm by being an ancestor of it either.
        intersects=value.is_relative_to(arm) or (key!='HOME' and arm.is_relative_to(value))
        if intersects and not any(value.is_relative_to(root) for root in roots):
            raise ResourceFailure('monitor_unavailable: broker root outside observed workspace/job '+key)

def hosted_disk_scopes(job, workspace, env):
    """Only controller arm jobs use a union; curation keeps legacy coverage."""
    if job.parent.name!='jobs': return None
    arm=job.parent.parent
    if arm.name not in ('baseline','exploration') or arm.parent.name!='arms':
        raise ResourceFailure('monitor_unavailable: invalid hosted arm layout')
    roots=disk_scope_roots((workspace,job))
    try:
        if (not arm.is_absolute() or arm.resolve(strict=True)!=arm or
            not arm.is_relative_to(ROOT.resolve()) or
            workspace==arm or not workspace.is_relative_to(arm) or not job.is_relative_to(arm)):
            raise ResourceFailure('monitor_unavailable: invalid hosted disk containment')
    except (OSError,ValueError,RuntimeError) as exc:
        raise ResourceFailure('monitor_unavailable: invalid hosted disk containment') from exc
    broker_root_preflight(arm,roots,env,ROOT)
    return roots

def execute(job):
    try:
        with admission('external-proposer-or-fixture') as cap:
            return _execute(job, cap)
    except ResourceFailure as exc:
        spec = read(job/'spec.json')
        write(job/'receipt.json', dict(request_id=spec['request_id'], role=spec['role'],
            outcome='resource_guard: '+str(exc), payload=None, usage_raw=[],
            elapsed_seconds=0, mathematical_resolution=False, operationally_incomplete=True,
            **({'research_context_binding': spec['research_context_binding']}
               if spec.get('research_context_binding') else {}),
            **({'snapshot_context_schema': spec['snapshot_context_schema']}
               if spec.get('snapshot_context_schema') is not None else {})))

def _execute(job, cap):
    spec = read(job/'spec.json')
    workspace = Path(spec['workspace'])
    if spec['transport'] == 'live':
        authorize_live(read(workspace/'contract.json'))
    before = inventory(workspace)
    write(job/'before.json', before)
    argv = command(job, spec)
    if spec['transport'] == 'fixture':
        argv = [PYTHON, '-m', 'machinery.study_fixture', str(job)]
    write(job/'argv.json', argv)
    start = time.monotonic()
    wall_start = time.time()
    p, error, total, guard = None, None, 0, None
    try:
        env = os.environ.copy()
        env.update(GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL='/dev/null', TMPDIR=str(workspace/'.scratch'))
        disk_scopes=hosted_disk_scopes(job,workspace,env)
        guard = (Guard(0,job.parent.parent,cap,disk_scopes=disk_scopes) if disk_scopes is not None
            else Guard(0,job.parent.parent,cap))
        from .study_context import check_prompt_file
        check_prompt_file(job/'prompt.txt')
        with (job/'prompt.txt').open('rb') as prompt:
            if signal.getsignal(signal.SIGCHLD)!=signal.SIG_DFL:
                raise ResourceFailure('default SIGCHLD required for unreaped private group')
            p = subprocess.Popen(argv, cwd=ROOT, env=env, stdin=prompt,
                stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True)
            guard.bind(p.pid)
        write(job/'process.json', {'pid': p.pid, 'watchdog_pid': os.getpid(), 'started': wall_start})
        with selectors.DefaultSelector() as selector, (job/'events.jsonl').open('wb') as out, (job/'stderr.log').open('wb') as err:
            selector.register(p.stdout, selectors.EVENT_READ, out)
            selector.register(p.stderr, selectors.EVENT_READ, err)
            while True:
                if child_exited(p):
                    for stream,target in ((p.stdout,out),(p.stderr,err)):
                        while True:
                            # Finite drain: ordinary orphan writers cannot keep
                            # a normal parent exit alive or escape final cleanup.
                            os.set_blocking(stream.fileno(),False)
                            try: data=os.read(stream.fileno(),65536)
                            except BlockingIOError: break
                            if not data: break
                            available=max(0,spec['output_bytes']-total)
                            target.write(data[:available]); target.flush()
                            total+=len(data)
                            if total>spec['output_bytes']:
                                error='output_budget_exceeded'; break
                        if error: break
                    break
                guard.check()
                if Path(spec['stop']).exists():
                    error = 'stopped'
                    break
                if time.monotonic() - start >= spec['seconds']:
                    error = 'failure_within_time_budget'
                    break
                write(job/'heartbeat.json', {'time': time.time(), 'elapsed': time.monotonic()-start})
                for key, _ in selector.select(.1):
                    data = os.read(key.fileobj.fileno(), 65536)
                    if not data:
                        selector.unregister(key.fileobj)
                        continue
                    available = max(0, spec['output_bytes'] - total)
                    key.data.write(data[:available])
                    key.data.flush()
                    total += len(data)
                    if total > spec['output_bytes']:
                        error = 'output_budget_exceeded'
                        break
                if error:
                    break
    except BaseException as exc:
        error = type(exc).__name__+': '+str(exc)
        if p and (not guard or not guard.owned): cleanup_hold(error,guard.owned if guard else {})
    finally:
        if p:
            cleanup_errors=[]
            try: cleanup_private_group(p)
            except (ResourceFailure,OSError,ValueError) as exc:
                error=error or 'unresolved_cleanup: '+str(exc)
                cleanup_errors.append(str(exc))
            if guard:
                try: guard.cleanup()
                except (ResourceFailure,OSError,ValueError) as exc: error = error or 'cleanup_monitor_unavailable: '+str(exc)
            if p.returncode is None: p.kill()
            p.wait()
            p.stdout.close()
            p.stderr.close()
            if cleanup_errors: cleanup_hold('; '.join(cleanup_errors),guard.owned if guard else {})
    payload, usage, adapter_provenance = None, [], None
    try:
        payload, adapter_provenance = decode_report(job, spec)
    except (OSError, ValueError, KeyError, TypeError) as exc:
        error = error or 'invalid_report: '+str(exc)
    classified = classify_outcome(error,p.returncode if p else None,(job/'final.json').is_file())
    error = None if classified=='completed' else classified
    for event in events(job/'events.jsonl'):
        if 'usage' in event and len(usage)<1024:
            usage.append({'event_type': event.get('type'), 'raw': event['usage']})
    try:
        after = inventory(workspace)
        if any(after.get(p) != h for p, h in spec.get('retained_sources', {}).items()):
            error = error or 'retained_source_capability_changed'
    except ValueError as exc:
        after = {}
        error = error or str(exc)
    result = {'request_id': spec['request_id'], 'role': spec['role'],
        'transport': spec['transport'], 'classification': 'SYNTHETIC FIXTURE; no mathematical progress' if spec['transport'] == 'fixture' else 'live experimental observation',
        'outcome': error or 'completed', 'payload': payload, 'usage_raw': usage,
        'provider': 'deterministic_fixture' if spec['transport'] == 'fixture' else spec['provider'],
        'model': spec['model'], 'reasoning_effort': REASONING_EFFORT,
        'started': wall_start, 'finished': time.time(),
        'elapsed_seconds': time.monotonic()-start, 'usage_semantics': spec['usage_semantics'],
        'money': None, 'normalized_tokens': None, 'mathematical_resolution': False,
        'before': before, 'after': after, 'returncode': p.returncode if p else None}
    if spec['role'] == 'adapter':
        result['adapter_protocol'] = adapter_provenance
    result['resources'] = guard.receipt() if guard else {'monitor': 'not started'}
    if spec.get('research_context_binding'):
        from .snapshot_routing import verify_job_context
        verify_job_context(job)
        result['research_context_binding'] = spec['research_context_binding']
        if spec.get('snapshot_context_schema') is not None:
            result['snapshot_context_schema'] = spec['snapshot_context_schema']
    write(job/'receipt.json', result)

if __name__ == '__main__':
    execute(Path(sys.argv[1]))
