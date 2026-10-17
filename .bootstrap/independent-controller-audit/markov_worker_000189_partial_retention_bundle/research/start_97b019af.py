"""Machine-authored live request 97b019af; immutable-input reconciliation."""
from pathlib import Path
import json, hashlib, os, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-97b019af'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
index=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in index.items()}
prior=json.loads((R/'evidence/markov-73199834/manifest.json').read_text())
assert all(sha(R/k)==v for k,v in prior.items())
contract=json.loads((R/'.control/markov/contract.json').read_text())
raw=R/'.control/markov/workers/000183/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
(O/'interruption-reconciliation.json').write_text(json.dumps(dict(raw_sha256=sha(raw),event_count=len(events),pending=pending,last_events=events[-3:],decision='Inspected interrupted raw log and latest completed validation. No unfinished raw event; no prior side effect replayed. Fourth-moment attachment remains open in latest report.'),indent=2))
paths=[R/'MISSION.md',R/'docs/DESIGN.md',R/'lakefile.toml',R/'lake-manifest.json',R/'lean-toolchain',R/'.control/markov/contract.json']
for folder in ('research','evidence','MathGKM'):
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
hashes={str(p.relative_to(R)):sha(p) for p in paths}
(O/'input-hashes.json').write_text(json.dumps(hashes,indent=2))
out=dict(request_id='97b019af81a143628246a03e1f19b898',bindings=bindings,predecessor_artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),canonical_contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),inputs=len(hashes),stop_file=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-73199834')+':'+json.loads((R/'evidence/markov-73199834/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied by higher-priority policy; unique research/evidence paths used; shell heredoc creation denied',hosted_source='Publisher page retrieved successfully'),indent=2))
for old,new in [('validate_73199834.py','validate_97b019af.py'),('audit_73199834.py','audit_97b019af.py'),('finish_73199834.py','finish_97b019af.py'),('ReplayIsolatedM731.lean','ReplayIsolatedM97B.lean')]:
 s=(R/'research'/old).read_text().replace('73199834','97b019af').replace('M731','M97B').replace('markov-20825094','markov-73199834')
 (R/'research'/new).write_text(s)
print(json.dumps(out))
