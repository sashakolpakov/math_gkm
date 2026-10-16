"""Machine-authored live request 58e5700333bc4922a9949ab13f9bac6f."""
from pathlib import Path
import json,hashlib,shutil,os
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-58e57003'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d={'request_id':'58e5700333bc4922a9949ab13f9bac6f','inherited':{}}
index=json.loads((R/'.control/markov/inherited.json').read_text())
for p,v in index.items():
 d['inherited'][p]=sha(R/p)==v['sha256']
 # Decode the full inherited index into a readable new artifact.
(O/'inherited-decoded.txt').write_text('\n\n'.join(p+'\n'+v['content'] for p,v in index.items()))
m=json.loads((R/'evidence/markov-6e1369de/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000142']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Interrupted 136, stopped 137 and completed predecessor 142 inspected; no inherited mutation replayed.'
d['capabilities']={'scratch':'Higher-priority policy denies access; use unique durable research/evidence artifacts.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-6e1369de')+':'+json.loads((R/'evidence/markov-6e1369de/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_6e1369de.py','validate_58e57003.py'),('audit_6e1369de.py','audit_58e57003.py'),('ReplayIsolatedM6E1.lean','ReplayIsolatedM58E.lean')]:
 s=(R/'research'/old).read_text().replace('6e1369de','58e57003').replace('M6E1','M58E')
 (R/'research'/new).write_text(s)
print(json.dumps(d,indent=2))
