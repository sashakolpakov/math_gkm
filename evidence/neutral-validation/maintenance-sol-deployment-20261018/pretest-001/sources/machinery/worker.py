"""Machine-authored experimental bounded worker/watchdog.

The live argv and permissions derive from .bootstrap/external_launcher.py.
No SDK, credential copying, package installation, or alternate transport.
This module is invoked by the controller, never by a research worker.
"""
import argparse
import json
import os
from pathlib import Path
import selectors
import signal
import subprocess
import time

from .engine import atomic
from .trust import ROOT, sha


def inline(value):
    if isinstance(value, dict):
        return '{' + ','.join(json.dumps(k)+'='+inline(v) for k, v in value.items()) + '}'
    return json.dumps(value)


REPORT_SCHEMA = {
    'type': 'object', 'additionalProperties': False,
    'properties': {
        'request_id': {'type': 'string'}, 'summary': {'type': 'string'},
        'agenda': {'type': 'array', 'items': {'type': 'string'}},
        'actions': {'type': 'array', 'items': {'type': 'string'}},
        'observations': {'type': 'array', 'items': {'type': 'string'}},
        'completion': {'type': ['object', 'null'], 'additionalProperties': False,
            'properties': {
                'kind': {'type': 'string', 'enum': ['proof', 'refutation']},
                'module': {'type': 'string'}, 'declaration': {'type': 'string'},
                'correspondence': {'type': 'string'}},
            'required': ['kind', 'module', 'declaration', 'correspondence']}}
}
REPORT_SCHEMA['required'] = list(REPORT_SCHEMA['properties'])


def command(directory, request):
    """Construct only; callers/tests can inspect without starting Codex."""
    profile = json.loads((ROOT/'.bootstrap/base-permissions.json').read_text())
    protected = profile['filesystem'][':workspace_roots']
    protected.update({p: 'read' for p in [
        'MISSION.md', 'docs/DESIGN.md', 'lean-toolchain', 'lake-manifest.json',
        'lakefile.toml', '.lake/packages', '.control', 'machinery', 'contracts',
        'tests', 'MathGKM/Protocol.lean', 'MathGKM/Markov.lean',
        'evidence/independent-markov', 'evidence/independent-agoh',
        'evidence/markov/research-run', 'RESUME.json']})
    atomic(directory/'permissions.json', profile)
    atomic(directory/'schema.json', REPORT_SCHEMA)
    shell_environment = {
        'PATH': '/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin:/usr/sbin:/sbin',
        'HOME': '/Users/sasha', 'LANG': 'en_US.UTF-8',
        'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null',
        'TMPDIR': str(ROOT/'.scratch')}
    atomic(directory/'environment-overrides.json', {
        'host_overrides': {'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null'},
        'tool_inherit': 'none', 'tool_environment': shell_environment})
    argv = ['/opt/homebrew/bin/codex', '--no-daemon', '-a', 'never', 'exec',
        '--model', 'gpt-6-astra', '--ephemeral', '--ignore-user-config',
        '--skip-git-repo-check', '--json', '--color', 'never', '-C', str(ROOT),
        '-c', 'default_permissions="cleanroom"',
        '-c', 'permissions.cleanroom='+inline(profile),
        '-c', 'web_search="live"', '-c', 'model_reasoning_effort="high"',
        '-c', 'shell_environment_policy.inherit="none"',
        '-c', 'shell_environment_policy.set='+inline(shell_environment),
        '--output-schema', str(directory/'schema.json'),
        '--output-last-message', str(directory/'final.json')]
    for key in ['features.memories', 'memories.use_memories', 'memories.generate_memories',
                'features.apps', 'features.plugins', 'features.remote_plugin', 'features.hooks',
                'features.browser_use', 'features.computer_use', 'features.shell_snapshot']:
        argv += ['-c', key+'=false']
    argv += ['-c', 'features.skip_host_skill_discovery=true',
             '-c', 'project_doc_max_bytes=0', '-']
    return argv


def valid_report(report, request_id):
    if not isinstance(report, dict) or set(report) != set(REPORT_SCHEMA['required']):
        return False
    if report['request_id'] != request_id or not isinstance(report['summary'], str):
        return False
    for key in ('agenda', 'actions', 'observations'):
        if not isinstance(report[key], list) or not all(isinstance(x, str) for x in report[key]):
            return False
    c = report['completion']
    return c is None or (isinstance(c, dict) and set(c) == {
        'kind', 'module', 'declaration', 'correspondence'} and
        c['kind'] in ('proof', 'refutation') and all(isinstance(x, str) for x in c.values()))


