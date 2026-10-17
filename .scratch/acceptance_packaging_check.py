"""Bounded packaging checks; collection only, no additional Lean/model execution."""
import hashlib
import json
import os
from pathlib import Path
import shlex
import subprocess
import sys
import time
import unittest

root = Path.cwd()
sys.path.insert(0, str(root))
out = root/'evidence/neutral-validation'
manifest_path = out/'acceptance-pre-003/SOURCE_MANIFEST.json'
pins = json.loads(manifest_path.read_text())['files_sha256']
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
def mismatches():
    return [n for n,h in pins.items() if sha(root/n) != h]
assert not mismatches()
target = root/'.scratch/acceptance-install-validation.json'
assert not target.exists()
command = ['/opt/homebrew/bin/python3', '-m', 'machinery.study_manifest', '--out', str(target)]
started = time.time()
run = subprocess.run(command, cwd=root, env={**os.environ, 'PYTHONDONTWRITEBYTECODE':'1'},
                     capture_output=True, text=True, timeout=60)
log = out/'acceptance-packaging.log'
with log.open('x') as handle:
    handle.write('COMMAND '+json.dumps(command)+'\n'+run.stdout+run.stderr)
assert run.returncode == 0, run
manifest = json.loads(target.read_text())
source = {r['path']: r['sha256'] for r in manifest['source_files']}
assert len(source) == len(manifest['source_files'])
assert all(sha(root/n) == h for n,h in source.items())
assert set(pins) <= set(source)
assert sha(target) == sha(out/'acceptance-install-manifest.json')

loader = unittest.TestLoader()
def names(suite):
    for item in suite:
        if isinstance(item, unittest.TestSuite):
            yield from names(item)
        else:
            yield item.id()
selected = []
assert len(manifest['reproduce']) == 6
for command_line in manifest['reproduce'][1:]:
    argv = shlex.split(command_line)
    assert argv[:2] == ['/opt/homebrew/bin/python3', 'machinery/neutral_validate.py']
    selected.extend(names(loader.loadTestsFromNames(argv[4:])))
assert not loader.errors
discovery = json.loads((out/'acceptance-discovery.json').read_text())
assert len(selected) == len(set(selected)) == 49
assert set(selected) == set(sum(discovery['groups'].values(), []))
from machinery.study_manifest import generate
before = sha(target)
try:
    generate(target)
except FileExistsError:
    pass
else:
    raise AssertionError('existing evidence overwritten')
assert sha(target) == before
assert not mismatches()
record = {'scope': 'packaging CLI and static collection, not more test executions',
    'command': command, 'returncode': run.returncode, 'elapsed_seconds': time.time()-started,
    'manifest_sha256': sha(manifest_path), 'source_mismatches_after': mismatches(),
    'source_entries_verified': len(source), 'complete_distinct_selection': len(selected),
    'no_overwrite_negative': 'FileExistsError before mutation; bytes identical',
    'official_install_manifest_sha256': sha(out/'acceptance-install-manifest.json'),
    'log': str(log.relative_to(root)), 'log_sha256': sha(log),
    'script_sha256': sha(Path(__file__))}
with (out/'acceptance-packaging.json').open('x') as handle:
    handle.write(json.dumps(record, indent=2)+'\n')
print(json.dumps(record))
