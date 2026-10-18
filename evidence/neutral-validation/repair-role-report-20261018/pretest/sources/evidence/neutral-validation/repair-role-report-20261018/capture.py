"""Machine-authored, scoped source checkpoint; no imports of candidate machinery."""
import ast
import hashlib
import json
from pathlib import Path
import sys
from datetime import datetime, timezone

root = Path.cwd()
base = root / 'evidence/neutral-validation/repair-role-report-20261018'
out = base / sys.argv[1]
out.mkdir(exist_ok=False)
files = sorted((root / 'machinery').glob('*.py')) + sorted((root / 'tests').glob('*.py'))
files += [root / p for p in (
    'MISSION.md', 'docs/DESIGN.md', 'docs/REQUIREMENT_MAP.md', 'docs/STUDY_V2.md',
    'docs/REGRESSION.md', 'lean-toolchain', 'lakefile.toml', 'lake-manifest.json',
    '.bootstrap/base-permissions.json', 'MathGKM/HarnessFixture.lean',
    'MathGKM/Protocol.lean', 'MathGKM/ResearchSemantics.lean',
    'MathGKM/ContinuationObligations.lean')]
files += [p for p in (base / 'capture.py', base / 'AFFECTED_PATH_AUDIT.md') if p.exists()]
hashes = {}
for path in files:
    name = str(path.relative_to(root))
    raw = path.read_bytes()
    if path.suffix == '.py':
        ast.parse(raw, filename=name)
    hashes[name] = hashlib.sha256(raw).hexdigest()
    target = out / 'sources' / name
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(raw)
    target.chmod(0o444)
manifest = {'phase': 'construction', 'checkpoint': sys.argv[1],
    'time': datetime.now(timezone.utc).isoformat(), 'files_sha256': hashes,
    'scope': 'Current machinery/tests, required docs, neutral foundations and pins only; no study or old research contents.',
    'provenance': 'Machine-authored by the sole authorized builder invocation; no nested models.',
    'static_parse_errors': []}
path = out / 'SOURCE_MANIFEST.json'
path.write_text(json.dumps(manifest, indent=2) + '\n')
path.chmod(0o444)
print(json.dumps({'manifest': str(path.relative_to(root)),
    'sha256': hashlib.sha256(path.read_bytes()).hexdigest(), 'files': len(hashes)}))
