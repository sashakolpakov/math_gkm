"""Machine-authored request 4687d03ffe8948abad1b235a519bed69. Read-only reconciliation."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-4687d03f'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
manifest=json.loads((R/'evidence/markov-ffd747f5/manifest.json').read_text())
d={'request_id':'4687d03ffe8948abad1b235a519bed69',
   'inherited_bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},
   'latest_artifacts_checked':len(manifest),'latest_mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
   'root_sha256':sha(R/'MathGKM/Markov.lean'),
   'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
   'reconciliation':'Latest worker 158 completed. Read its raw-final-event reconciliation of interrupted worker 156: replay/audit timed out, and worker 157 completed those checks. Latest artifacts verified. No interrupted side effect replayed.',
   'capabilities':{'scratch':'Denied by managed policy; not accessed. Unique research/evidence paths used. Shell heredoc failed because temporary creation is denied; no file was created.','sage':shutil.which('sage'),'gap':shutil.which('gap')},
   'stop_file_present':(R/'.control/markov/STOP.json').exists()}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-ffd747f5')+':'+json.loads((R/'evidence/markov-ffd747f5/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_ffd747f5.py','validate_4687d03f.py'),('ReplayIsolatedMFFD.lean','ReplayIsolatedM468.lean'),('audit_ffd747f5.py','audit_4687d03f.py')]:
 s=(R/'research'/old).read_text().replace('ffd747f5','4687d03f').replace('MFFD','M468')
 (R/'research'/new).write_text(s)
print(json.dumps(d))
