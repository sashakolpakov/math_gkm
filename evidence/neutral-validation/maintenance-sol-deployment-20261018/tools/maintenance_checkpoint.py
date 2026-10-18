from pathlib import Path
import hashlib
import json
import sys

root = Path.cwd()
out = root/'evidence/neutral-validation/maintenance-sol-deployment-20261018'
out.mkdir(exist_ok=True)
stage = sys.argv[1] if len(sys.argv) > 1 else 'input'
(out/stage).mkdir(exist_ok=False)
files = [Path(n) for n in ('MISSION.md', 'docs/DESIGN.md', 'docs/REQUIREMENT_MAP.md',
    'docs/STUDY_V2.md', 'lakefile.toml', 'lake-manifest.json', 'lean-toolchain', 'studies/v2-study.json')]
files += sorted(Path('machinery').glob('*.py')) + sorted(Path('tests').glob('*.py'))
files += sorted(Path('MathGKM').glob('*.lean'))
files += sorted(Path('studies').glob('v2-study-*.json'))
if Path('docs/DEPLOYMENT_PREFLIGHT.md').exists():
    files.append(Path('docs/DEPLOYMENT_PREFLIGHT.md'))
manifest = {}
for rel in files:
    data = (root/rel).read_bytes()
    manifest[str(rel)] = hashlib.sha256(data).hexdigest()
    dst = out/stage/'sources'/rel
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    dst.chmod(0o444)
p = out/stage/'manifest.json'
p.write_text(json.dumps(manifest, indent=2)+'\n')
p.chmod(0o444)
for p in sorted((out/stage).rglob('*'), reverse=True):
    if p.is_dir():
        p.chmod(0o555)
(out/stage).chmod(0o555)
print(out, len(manifest))
