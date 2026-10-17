"""Replay only the observer on this invocation's finished neutral test data."""
import hashlib
import json
from pathlib import Path
import re
import sys
import time
import xml.etree.ElementTree as ET
sys.path.insert(0, str(Path.cwd()))
from machinery.study_burden import report

root = Path.cwd()
out = root/'evidence/neutral-validation'
manifest = out/'pre-007/SOURCE_MANIFEST.json'
pins = json.loads(manifest.read_text())['files_sha256']
def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()
def verify():
    assert all(sha(root/p) == h for p,h in pins.items()), 'source changed'
verify()
source_log = out/'connected-006.log'
base = Path(re.findall(r'RETAINED (.+)', source_log.read_text())[0])/'connected'
label = sys.argv[1] if len(sys.argv) > 1 else 'round4-observer-replay'
destination = out/(label+'-plots')
before = {str(p): sha(p) for arm in ('baseline','exploration') for p in
    (base/'arms'/arm).rglob('*.json') if 'audit' not in p.parts}
start = time.monotonic()
observed = report(base, destination)
rows = json.loads((destination/'raw.json').read_text())
pairs = json.loads((destination/'conditional-paired.json').read_text())
assert len(rows) == 12
assert len([r for r in rows if r['key'] == 'terminal' and r['status'] == 'missing_scheduled_checkpoint']) == 2
assert all(sha(Path(p)) == h for p,h in before.items()), 'observer changed research data'
assert all(p['status'] == 'missing_scheduled_checkpoint' for p in pairs if p['after'] == 'terminal')
known = [p for p in pairs if p['status'] == 'audit_only' and p['arm'] == 'exploration']
assert len(known) == 4
assert len({p['reference_binding'] for p in known}) == 1
assert all(p['enlargement'] for p in known)
assert any(p['per_witness_pairs'] for p in known)
for name in ('conditional-descriptions.svg','overhead.svg','costs.svg'):
    ET.parse(destination/name)
    assert '<circle' in (destination/name).read_text()
verify()
record = {'command': ['/opt/homebrew/bin/python3','.scratch/audit_round4.py', *sys.argv[1:]],
    'returncode': 0, 'scope': 'standalone current-source observer on finished neutral data; no research resumed',
    'elapsed_seconds': time.monotonic()-start, 'source_manifest_sha256': sha(manifest),
    'script_sha256': sha(Path(__file__)), 'input_log_sha256': sha(source_log),
    'assertion_evaluations': 13, 'svg_parse_checks': 3, 'result': observed,
    'outputs': {p.name: sha(p) for p in destination.iterdir() if p.is_file()}}
(out/(label+'.json')).write_text(json.dumps(record, indent=2)+'\n')
print(json.dumps(record))
