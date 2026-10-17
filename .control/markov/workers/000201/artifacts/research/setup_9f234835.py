"""Machine-authored reconciliation; no controller changes or prior side-effect replay."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-9f234835'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inherited=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in inherited.items()}
logs={}
for num in ('000198','000199','000200'):
 p=R/'.control/markov/workers'/num/'events.jsonl'; pending={}; evs=[]
 for line in p.read_text().splitlines():
  if not line.strip(): continue
  e=json.loads(line); evs.append(e); item=e.get('item',{})
  if e['type']=='item.started': pending[item['id']]=item
  if e['type']=='item.completed': pending.pop(item['id'],None)
 logs[num]={'sha256':sha(p),'events':len(evs),'pending':pending,'last_events':evs[-3:]}
manifest=json.loads((R/'evidence/markov-f88f6a75/manifest.json').read_text())
bad=[k for k,v in manifest.items() if not (R/k).exists() or sha(R/k)!=v]
assert not bad,bad
val=json.loads((R/'evidence/markov-f88f6a75/validation.json').read_text())
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in val['modules'].items())
rec={'bindings':bindings,'logs':logs,'predecessor_manifest_artifacts':len(manifest),'predecessor_manifest_failures':bad,'validated_modules':val['modules'],'decision':'Interrupted 198 and 199 reconciled from raw logs and successor receipts. Finalizer 199 completed; do not replay it. Worker 200 complete. Select new lower-diagonal parameter investigation.','scratch':'Denied by higher-priority filesystem profile; not accessed. New evidence directory used for working artifacts.'}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
inputs={}
for base in ('research','MathGKM','evidence/independent-markov','contracts'):
 for p in (R/base).rglob('*'):
  if p.is_file(): inputs[str(p.relative_to(R))]=sha(p)
for p in ('MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lean-toolchain','lakefile.toml','lake-manifest.json'):
 inputs[p]=sha(R/p)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
lp=str(R/'evidence/markov-f88f6a75')+':'+json.loads((R/'evidence/markov-f88f6a75/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
v=(R/'research/validate_f88f6a75.py').read_text().replace('markov-f88f6a75','markov-9f234835').replace('MF88','M9F23')
(R/'research/validate_9f234835.py').write_text(v)
(R/'research/ReplayIsolatedM9F23.lean').write_text((R/'research/ReplayIsolatedMF88.lean').read_text().replace('MF88','M9F23'))
caps={'python':sys.version,'sage':shutil.which('sage'),'gap':shutil.which('gap'),'sympy':__import__('importlib.util').util.find_spec('sympy') is not None}
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps({'bindings':bindings,'artifacts_checked':len(manifest),'input_count':len(inputs),'pending':{k:list(v['pending']) for k,v in logs.items()},'capabilities':caps}))
