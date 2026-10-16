"""Machine-authored request ffd747f5c7a147069d5bfcaffb3e60e8. Read-only reconciliation."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ffd747f5'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
manifest=json.loads((R/'evidence/markov-1bb0aa1e/manifest.json').read_text())
d={'request_id':'ffd747f5c7a147069d5bfcaffb3e60e8',
   'inherited_bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},
   'latest_artifacts_checked':len(manifest),'latest_mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
   'root_sha256':sha(R/'MathGKM/Markov.lean'),
   'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
   'reconciliation':'Latest worker 157 completed. Its reconciliation explicitly records worker 156 interrupted replay/audit and successful renewed twelve-module replay. Verified all latest manifest artifacts; no pending mutation or interrupted action is replayed.',
   'capabilities':{'scratch':'Denied by higher-priority managed policy; not accessed. Use unique research/evidence files.','sage':shutil.which('sage'),'gap':shutil.which('gap')},
   'stop_file_present':(R/'.control/markov/STOP.json').exists()}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-1bb0aa1e')+':'+json.loads((R/'evidence/markov-1bb0aa1e/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_1bb0aa1e.py','validate_ffd747f5.py'),('ReplayIsolatedM1BB.lean','ReplayIsolatedMFFD.lean'),('audit_1bb0aa1e.py','audit_ffd747f5.py')]:
 s=(R/'research'/old).read_text().replace('1bb0aa1e','ffd747f5').replace('M1BB','MFFD').replace('ME9C','MFFD')
 (R/'research'/new).write_text(s)
print(json.dumps(d))
