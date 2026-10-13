"""Actual Codex/gpt-6-astra: reproduce Agoh with the pinned toolchain.
Run from the project root: /opt/homebrew/bin/python3 evidence/agoh/reproduce.py
No package resolution, downloads, or changes to dependency pins.
"""
import json
import os
from pathlib import Path
import subprocess

root = Path(__file__).resolve().parents[2]
toolchain = Path('/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2')
output = root / '.scratch/agoh'
env = os.environ.copy()
env['LEAN_PATH'] = ':'.join(map(str, [toolchain / 'lib/lean', output,
    root / '.scratch/construction'] + [p / '.lake/build/lib/lean'
    for p in sorted((root / '.lake/packages').iterdir())]))
records = []
for module in ['MathGKM.Foundations', 'MathGKM.Machine', 'MathGKM.Gluing',
               'MathGKM.Continuation', 'MathGKM.AgohExercise', 'MathGKM.AgohMain',
               'MathGKM.AgohConsequences', 'MathGKM.AgohAudit', 'MathGKM']:
    source = module.replace('.', '/') + '.lean'
    target = output / (module.replace('.', '/') + '.olean')
    target.parent.mkdir(parents=True, exist_ok=True)
    command = [str(toolchain / 'bin/lean'), '-o', str(target), source]
    result = subprocess.run(command, cwd=root, env=env, capture_output=True, text=True)
    record = dict(module=module, command=command, returncode=result.returncode,
                  stdout=result.stdout, stderr=result.stderr)
    records.append(record)
    (root / f'evidence/agoh/{module.split(".")[-1]}.log').write_text(result.stdout + result.stderr)
    (root / 'evidence/agoh/build.json').write_text(json.dumps(
        dict(lean_path=env['LEAN_PATH'], results=records), indent=2))
    print(f'{module}: exit {result.returncode}', flush=True)
    if result.returncode:
        print(result.stdout, result.stderr)
        raise SystemExit(result.returncode)
