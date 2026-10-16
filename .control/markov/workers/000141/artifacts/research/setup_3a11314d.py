"""Machine-authored live research request 3a11314d099d45f1bab6c685fa152e7b."""
from pathlib import Path
import json,hashlib,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-3a11314d'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d={'request_id':'3a11314d099d45f1bab6c685fa152e7b','inherited':{}}
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 d['inherited'][p]=sha(R/p)==v['sha256']
m=json.loads((R/'evidence/markov-55306a3b/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000140']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Worker 136 final artifacts preceded timeout; worker 137 no effects; latest 140 completed. Inspected recorded changes and raw final events. No side effects replayed.'
d['capabilities']={'scratch':'Denied by higher-priority policy, not accessed. Durable unique research/evidence files used.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-55306a3b')+':'+json.loads((R/'evidence/markov-55306a3b/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_55306a3b.py','validate_3a11314d.py'),('audit_55306a3b.py','audit_3a11314d.py'),('ReplayIsolatedM553.lean','ReplayIsolatedM3A1.lean')]:
 s=(R/'research'/old).read_text().replace('55306a3b','3a11314d').replace('M553','M3A1')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in d.items() if not k.startswith('000')}))
