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
from .resources import admission, Guard, ResourceFailure, cleanup_hold, child_exited, cleanup_private_group
from .event_stream import events

SCHEMA = {'type': 'object', 'additionalProperties': False, 'properties': {
    'request_id': {'type': 'string'}, 'payload_json': {'type': 'string'}},
    'required': ['request_id', 'payload_json']}

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


def permissions(workspace, *, readonly=False, retained_sources=None):
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
    write(job/'permissions.json', permissions(workspace, readonly=spec['readonly'], retained_sources=spec.get('retained_sources')))
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

def execute(job):
    try:
        with admission('external-proposer-or-fixture') as cap:
            return _execute(job, cap)
    except ResourceFailure as exc:
        spec = read(job/'spec.json')
        write(job/'receipt.json', dict(request_id=spec['request_id'], role=spec['role'],
            outcome='resource_guard: '+str(exc), payload=None, usage_raw=[],
            elapsed_seconds=0, mathematical_resolution=False, operationally_incomplete=True))

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
        guard = Guard(0, job.parent.parent, cap)
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
    if not p or p.returncode:
        error = error or 'nonzero_exit'
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
    write(job/'receipt.json', result)

if __name__ == '__main__':
    execute(Path(sys.argv[1]))
