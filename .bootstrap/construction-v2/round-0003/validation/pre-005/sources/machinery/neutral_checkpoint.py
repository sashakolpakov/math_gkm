"""Static-only checkpoint: never import candidate code or run tests."""
import ast
import hashlib
import json
from pathlib import Path
import sys
from datetime import datetime, timezone

root = Path.cwd()
out = root/'evidence/neutral-validation'/sys.argv[1]
out.mkdir(parents=True, exist_ok=False)
files = [p for folder in ('machinery', 'tests', 'MathGKM', 'docs', 'contracts', 'studies')
         for p in (root/folder).glob('*') if p.is_file() and p.suffix in ('.py','.lean','.md','.json')]
files += [root/n for n in ('MISSION.md','lean-toolchain','lakefile.toml','lake-manifest.json')]
files += list((root/'.bootstrap/review-round2').glob('*.md'))
files += [root/'.bootstrap/supervisor-review/requirements.md']
hashes, errors = {}, []
for path in sorted(files):
    name = str(path.relative_to(root))
    raw = path.read_bytes()
    hashes[name] = hashlib.sha256(raw).hexdigest()
    if path.suffix == '.py':
        try:
            ast.parse(raw, filename=name)
        except SyntaxError as exc:
            errors.append(str(exc))
    destination = out/'sources'/name
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes(raw)
    destination.chmod(0o444)
record = {'phase': 'construction', 'time': datetime.now(timezone.utc).isoformat(),
    'validation': 'PRE-VALIDATION; no tests on this checkpoint yet',
    'files_sha256': hashes, 'static_parse_errors': errors,
    'review': sys.argv[2], 'source_review': 'Builder reviewed all changed producer/artifact/consumer edges against final independent review. No mathematical strategy supplied.'}
path = out/'SOURCE_MANIFEST.json'
path.write_text(json.dumps(record, indent=2)+'\n')
hashed = hashlib.sha256(path.read_bytes()).hexdigest()
(out/'SOURCE_MANIFEST.sha256').write_text(hashed+'  SOURCE_MANIFEST.json\n')
path.chmod(0o444)
print(json.dumps({'manifest': str(path.relative_to(root)), 'sha256': hashed, 'files': len(hashes), 'errors': errors}))
if errors:
    sys.exit(1)
