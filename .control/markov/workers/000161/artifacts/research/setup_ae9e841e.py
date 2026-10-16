"""Machine-authored request ae9e841e98884e419ff8cadb546d21cc; no controller changes."""
from pathlib import Path
import json, hashlib, shutil, os
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ae9e841e'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
manifest=json.loads((R/'evidence/markov-daba8bcf/manifest.json').read_text())
d={'request_id':'ae9e841e98884e419ff8cadb546d21cc','inherited_bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},'latest_artifacts_checked':len(manifest),'latest_mismatches':[p for p,h in manifest.items() if sha(R/p)!=h], 'root_sha256':sha(R/'MathGKM/Markov.lean'), 'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(), 'reconciliation':'Worker 160 completed. Read its operational report and mathematical reports. Optional MarkovKernelLimitMDAB candidate had two timeouts, is unvalidated, and is not imported. No interrupted side effect replayed.', 'capabilities':{'scratch':'Denied by higher-priority managed policy; not accessed. Unique research/evidence files used.', 'heredoc':'zsh heredoc rejected: cannot create temporary file; switched to apply_patch.', 'sage':shutil.which('sage'),'gap':shutil.which('gap')},'stop_file_present':(R/'.control/markov/STOP.json').exists()}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-daba8bcf')+':'+json.loads((R/'evidence/markov-daba8bcf/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_daba8bcf.py','validate_ae9e841e.py'),('ReplayIsolatedMDAB.lean','ReplayIsolatedMAE9.lean'),('audit_daba8bcf.py','audit_ae9e841e.py')]:
 s=(R/'research'/old).read_text().replace('daba8bcf','ae9e841e').replace('MDAB','MAE9')
 (R/'research'/new).write_text(s)
print(json.dumps(d))
