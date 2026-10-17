"""Package retained neutral evidence, without running research or a compiler."""
import hashlib
import json
import os
from pathlib import Path
import re
import tarfile
import time

root = Path.cwd()
out = root/'evidence/neutral-validation'
def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()
def put(name, value):
    (out/name).write_text(json.dumps(value, indent=2)+'\n')

labels = ['round4-006', 'round4-selected-006', 'connected-006', 'context-006']
labels += sorted(p.stem for p in out.glob('*-007.json') if p.stem not in labels)
rows, roots, names = [], set(), set()
for label in labels:
    receipt = out/(label+'.json')
    if not receipt.exists():
        raise SystemExit('unfinished validation: '+label)
    row = json.loads(receipt.read_text())
    log = out/(label+'.log')
    text = log.read_text()
    counts = re.findall(r'Ran (\d+) tests? in', text)
    row.update(label=label, tests=int(counts[-1]) if counts else None)
    rows.append(row)
    if row['returncode'] == 0:
        names.update(re.findall(r'^test_\w+ \(([^)]+)\)', text, re.MULTILINE))
    roots.update(Path(p) for p in re.findall(r'RETAINED (.+)', text))
summary = {'phase': 'construction', 'time': time.time(), 'groups': rows,
    'passing_executed_tests': sum(r['tests'] or 0 for r in rows if r['returncode'] == 0),
    'distinct_passing_tests': len(names), 'passing_test_names': sorted(names),
    'unique_counts_note': 'Executed test counts; targeted repeated tests are not distinct new claims.',
    'scope': 'Neutral deterministic subprocess roles, actual Lean where identified. No live Astra campaign or mathematical conjecture campaign.'}
put('ROUND4_VALIDATION_SUMMARY.json', summary)

# Include extensionless history objects and watchdog/process inputs too. Only
# rebuildable compiler caches and symlinks are excluded; never delete originals.
artifacts = {}
for base in sorted(roots):
    for directory, dirs, files in os.walk(base, followlinks=False):
        dirs[:] = sorted(d for d in dirs if d not in ('.lake', 'build', '__pycache__')
                         and not (Path(directory)/d).is_symlink())
        for name in sorted(files):
            p = Path(directory)/name
            if p.is_symlink() or p.suffix in ('.olean', '.ilean', '.o', '.pyc', '.so', '.dylib'):
                continue
            artifacts[str(p.relative_to(root))] = sha(p)
put('ROUND4_RETAINED_ARTIFACT_MANIFEST.json', {'roots': [str(p.relative_to(root)) for p in sorted(roots)],
    'files_sha256': artifacts, 'scope': 'All retained test inputs, extensionless history objects, sources, requests, receipts and logs. No compiled cache required.'})
archive = out/'round4-neutral-artifacts.tar.gz'
with tarfile.open(archive, 'w:gz') as tar:
    for name in sorted(artifacts):
        tar.add(root/name, arcname=name, recursive=False)
put('ROUND4_ARCHIVE.json', {'path': str(archive.relative_to(root)), 'sha256': sha(archive),
    'bytes': archive.stat().st_size, 'files': len(artifacts),
    'reproduce': 'Extract only inside a review workspace; use the source manifests and exact commands. Absolute paths in historical receipts identify original runs, not portable launch paths.'})
print(json.dumps({'tests': summary['passing_executed_tests'], 'artifacts': len(artifacts),
    'archive_bytes': archive.stat().st_size, 'archive_sha256': sha(archive)}))
