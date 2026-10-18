"""Invocation-local immutable source checkpoint; no Git or archive traversal."""
from pathlib import Path
import hashlib
import json
import sys

root = Path.cwd()
out = root/'evidence/neutral-validation/maintenance-path-sol-20261018'
stage = out/sys.argv[1]
stage.mkdir(parents=True, exist_ok=False)
files = [p for group in ('machinery/*.py', 'tests/*.py', 'docs/*.md',
         'studies/*.json', 'MathGKM/*.lean') for p in root.glob(group)]
files += [root/n for n in ('MISSION.md', 'lakefile.toml', 'lake-manifest.json', 'lean-toolchain')]
files += list((out/'tools').glob('*.py'))
manifest = {}
for p in sorted(set(files)):
    rel = p.relative_to(root)
    data = p.read_bytes()
    manifest[str(rel)] = hashlib.sha256(data).hexdigest()
    dst = stage/'sources'/rel
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    dst.chmod(0o444)
p = stage/'manifest.json'
p.write_text(json.dumps(manifest, indent=2)+'\n')
p.chmod(0o444)
for p in sorted(stage.rglob('*'), reverse=True):
    if p.is_dir():
        p.chmod(0o555)
stage.chmod(0o555)
print(stage, len(manifest))
