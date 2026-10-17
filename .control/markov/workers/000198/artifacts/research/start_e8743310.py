"""Machine-authored live Markov research; records bindings, no controller changes."""
from pathlib import Path
import json, hashlib, os, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-e8743310'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] and hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256'] for k,v in idx.items()}
prior=json.loads((R/'evidence/markov-6738b4ea/manifest.json').read_text())
checks={k:sha(R/k)==h for k,h in prior.items()}
raw=R/'.control/markov/workers/000189/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
assert all(bindings.values()) and all(checks.values())
(O/'reconciliation.json').write_text(json.dumps(dict(bindings=bindings,predecessor_artifacts=checks,interrupted_log_sha256=sha(raw),event_count=len(events),pending=pending,last_event=events[-1],decision='Interrupted 000189 completed effects were already reconciled by successors. Latest artifacts match. No pending item is replayed; new staged certificate investigation.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-6738b4ea')+':'+json.loads((R/'evidence/markov-6738b4ea/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied by higher-priority policy; unique research/evidence paths used. Shell here-document failed because its temporary file is denied; using apply_patch and Python -c.',hosted_source='Publisher retrieval succeeded.',stop_file=(R/'.control/markov/STOP.json').exists()),indent=2))
for stem in ['validate','audit','finish']:
 s=(R/'research'/f'{stem}_6738b4ea.py').read_text().replace('6738b4ea','e8743310').replace('M673','ME87')
 if stem=='finish':s=s.replace('markov-9db2326d','markov-6738b4ea')
 (R/'research'/f'{stem}_e8743310.py').write_text(s)
s=(R/'research/ReplayIsolatedM673.lean').read_text().replace('M673','ME87')
(R/'research/ReplayIsolatedME87.lean').write_text(s)
print(json.dumps(dict(bindings=bindings,predecessor_count=len(prior),event_count=len(events),pending=pending,root_sha256=sha(R/'MathGKM/Markov.lean'))))
