"""Machine-authored live request 55306a3b34a648a9ba6d7e685f9d40d6."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-55306a3b'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d={'request_id':'55306a3b34a648a9ba6d7e685f9d40d6','inherited':{}}
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 d['inherited'][p]=sha(R/p)==v['sha256']
for tag in ['37bf1d20','f1e4fe3b']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 d[tag]={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000139']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-3:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Interrupted worker 136 completed final artifacts before timeout; worker 137 had no effects. Latest worker 139 completed. Inspected raw final events and checked recorded changes; no old side effect replayed.'
d['capabilities']={'scratch':'denied by higher-priority policy; never accessed; durable evidence used','shell_heredoc':'failed because shell cannot create its temporary file; subsequent scripts use durable files','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-37bf1d20')+':'+json.loads((R/'evidence/markov-37bf1d20/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_37bf1d20.py','validate_55306a3b.py'),('audit_37bf1d20.py','audit_55306a3b.py'),('ReplayIsolatedM37B.lean','ReplayIsolatedM553.lean')]:
 s=(R/'research'/old).read_text().replace('37bf1d20','55306a3b').replace('M37B','M553')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in d.items() if not k.startswith('000')}))
