"""Machine-authored live request daba8bcf97ae4038b0d8ea8a63d4a71e."""
from pathlib import Path
import json, hashlib, shutil, os
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-daba8bcf'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
manifest=json.loads((R/'evidence/markov-4687d03f/manifest.json').read_text())
d={'request_id':'daba8bcf97ae4038b0d8ea8a63d4a71e',
 'inherited_bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},
 'latest_artifacts_checked':len(manifest),'latest_mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
 'root_sha256':sha(R/'MathGKM/Markov.lean'),
 'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 'reconciliation':'Latest worker 159 completed; its artifacts verified. Its operational report records reconciliation and completed validation of older interrupted effects. No pending interrupted action replayed.',
 'capabilities':{'scratch':'Denied by higher-priority managed policy; not accessed. Unique research/evidence paths used.','sage':shutil.which('sage'),'gap':shutil.which('gap')},
 'stop_file_present':(R/'.control/markov/STOP.json').exists()}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-4687d03f')+':'+json.loads((R/'evidence/markov-4687d03f/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_4687d03f.py','validate_daba8bcf.py'),('ReplayIsolatedM468.lean','ReplayIsolatedMDAB.lean'),('audit_4687d03f.py','audit_daba8bcf.py')]:
 s=(R/'research'/old).read_text().replace('4687d03f','daba8bcf').replace('M468','MDAB')
 (R/'research'/new).write_text(s)
print(json.dumps(d))
