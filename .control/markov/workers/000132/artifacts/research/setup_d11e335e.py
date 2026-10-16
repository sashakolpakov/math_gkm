"""Machine-authored d11e335e: bounded research setup, no side-effect replay."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-d11e335e'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
out={'request_id':'d11e335ef8db44b282c73b02009fc529','inherited':{k:sha(R/k)==v['sha256'] for k,v in idx.items()}}
for tag in ['ce882be3','263d8c71']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 out[tag]={'checked':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000128','000131']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 out[n]={'sha256':sha(p),'count':len(es),'last_events':es[-3:]}
out['reconciliation']='Worker 131 completed; interrupted worker 128 finalization already completed and reconciled. Actual final raw events and hashes rechecked. No actions replayed or excluded draft admitted.'
out['capability_failures']=['zsh here-document failed because shell temporary storage is denied. No scratch access attempted: higher-priority policy denies it. Unique research/evidence paths used.']
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file(): snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-ce882be3')+':'+json.loads((R/'evidence/markov-ce882be3/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_ce882be3.py','validate_d11e335e.py'),('audit_ce882be3.py','audit_d11e335e.py'),('ReplayIsolatedMCE8.lean','ReplayIsolatedMD11.lean')]:
 s=(R/'research'/old).read_text().replace('ce882be3','d11e335e').replace('MCE8','MD11')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in out.items() if not k.startswith('000')}))