def inventory():
    """Never enters Git, bootstrap transcripts, dependencies, or scratch."""
    result = {}
    for folder in ('MathGKM', 'docs', 'evidence', 'requests', 'research'):
        base = ROOT/folder
        if not base.exists():
            continue
        for directory, dirs, files in os.walk(base, followlinks=False):
            dirs[:] = [d for d in dirs if d not in ('__pycache__', '.git') and
                       not (Path(directory)/d).is_symlink()]
            for name in files:
                path = Path(directory)/name
                if not path.is_symlink() and path.is_file():
                    result[str(path.relative_to(ROOT))] = sha(path)
    return result


def execute(directory):
    request = json.loads((directory/'request.json').read_text())
    before = inventory()
    atomic(directory/'before.json', before)
    # Retain preimages even for the first worker and for deleted/overwritten files.
    # Content-addressing shares unchanged bytes across all workers of this goal.
    objects = directory.parent.parent/'objects'
    objects.mkdir(exist_ok=True)
    for name, hashed in before.items():
        target = objects/hashed
        if not target.exists():
            target.write_bytes((ROOT/name).read_bytes())
    argv = command(directory, request)
    if request['transport'] == 'fixture':
        argv = ['/opt/homebrew/bin/python3', '-m', 'machinery.fixture_worker', str(directory)]
    atomic(directory/'command.json', argv)
    started = time.time()
    deadline = time.monotonic() + request['seconds']
    error, p = None, None
    usage, total, last_heartbeat = [], 0, 0
    try:
        env = os.environ.copy()
        env.update(GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL='/dev/null', TMPDIR=str(ROOT/'.scratch'))
        with (directory/'prompt.txt').open('rb') as prompt:
            p = subprocess.Popen(argv, cwd=ROOT, env=env, stdin=prompt,
                stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True)
        atomic(directory/'process.json', {'pid': p.pid, 'watchdog_pid': os.getpid(),
                                         'started': started})
        with selectors.DefaultSelector() as selector, (directory/'events.jsonl').open('wb') as events, (directory/'stderr.log').open('wb') as errors:
            selector.register(p.stdout, selectors.EVENT_READ, events)
            selector.register(p.stderr, selectors.EVENT_READ, errors)
            while selector.get_map() or p.poll() is None:
                now = time.time()
                if now-last_heartbeat >= 1:
                    atomic(directory/'activity.json', {'time': now, 'bytes': total, 'pid': p.pid})
                    last_heartbeat = now
                if Path(request['stop_file']).exists():
                    error = 'stopped'
                    break
                if time.monotonic() >= deadline:
                    error = 'timeout'
                    break
                for key, _ in selector.select(0.2):
                    data = os.read(key.fileobj.fileno(), 65536)
                    if not data:
                        selector.unregister(key.fileobj)
                        continue
                    total += len(data)
                    if total > request['output_bytes']:
                        error = 'output_limit'
                        break
                    key.data.write(data)
                    key.data.flush()
                if error:
                    break
    except BaseException as exc:
        error = type(exc).__name__+': '+str(exc)
    finally:
        if p is not None:
            try:
                os.killpg(p.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
            try:
                p.wait(timeout=2)
            except subprocess.TimeoutExpired:
                pass
            try:
                os.killpg(p.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
            p.wait()
            p.stdout.close()
            p.stderr.close()
    # Reports never determine whether the process actually succeeded.
    report = None
    try:
        candidate = json.loads((directory/'final.json').read_text())
        if valid_report(candidate, request['id']):
            report = candidate
        else:
            error = error or 'malformed_report'
    except (OSError, ValueError):
        error = error or 'missing_or_malformed_report'
    if p is None or p.returncode != 0:
        error = error or 'nonzero_exit'
    events_path = directory/'events.jsonl'
    if events_path.exists():
        for line in events_path.read_text(errors='replace').splitlines():
            try:
                event = json.loads(line)
                if isinstance(event, dict) and 'usage' in event:
                    usage.append(event['usage'])
            except ValueError:
                pass  # partial JSON stream is retained as evidence
    after = inventory()
    changes = {name: {'before': before.get(name), 'after': after.get(name)}
               for name in before.keys() | after.keys() if before.get(name) != after.get(name)}
    for name, change in changes.items():
        if change['after']:
            target = directory/'artifacts'/name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes((ROOT/name).read_bytes())
    result = {'evidence': 'bounded_worker_observation', 'transport': request['transport'],
        'classification': 'explicit_deterministic_transport_fixture' if request['transport'] == 'fixture' else 'live_gpt-6-astra_experimental_research',
        'request_id': request['id'], 'outcome': error or 'completed',
        'returncode': p.returncode if p else None, 'report': report,
        'started': started, 'finished': time.time(), 'elapsed_seconds': time.time()-started,
        'usage': usage, 'price': None, 'price_note': 'No provider invoice available; no invented monetary cost.',
        'changes': changes, 'mathematical_resolution': False}
    atomic(directory/'receipt.json', result)
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('directory', type=Path)
    args = parser.parse_args()
    execute(args.directory)


if __name__ == '__main__':
    main()
