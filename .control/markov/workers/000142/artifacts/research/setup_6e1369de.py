"""Machine-authored live request 6e1369de81764210b3799e9af43f1bb5."""
from pathlib import Path
import json,hashlib,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-6e1369de'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d={'request_id':'6e1369de81764210b3799e9af43f1bb5','inherited':{}}
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 d['inherited'][p]=sha(R/p)==v['sha256']
m=json.loads((R/'evidence/markov-3a11314d/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000141']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Interrupted 136 and stopped 137 effects checked against final receipts and raw final events; latest 141 completed. No mutation replayed.'
d['capabilities']={'scratch':'Denied by higher-priority policy; not accessed. Unique durable research/evidence files used.','heredoc':'zsh heredoc failed creating denied temporary file; switched to source files.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-3a11314d')+':'+json.loads((R/'evidence/markov-3a11314d/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_3a11314d.py','validate_6e1369de.py'),('audit_3a11314d.py','audit_6e1369de.py'),('ReplayIsolatedM3A1.lean','ReplayIsolatedM6E1.lean')]:
 s=(R/'research'/old).read_text().replace('3a11314d','6e1369de').replace('M3A1','M6E1')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in d.items() if not k.startswith('000')}))
