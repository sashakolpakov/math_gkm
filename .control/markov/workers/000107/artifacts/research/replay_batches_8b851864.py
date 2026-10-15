"""Machine-authored topological source-bound replay batches, foreground and joined."""
from concurrent.futures import ThreadPoolExecutor
import json,re,subprocess,sys
from validate_8b851864 import R,O
name=sys.argv[1]
inv=json.loads((O/f'{name}-inventory.json').read_text());mods=inv['modules']
if len(sys.argv)>2 and sys.argv[2]=='unreplayed':
 from validate_8b851864 import sha
 done={}
 for p in O.glob('kernel-union-*.json'):
  d=json.loads(p.read_text())
  if d.get('returncode')==0:done.update(d.get('modules',{}))
 mods={m:p for m,p in mods.items() if done.get(m)!=sha(R/p)}
deps={m:set(re.findall(r'^import (\w+)',(R/p).read_text(),re.M))&set(mods) for m,p in mods.items()}
ordered=[];todo=set(mods)
while todo:
 ready=sorted(m for m in todo if not deps[m]&todo)
 assert ready,'cyclic module dependencies'
 ordered.extend(ready);todo-=set(ready)
chunks=[ordered[i:i+25] for i in range(0,len(ordered),25)]
# An outside import can only refer to already ordered modules. This ensures
# no selected module is pre-admitted through a future assembly at the boundary.
for chunk in chunks:
 first=min(ordered.index(m) for m in chunk)
 for m in chunk:
  assert all(d in chunk or ordered.index(d)<first for d in deps[m])
(O/f'{name}-replay-plan.json').write_text(json.dumps(dict(chunks=chunks,dependencies={m:sorted(d) for m,d in deps.items()},meaning='Each new module is kernel-replayed; earlier checked/imported module dependencies are explicit. Not a fresh inherited source rebuild.'),indent=2)+'\n')
def go(ms):
 x=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/replay_8b851864.py'),*ms],cwd=R,text=True,capture_output=True,timeout=330)
 print(x.stdout,flush=True);print(x.stderr,flush=True) if x.stderr else None
 return x.returncode
with ThreadPoolExecutor(max_workers=2) as pool:codes=list(pool.map(go,chunks))
sys.exit(0 if all(x==0 for x in codes) else 1)
