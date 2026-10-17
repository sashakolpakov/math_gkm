"""Machine-authored request 50c262c5: bounded research setup and reconciliation."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-50c262c5'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inherited=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in inherited.items()}
logs={}
for num in ('000198','000199','000201'):
 p=R/'.control/markov/workers'/num/'events.jsonl'; pending={}; evs=[]
 for line in p.read_text().splitlines():
  if not line.strip(): continue
  e=json.loads(line); evs.append(e); item=e.get('item',{})
  if e['type']=='item.started': pending[item['id']]=item
  if e['type']=='item.completed': pending.pop(item['id'],None)
 logs[num]={'sha256':sha(p),'events':len(evs),'pending':pending,'last_events':evs[-2:]}
manifest=json.loads((R/'evidence/markov-9f234835/manifest.json').read_text())
bad=[k for k,v in manifest.items() if not (R/k).exists() or sha(R/k)!=v]
assert not bad,bad
val=json.loads((R/'evidence/markov-9f234835/validation.json').read_text())
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in val['modules'].items())
rec={'bindings':bindings,'logs':logs,'predecessor_manifest_artifacts':len(manifest),'predecessor_manifest_failures':bad,'validated_modules':val['modules'],'decision':'Raw logs confirm interrupted 198/199 side effects completed and were reconciled by successors. Latest 201 completed. No replay of prior mutations. Investigate middle transverse inequalities.','scratch':'Denied by developer filesystem profile; not accessed. Work files remain in this new evidence directory.','capability_failure':'zsh heredoc failed because implicit temporary-file creation is denied; use explicit research scripts.'}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
inputs={}
for base in ('research','MathGKM','evidence/independent-markov','contracts'):
 for p in (R/base).rglob('*'):
  if p.is_file(): inputs[str(p.relative_to(R))]=sha(p)
for p in ('MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lean-toolchain','lakefile.toml','lake-manifest.json'):
 inputs[p]=sha(R/p)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
lp=str(R/'evidence/markov-9f234835')+':'+json.loads((R/'evidence/markov-9f234835/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
v=(R/'research/validate_9f234835.py').read_text().replace('markov-9f234835','markov-50c262c5').replace('M9F23','M50C')
(R/'research/validate_50c262c5.py').write_text(v)
(R/'research/ReplayIsolatedM50C.lean').write_text((R/'research/ReplayIsolatedM9F23.lean').read_text().replace('M9F23','M50C'))
caps={'python':sys.version,'sage':shutil.which('sage'),'gap':shutil.which('gap'),'sympy':__import__('importlib.util').util.find_spec('sympy') is not None}
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps({'bindings':bindings,'artifacts_checked':len(manifest),'input_count':len(inputs),'pending':{k:list(v['pending']) for k,v in logs.items()},'capabilities':caps}))
