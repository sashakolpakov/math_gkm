"""External invocation recorder only; not the research machine implementation."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import selectors
import signal
import subprocess
import time

ROOT = Path('/Users/sasha/math_gkm/.scratch/strategy-v2-20261017')
PROFILE = ROOT / '.bootstrap' / 'base-permissions.json'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inline(value):
    if isinstance(value, dict):
        return '{' + ','.join(json.dumps(k) + '=' + inline(v) for k, v in value.items()) + '}'
    return json.dumps(value)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--round', type=int, required=True)
    parser.add_argument('--seconds', type=int, default=1200)
    parser.add_argument('--feedback', type=Path)
    parser.add_argument('--task-prompt', type=Path)
    args = parser.parse_args()
    assert 1 <= args.round <= 100 and 1 <= args.seconds <= 1800
    directory = ROOT / '.bootstrap' / f'round-{args.round:04d}'
    directory.mkdir(parents=True, exist_ok=False)
    (directory / 'launcher.py').write_bytes(Path(__file__).read_bytes())
    profile = json.loads(PROFILE.read_text())
    profile['filesystem'][':workspace_roots'].update({
        'MISSION.md': 'read', 'docs/DESIGN.md': 'read',
        'lean-toolchain': 'read', 'lake-manifest.json': 'read',
        'lakefile.toml': 'read', '.lake/packages': 'read'})
    schema = {'type': 'object', 'properties': {
        'phase': {'type': 'string', 'enum': ['construction', 'agoh', 'markov']},
        'summary': {'type': 'string'},
        'files_changed': {'type': 'array', 'items': {'type': 'string'}},
        'checks': {'type': 'array', 'items': {'type': 'string'}},
        'remaining': {'type': 'array', 'items': {'type': 'string'}},
        'next_step': {'type': 'string'}},
        'required': ['phase', 'summary', 'files_changed', 'checks', 'remaining', 'next_step'],
        'additionalProperties': False}
    (directory / 'schema.json').write_text(json.dumps(schema, indent=2) + '\n')
    (directory / 'permissions.json').write_text(json.dumps(profile, indent=2) + '\n')
    prompt = '''You are the actual Codex/Astra proposer and builder for a clean machine-led mathematical-research project.
The user requires YOU to rebuild its machinery, then formalize the Agoh paper, then attack the Markov conjecture. No predecessor implementation, theorem, result, or proof strategy is supplied. Read MISSION.md and docs/DESIGN.md completely before implementing. These requirements are fixed and read-only.

This is a real work invocation, not a request for another proposal or permission. Create and test executable machinery and Lean proofs in this workspace. You have shell tools and hosted live web search. Read pinned Mathlib as needed. Python and GAP may be available; discover capabilities honestly. Shell networking is disabled; use hosted search for literature. Temporary files must stay inside the workspace (create a .scratch directory as needed). Dependencies are read-only; do not run package updates or cache downloads. Git's unrelated system and user configurations are disabled with GIT_CONFIG_NOSYSTEM=1 and GIT_CONFIG_GLOBAL=/dev/null; retain those settings when invoking Lake. The login shell may reset PATH to Apple wrappers that cannot run in this sandbox. Use /opt/homebrew/bin/python3 explicitly and prefix Lake calls with env PATH=/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin to select Homebrew Git.

Start with construction, including its operational semantics, proof gate, action interface, and self-rewrite obligations. Individual mathematical results may be checked during experimental bootstrap; full certified-switch completion is not a prerequisite for every mathematical action. Do not skip to the paper merely because code compiles. A claimed full Gödel switch must connect the actual running code to its checked whole-continuation comparison, including future self-rewrites and resource costs. If that is incomplete, explicitly record the gap and keep working on construction. Avoid hand-built finite outcome tables masquerading as this comparison. No exact Kolmogorov computation or description-length reward; no manufactured mathematical levels.

Exploratory additions are bootstrap candidates until independently checked. A natural-language report cannot certify installation. The immutable reference requirements and mathematical target may not be weakened. Do not use sorry, admit, custom axioms, native_decide, or a global assumed self-soundness theorem. Preserve every genuinely proved result, track actual dependencies, and supply negative examples for missing conditions. A generic theorem that assumes the desired utility improvement does not discharge the concrete obligation.

Work autonomously and leave durable progress notes and resumable state for subsequent invocations. Do not start an unbounded background service. Do not call external LLM APIs or nested Codex processes from your code in this bootstrap invocation: you are the authorized proposer call; implement such interfaces but test them with explicitly labeled fixtures until the supervisor activates them. Do not contact people or publish. Do not read or modify .git. The supervisor records local commits and audits results without supplying mathematical solutions. Do not access external project trees, predecessor archives, old session memories, or arbitrary home files.

At the end return the required JSON. List remaining gaps candidly, and identify exact evidence files. Do not claim the overall mission complete unless all its required work was actually done.
'''
    if args.task_prompt:
        prompt = args.task_prompt.read_text()
    prompt += f'\nThis proposer invocation has a hard wall-clock limit of {args.seconds} seconds. Persist useful checkpoints during the work and leave resumable state before the limit.\n'
    if args.feedback:
        prompt += '\nSUPERVISOR AUDIT FEEDBACK (requirements/correctness only, not a supplied solution):\n' + args.feedback.read_text()
    (directory / 'prompt.txt').write_text(prompt)
    inputs = {}
    excluded = {'.git', '.lake', '.bootstrap', '.scratch', '__pycache__'}
    for folder, dirs, files in os.walk(ROOT, followlinks=False):
        dirs[:] = [d for d in dirs if d not in excluded]
        for name in dirs + files:
            p = Path(folder) / name
            if p.is_symlink():
                raise RuntimeError('refusing candidate symlink in input manifest: ' + str(p.relative_to(ROOT)))
        for name in files:
            p = Path(folder) / name
            inputs[str(p.relative_to(ROOT))] = sha(p)
    (directory / 'input-manifest.json').write_text(json.dumps(inputs, indent=2, sort_keys=True) + '\n')
    shell_environment = {
        'PATH': '/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin:/usr/sbin:/sbin',
        'HOME': '/Users/sasha', 'LANG': 'en_US.UTF-8',
        'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null',
        'TMPDIR': str(ROOT / '.scratch')}
    (ROOT / '.scratch').mkdir(exist_ok=True)
    command = ['/opt/homebrew/bin/codex', '--no-daemon', '-a', 'never', 'exec',
               '--model', 'gpt-6.1-sol', '--ephemeral', '--ignore-user-config',
               '--skip-git-repo-check', '--json', '--color', 'never', '-C', str(ROOT),
               '-c', 'default_permissions="cleanroom"',
               '-c', 'permissions.cleanroom=' + inline(profile),
               '-c', 'web_search="live"', '-c', 'model_reasoning_effort="high"',
               '-c', 'shell_environment_policy.inherit="none"',
               '-c', 'shell_environment_policy.set=' + inline(shell_environment),
               '--output-schema', str(directory / 'schema.json'),
               '--output-last-message', str(directory / 'final.json')]
    for key in ['features.memories', 'memories.use_memories', 'memories.generate_memories',
                'features.apps', 'features.plugins', 'features.remote_plugin', 'features.hooks',
                'features.browser_use', 'features.computer_use', 'features.shell_snapshot']:
        command += ['-c', key + '=false']
    command += ['-c', 'features.skip_host_skill_discovery=true', '-c', 'project_doc_max_bytes=0', '-']
    (directory / 'command.json').write_text(json.dumps(command, indent=2) + '\n')
    started = time.monotonic()
    error = None
    process = None
    sizes = {'events.jsonl': 0, 'stderr.log': 0}
    try:
        environment = os.environ.copy()
        environment.update({'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null'})
        (directory / 'environment-overrides.json').write_text(json.dumps({'host_overrides': {'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null'}, 'tool_inherit': 'none', 'tool_environment': shell_environment}, indent=2) + '\n')
        process = subprocess.Popen(command, cwd=ROOT, env=environment, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE, start_new_session=True)
        process.stdin.write(prompt.encode())
        process.stdin.close()
        with selectors.DefaultSelector() as selector, (directory / 'events.jsonl').open('wb') as events, (directory / 'stderr.log').open('wb') as errors:
            selector.register(process.stdout, selectors.EVENT_READ, ('events.jsonl', events))
            selector.register(process.stderr, selectors.EVENT_READ, ('stderr.log', errors))
            while selector.get_map():
                if time.monotonic() - started > args.seconds:
                    raise TimeoutError('bounded proposer invocation timed out')
                for key, _ in selector.select(0.2):
                    data = os.read(key.fileobj.fileno(), 65536)
                    if not data:
                        selector.unregister(key.fileobj)
                        continue
                    name, stream = key.data
                    sizes[name] += len(data)
                    if sizes[name] > 32 * 1024 * 1024:
                        raise RuntimeError('proposer event output exceeded recording limit')
                    stream.write(data)
                    stream.flush()
            process.wait(timeout=5)
    except BaseException as exc:
        error = type(exc).__name__ + ': ' + str(exc)
    finally:
        if process is not None:
            try:
                os.killpg(process.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
            try:
                process.wait(timeout=3)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
            # The parent may have exited while descendants kept inherited pipes.
            try:
                os.killpg(process.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
    receipt = {'model_requested': 'gpt-6.1-sol', 'round': args.round,
               'seconds': round(time.monotonic() - started, 3), 'error': error,
               'exit_code': process.returncode if process is not None else None,
               'classification': 'machine-authored experimental bootstrap; no automatic switch certification',
               'artifacts': {p.name: sha(p) for p in directory.iterdir() if p.is_file()}}
    (directory / 'receipt.json').write_text(json.dumps(receipt, indent=2, sort_keys=True) + '\n')
    print(json.dumps({k: v for k, v in receipt.items() if k != 'artifacts'}, indent=2), flush=True)
    if (directory / 'final.json').exists():
        print((directory / 'final.json').read_text(), flush=True)
    return 0 if error is None and receipt['exit_code'] == 0 else 1


if __name__ == '__main__':
    raise SystemExit(main())
