"""Machine-authored live mathematical worker; immutable research-only bookkeeping."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-7e2e958e'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
manifest=json.loads((R/'evidence/markov-ae9e841e/manifest.json').read_text())
d={'request_id':'7e2e958e791546e6988c1db8eaecb1c3','inherited_bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},'predecessor_artifacts':len(manifest),'mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],'root_sha256':sha(R/'MathGKM/Markov.lean'),'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),'reconciliation':'Worker 161 completed with explicit null completion. Read latest operational, mathematical and next-step reports. Earlier interrupted effects were reconciled in inherited reports. No pending side effect from worker 161 and none replayed. Optional older kernel-limit candidate remains unvalidated and unused.','capabilities':{'scratch':'Denied by higher-priority policy; not accessed. Unique research/evidence paths used.','sage':shutil.which('sage'),'gap':shutil.which('gap')},'stop_file_present':(R/'.control/markov/STOP.json').exists()}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-ae9e841e')+':'+json.loads((R/'evidence/markov-ae9e841e/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_ae9e841e.py','validate_7e2e958e.py'),('ReplayIsolatedMAE9.lean','ReplayIsolatedM7E2.lean'),('audit_ae9e841e.py','audit_7e2e958e.py')]:
 s=(R/'research'/old).read_text().replace('ae9e841e','7e2e958e').replace('MAE9','M7E2')
 (R/'research'/new).write_text(s)
print(json.dumps(d))
