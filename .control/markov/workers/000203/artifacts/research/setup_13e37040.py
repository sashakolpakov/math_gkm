"""Machine-authored request 13e3704044384ce789e16ba0f49af882; no controller edits."""
from pathlib import Path
import json,hashlib,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-13e37040'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in inh.items()}
manifest=json.loads((R/'evidence/markov-50c262c5/manifest.json').read_text())
bad=[k for k,v in manifest.items() if not (R/k).is_file() or sha(R/k)!=v]
assert not bad,bad
logs={}
for n in ('000198','000199','000202'):
 p=R/'.control/markov/workers'/n/'events.jsonl'; pending={}; es=[]
 for line in p.read_text().splitlines():
  if not line.strip():continue
  e=json.loads(line);es.append(e);i=e.get('item',{})
  if e['type']=='item.started':pending[i['id']]=i
  elif e['type']=='item.completed':pending.pop(i['id'],None)
 logs[n]={'sha256':sha(p),'event_count':len(es),'pending':pending,'last_events':es[-2:]}
rec={'bindings':bindings,'predecessor_artifacts':len(manifest),'failures':bad,'logs':logs,
 'decision':'Prior interrupted effects already reconciled by successors; no earlier action replayed. Investigate affine correction kernel and exact source bridge.',
 'limitations':['Developer denies .scratch; no access attempted. New research/evidence directories used.','zsh heredoc failed at implicit temporary-file creation; switched to explicit scripts.']}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
inputs={}
for base in ('research','MathGKM','evidence/independent-markov','contracts'):
 for p in (R/base).rglob('*'):
  if p.is_file():inputs[str(p.relative_to(R))]=sha(p)
for name in ('MISSION.md','docs/DESIGN.md','.control/markov/contract.json','lean-toolchain','lakefile.toml','lake-manifest.json'):
 inputs[name]=sha(R/name)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
lp=str(R/'evidence/markov-50c262c5')+':'+json.loads((R/'evidence/markov-50c262c5/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
for old,new in [('validate_50c262c5.py','validate_13e37040.py'),('ReplayIsolatedM50C.lean','ReplayIsolatedM13E.lean')]:
 (R/'research'/new).write_text((R/'research'/old).read_text().replace('markov-50c262c5','markov-13e37040').replace('M50C','M13E'))
(O/'capabilities.json').write_text(json.dumps({'python':sys.version,'sage':shutil.which('sage'),'gap':shutil.which('gap'),'sympy':__import__('importlib.util').util.find_spec('sympy') is not None},indent=2)+'\n')
print(json.dumps({'bindings':bindings,'predecessor_artifacts':len(manifest),'inputs':len(inputs),'pending':{k:list(v['pending']) for k,v in logs.items()}}))
