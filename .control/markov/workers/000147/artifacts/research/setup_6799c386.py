"""Machine-authored live research request 6799c3863d3d4155ab0184f7674d4702."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-6799c386'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
(O/'inherited-decoded.txt').write_text('\n\n'.join(p+'\n'+v['content'] for p,v in idx.items()))
d={'request_id':'6799c3863d3d4155ab0184f7674d4702','inherited':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
m=json.loads((R/'evidence/markov-ec6f4b83/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000146']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Inspected interrupted workers 136/137 and completed predecessor 146, including raw event tails and actual effects. No old side effect replayed.'
d['capabilities']={'scratch':'Higher-priority policy denies access; durable unique research/evidence paths used.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file(): snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-ec6f4b83')+':'+json.loads((R/'evidence/markov-ec6f4b83/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_ec6f4b83.py','validate_6799c386.py'),('ReplayIsolatedMEC6.lean','ReplayIsolatedM679.lean'),('audit_ec6f4b83.py','audit_6799c386.py')]:
 s=(R/'research'/old).read_text().replace('ec6f4b83','6799c386').replace('MEC6','M679'); (R/'research'/new).write_text(s)
print(json.dumps({k:({x:v[x] for x in ['events_count','change_count','change_mismatches']} if k.startswith('000') else v) for k,v in d.items()},indent=2))
