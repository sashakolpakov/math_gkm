"""Machine-owned acceptance packaging; no research execution or gate changes."""
import ast
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path
import re
import tarfile

ROOT = Path.cwd()
OUT = ROOT/'evidence/neutral-validation'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def save(path, value):
    with path.open('x') as handle:
        handle.write(json.dumps(value, indent=2)+'\n')

groups = []
retained = set()
for path in sorted(OUT.glob('acceptance-*-*.json')):
    record = json.loads(path.read_text())
    if 'command' not in record or 'log' not in record:
        continue
    log = ROOT/record['log']
    assert sha(log) == record['log_sha256'], log
    raw = log.read_text()
    pending, outcomes = None, {}
    for line in raw.splitlines():
        match = re.match(r'^test\S+ \((tests\.[^)]+)\) \.\.\. (.*)$', line)
        if match:
            pending, suffix = match.groups()
            if suffix in ('ok', 'FAIL', 'ERROR'):
                outcomes[pending] = suffix
                pending = None
        elif pending and line.strip() in ('ok', 'FAIL', 'ERROR'):
            outcomes[pending] = line.strip()
            pending = None
    count = re.search(r'Ran (\d+) tests? in ', raw)
    if count:
        assert int(count[1]) == len(outcomes), (path, count[1], outcomes)
    retained.update(Path(p) for p in re.findall(r'RETAINED ([^\n]+)', raw))
    groups.append({**record, 'label': path.stem,
                   'tests_run': int(count[1]) if count else None,
                   'outcomes': outcomes, 'incomplete_test': pending})

selected = json.loads((OUT/'acceptance-discovery.json').read_text())
expected = set(sum(selected['groups'].values(), []))
passed = {n for r in groups for n, status in r['outcomes'].items() if status == 'ok'}
summary = {'phase': 'construction', 'groups': groups,
    'selected_distinct_tests': len(expected),
    'passing_test_executions': sum(s == 'ok' for r in groups for s in r['outcomes'].values()),
    'failed_test_executions': sum(s != 'ok' for r in groups for s in r['outcomes'].values()),
    'distinct_passing_tests': len(passed), 'missing_passing_tests': sorted(expected-passed),
    'source_mismatches_reported': {r['label']: r['source_mismatches_after'] for r in groups},
    'scope': 'Neutral deterministic roles; real Lean where identified; no live transport or campaign. Per-test unchanged-path disposition is in the report.'}
save(OUT/'ACCEPTANCE_VALIDATION_SUMMARY.json', summary)

# PureMechanisms retains its directories but does not print their names.
started = datetime.fromisoformat(json.loads((OUT/'acceptance-input/SOURCE_MANIFEST.json').read_text())['time']).timestamp()
retained.update(p for p in (ROOT/'.scratch').glob('revision-tests-*') if p.stat().st_mtime >= started)
files, links = {}, {}
for base in sorted(retained):
    assert base.is_relative_to(ROOT/'.scratch'), base
    for directory, dirs, names in os.walk(base, followlinks=False):
        directory = Path(directory)
        dirs[:] = [n for n in dirs if n not in ('.lake', 'build', '__pycache__')]
        for name in names:
            path = directory/name
            relative = str(path.relative_to(ROOT))
            if path.is_symlink():
                links[relative] = os.readlink(path)
            elif path.suffix not in ('.olean', '.ilean', '.o', '.so', '.dylib', '.pyc'):
                files[relative] = {'sha256': sha(path), 'bytes': path.stat().st_size}
archive = OUT/'acceptance-neutral-artifacts.tar.gz'
assert not archive.exists()
with tarfile.open(archive, 'w:gz') as tar:
    for name in sorted(files):
        tar.add(ROOT/name, arcname=name, recursive=False)
record = {'scope': 'Actual current neutral test inputs, source snapshots, extensionless history, requests, receipts and logs; compiled caches omitted and rebuildable from pins.',
    'directories': [str(p.relative_to(ROOT)) for p in sorted(retained)],
    'files': files, 'symlinks_not_archived': links,
    'archive': str(archive.relative_to(ROOT)), 'archive_sha256': sha(archive),
    'archive_bytes': archive.stat().st_size}
save(OUT/'ACCEPTANCE_RETAINED_ARTIFACT_MANIFEST.json', record)
print(json.dumps({k: summary[k] for k in ('selected_distinct_tests','passing_test_executions','failed_test_executions','distinct_passing_tests','missing_passing_tests')}))
print(json.dumps({'retained_directories': len(retained), 'retained_files': len(files), 'archive_sha256': record['archive_sha256']}))
