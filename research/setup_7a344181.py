"""Machine-authored live worker 7a344181. Read-only inherited reconciliation."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-7a344181'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-db238071/manifest.json').read_text())
rec={'bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},'predecessor_artifacts':len(man),'mismatches':[p for p,h in man.items() if sha(R/p)!=h], 'root_sha256':sha(R/'MathGKM/Markov.lean'),'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),'stop_file_present':(R/'.control/markov/STOP.json').exists(),'capabilities':{'scratch':'Denied by developer policy; not accessed; new durable research/evidence paths used.','sage':shutil.which('sage'),'gap':shutil.which('gap'),'Singular':shutil.which('Singular')},'reconciliation':'Completed predecessor 166 inspected; unvalidated whole-product/closure candidates are not results and are not replayed. Interrupted 156 already reconciled by predecessor; raw final events inspected again.'}
for k in ['000166','000156']:
 p=R/'.control/markov/workers'/k/'events.jsonl'
 events=[json.loads(s) for s in p.read_text().splitlines()]
 rec[k]={'event_sha256':sha(p),'last_events':events[-3:]}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-db238071')+':'+json.loads((R/'evidence/markov-db238071/inherited-lean-path.json').read_text())))
for old,new in [('validate_db238071.py','validate_7a344181.py'),('ReplayIsolatedMDB2.lean','ReplayIsolatedM7A3.lean'),('audit_db238071.py','audit_7a344181.py')]:
 (R/'research'/new).write_text((R/'research'/old).read_text().replace('db238071','7a344181').replace('MDB2','M7A3'))
print(json.dumps({k:v for k,v in rec.items() if not k.startswith('000')},indent=2))
for k in ['000166','000156']:print(k,json.dumps(rec[k])[-5000:])
