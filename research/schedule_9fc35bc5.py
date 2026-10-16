"""Machine-authored foreground build of a reconciled dependency DAG."""
from validate_9fc35bc5 import *
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import re
plan=json.loads((O/'pending-plan.json').read_text())
allmods=set(plan.values())
mods=set()
def visit(m):
 if m in mods or m not in allmods:return
 mods.add(m)
 for d in re.findall(r'^import (\w+)',(R/'research'/f'{m}.lean').read_text(),re.M):visit(d)
for m in sys.argv[2:] or ['MarkovThirdAllLCM9FC']:visit(m)
deps={m:set(re.findall(r'^import (\w+)',(R/'research'/f'{m}.lean').read_text(),re.M))&mods for m in mods}
done=set()
for p in O.glob('build-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0:
  for m,h in d['modules'].items():
   if (O/f'{m}.olean').is_file() and sha(R/'research'/f'{m}.lean')==h:done.add(m)
pending=mods-done;failed=set();active={}
deadline=time.time()+float(sys.argv[1] if len(sys.argv)>1 else 1200)
with ThreadPoolExecutor(max_workers=6) as pool:
 while pending or active:
  stop=(R/'.control/markov/STOP.json').exists() or time.time()>=deadline
  while len(active)<6 and not stop:
   ready=next((m for m in sorted(pending) if deps[m]<=done),None)
   if ready is None:break
   pending.remove(ready);active[pool.submit(run,[ready],timeout=150)]=ready
  if not active:break
  fs,_=wait(active,timeout=2,return_when=FIRST_COMPLETED)
  for f in fs:
   m=active.pop(f)
   if f.result().get('returncode')==0:done.add(m)
   else:failed.add(m)
  (O/'schedule-status.json').write_text(json.dumps(dict(done=sorted(done&mods),failed=sorted(failed),pending=sorted(pending),active=list(active.values())),indent=2)+'\n')
print('FINISHED',json.dumps(dict(done=len(done&mods),failed=sorted(failed),pending=len(pending))))
