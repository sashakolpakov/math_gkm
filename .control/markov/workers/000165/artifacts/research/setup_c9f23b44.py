"""Machine-authored c9f23b44: immutable boundary and reconciliation."""
from pathlib import Path
import json,hashlib,os,shutil
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c9f23b44';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-ad504da6/manifest.json').read_text())
rec=dict(request_id='c9f23b44907d4f9aa7cfc15e4a2c4b47',bindings={p:sha(R/p)==v['sha256'] for p,v in idx.items()},predecessor_artifacts=len(man),mismatches=[p for p,h in man.items() if sha(R/p)!=h],root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),stop_file_present=(R/'.control/markov/STOP.json').exists(),reconciliation='Immediate predecessor 164 completed. Its failed expansions remain unvalidated; no inherited side effect replayed. Interrupted worker 156 effects already reconciled by subsequent workers; raw final events inspected again below.',capabilities={'scratch':'Denied by managed policy; not accessed. Unique research/evidence files used.','shell_heredoc':'Failed before execution: cannot create temporary file. Use durable script files.','sage':shutil.which('sage'),'gap':shutil.which('gap'),'Singular':shutil.which('Singular')})
raw=R/'.control/markov/workers/000156/events.jsonl'
ev=[json.loads(s) for s in raw.read_text().splitlines()]
rec['interrupted_events']={'sha256':sha(raw),'last_events':ev[-5:]}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-ad504da6')+':'+json.loads((R/'evidence/markov-ad504da6/inherited-lean-path.json').read_text())))
for old,new in [('validate_ad504da6.py','validate_c9f23b44.py'),('ReplayIsolatedMAD5.lean','ReplayIsolatedMC9F.lean'),('audit_ad504da6.py','audit_c9f23b44.py')]:
 (R/'research'/new).write_text((R/'research'/old).read_text().replace('ad504da6','c9f23b44').replace('MAD5','MC9F'))
print(json.dumps({k:v for k,v in rec.items() if k!='interrupted_events'},indent=2))
print(json.dumps(ev[-5:])[-7000:])
print('Inheritance keys:',list(idx))
