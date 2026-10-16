"""Machine-authored live research setup. No control-record mutations."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-37bf1d20'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d={'request_id':'37bf1d20e23d45ac82d81edbb57c3fd5','inherited':{}}
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 d['inherited'][p]=sha(R/p)==v['sha256']
for tag in ['ac3d4ab9','f1e4fe3b']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 d[tag]={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000138']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-3:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Worker 136 final artifacts are inherited after outer timeout; worker 137 stopped with no events or changes; worker 138 completed. Hashes and final raw events inspected. No prior mutation replayed.'
d['capabilities']={'scratch':'denied by higher-priority policy; never accessed; durable evidence paths used','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-ac3d4ab9')+':'+json.loads((R/'evidence/markov-ac3d4ab9/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_ac3d4ab9.py','validate_37bf1d20.py'),('audit_ac3d4ab9.py','audit_37bf1d20.py'),('ReplayIsolatedMAC3.lean','ReplayIsolatedM37B.lean')]:
 s=(R/'research'/old).read_text().replace('ac3d4ab9','37bf1d20').replace('MAC3','M37B')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in d.items() if not k.startswith('000')}))
