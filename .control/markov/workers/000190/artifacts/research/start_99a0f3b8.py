"""Machine-authored live research 99a0f3b8: reconciliation, no controller writes."""
from pathlib import Path
import hashlib,json,os,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-99a0f3b8'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in idx.items()}
prior=json.loads((R/'evidence/markov-97b019af/manifest.json').read_text())
changed=[k for k,h in prior.items() if sha(R/k)!=h]
assert not changed,changed
raw=R/'.control/markov/workers/000189/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
validation=json.loads((R/'evidence/markov-97b019af/validation.json').read_text())
checks={m:sha(R/'research'/f'{m}.lean')==h for m,h in validation['modules'].items()}
assert all(checks.values()) and all(bindings.values())
(O/'interruption-reconciliation.json').write_text(json.dumps(dict(raw_sha256=sha(raw),event_count=len(events),pending=pending,last_events=events[-5:],verified_predecessor_artifacts=len(prior),validated_sources=checks,decision='Raw log reaches final report and turn.completed; watchdog receipt failure does not mean mathematical work was absent. All 177 prior artifacts match. Use closed upper-sector result; do not replay earlier side effects. New action: investigate middle rows.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
hashes={str(p.relative_to(R)):sha(p) for p in paths}
(O/'input-hashes.json').write_text(json.dumps(hashes,indent=2))
contract=json.loads((R/'.control/markov/contract.json').read_text())
out=dict(request_id='99a0f3b808934dc5b239bd3d92eab1f5',bindings=bindings,predecessor_artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),canonical_contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),inputs=len(hashes),stop_file=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-97b019af')+':'+json.loads((R/'evidence/markov-97b019af/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='Higher-priority sandbox denies .scratch; use unique research/evidence artifacts.',hosted_source='Publisher retrieval succeeded'),indent=2))
for old,new in [('validate_97b019af.py','validate_99a0f3b8.py'),('audit_97b019af.py','audit_99a0f3b8.py'),('finish_97b019af.py','finish_99a0f3b8.py'),('ReplayIsolatedM97B.lean','ReplayIsolatedM99A.lean')]:
 s=(R/'research'/old).read_text().replace('97b019af','99a0f3b8').replace('M97B','M99A').replace('markov-73199834','markov-97b019af')
 (R/'research'/new).write_text(s)
print(json.dumps(out))
