"""Machine-authored request 5703599b: preserve and reconcile actual inputs."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-5703599b'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
out={'request_id':'5703599b8b9a4638b67a688a6b77e4cb','inherited':{k:sha(R/k)==v['sha256'] for k,v in idx.items()}}
for tag in ['d11e335e','263d8c71']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 out[tag]={'checked':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000128','000132']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 out[n]={'sha256':sha(p),'count':len(es),'last_events':es[-3:]}
out['reconciliation']='Worker 132 completed. Worker 128 interrupted effects were previously finalized; hashes and final raw events rechecked. No side effect replayed. The five excluded MD11 middle-cone drafts are not admitted and will be replaced only in new files if used.'
out['capabilities']=['Higher-priority policy denies .scratch; no access attempted. Unique research/evidence paths used.']
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file(): snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-d11e335e')+':'+json.loads((R/'evidence/markov-d11e335e/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_d11e335e.py','validate_5703599b.py'),('audit_d11e335e.py','audit_5703599b.py'),('ReplayIsolatedMD11.lean','ReplayIsolatedM570.lean')]:
 s=(R/'research'/old).read_text().replace('d11e335e','5703599b').replace('MD11','M570')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in out.items() if not k.startswith('000')}))
