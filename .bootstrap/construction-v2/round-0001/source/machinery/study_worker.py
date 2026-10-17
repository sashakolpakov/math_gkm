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
from .study_common import ROOT, PYTHON, read, write, inventory
from .worker import inline

SCHEMA = {'type': 'object', 'additionalProperties': False, 'properties': {
    'request_id': {'type': 'string'}, 'payload_json': {'type': 'string'}},
    'required': ['request_id', 'payload_json']}

def permissions(workspace, *, readonly=False):
    profile = read(ROOT/'.bootstrap/base-permissions.json')
    fs = profile['filesystem']
    fs[str(ROOT)] = 'deny'
    # No inherited workspace, bootstrap, old history or evaluator read grant.
    fs[':workspace_roots'] = {'.git': 'deny', '.bootstrap': 'deny',
        'history': 'read', 'inbox': 'read', 'contract.json': 'read',
        'MISSION.md': 'read', 'docs': 'read', 'lean-toolchain': 'read',
        'lakefile.toml': 'read', 'lake-manifest.json': 'read',
        'MathGKM/Markov.lean': 'read', 'MathGKM/Protocol.lean': 'read',
        '.lake/packages': 'read'}
    fs[str(workspace)] = 'read' if readonly else 'write'
    if readonly:
        fs[':workspace_roots']['.scratch'] = 'write'
    return profile

def command(job, spec):
    """Pure argv construction, exercised without live launch in tests."""
    workspace = Path(spec['workspace'])
    write(job/'permissions.json', permissions(workspace, readonly=spec['readonly']))
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
        '-c', 'web_search="live"', '-c', 'model_reasoning_effort="high"',
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
    spec = read(job/'spec.json')
    workspace = Path(spec['workspace'])
    before = inventory(workspace)
    write(job/'before.json', before)
    argv = command(job, spec)
    if spec['transport'] == 'fixture':
        argv = [PYTHON, '-m', 'machinery.study_fixture', str(job)]
    write(job/'argv.json', argv)
    start = time.monotonic()
    wall_start = time.time()
    p, error, total = None, None, 0
    try:
        env = os.environ.copy()
        env.update(GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL='/dev/null', TMPDIR=str(workspace/'.scratch'))
        with (job/'prompt.txt').open('rb') as prompt:
            p = subprocess.Popen(argv, cwd=ROOT, env=env, stdin=prompt,
                stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True)
        write(job/'process.json', {'pid': p.pid, 'watchdog_pid': os.getpid(), 'started': wall_start})
        with selectors.DefaultSelector() as selector, (job/'events.jsonl').open('wb') as out, (job/'stderr.log').open('wb') as err:
            selector.register(p.stdout, selectors.EVENT_READ, out)
            selector.register(p.stderr, selectors.EVENT_READ, err)
            while selector.get_map() or p.poll() is None:
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
    finally:
        if p:
            try:
                os.killpg(p.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
            try:
                p.wait(timeout=1)
            except subprocess.TimeoutExpired:
                pass
            try:
                os.killpg(p.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
            p.wait()
            p.stdout.close()
            p.stderr.close()
    payload, usage = None, []
    try:
        final = read(job/'final.json')
        if final['request_id'] != spec['request_id']:
            raise ValueError('request mismatch')
        payload = json.loads(final['payload_json'])
        if not isinstance(payload, dict):
            raise ValueError('report must be object')
    except (OSError, ValueError, KeyError, TypeError) as exc:
        error = error or 'invalid_report: '+str(exc)
    if not p or p.returncode:
        error = error or 'nonzero_exit'
    for line in (job/'events.jsonl').read_text(errors='replace').splitlines() if (job/'events.jsonl').exists() else []:
        try:
            event = json.loads(line)
            if 'usage' in event:
                usage.append({'event_type': event.get('type'), 'raw': event['usage']})
        except (ValueError, TypeError):
            pass
    try:
        after = inventory(workspace)
    except ValueError as exc:
        after = {}
        error = error or str(exc)
    result = {'request_id': spec['request_id'], 'role': spec['role'],
        'transport': spec['transport'], 'classification': 'SYNTHETIC FIXTURE; no mathematical progress' if spec['transport'] == 'fixture' else 'live experimental observation',
        'outcome': error or 'completed', 'payload': payload, 'usage_raw': usage,
        'provider': 'deterministic_fixture' if spec['transport'] == 'fixture' else spec['provider'],
        'model': spec['model'], 'started': wall_start, 'finished': time.time(),
        'elapsed_seconds': time.monotonic()-start, 'usage_semantics': spec['usage_semantics'],
        'money': None, 'normalized_tokens': None, 'mathematical_resolution': False,
        'before': before, 'after': after, 'returncode': p.returncode if p else None}
    write(job/'receipt.json', result)

if __name__ == '__main__':
    execute(Path(sys.argv[1]))
