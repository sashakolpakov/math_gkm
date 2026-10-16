"""Machine-authored foreground DAG builder, bounded by wall time and process timeouts."""
from validate_ae257c53 import *
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import re

def accepted():
 out=set()
 for p in O.glob('build-*.json'):
  d=json.loads(p.read_text())
  if d.get('returncode')!=0:continue
  for m,h in d['modules'].items():
   if (O/f'{m}.olean').is_file() and sha(R/'research'/f'{m}.lean')==h:out.add(m)
 return out

def main():
 plan=json.loads((O/'generated-plan.json').read_text())
 charts=sys.argv[1:]
 mods=[m for n in charts for level in plan[n] for m in level]
 allmods=set(mods)
 deps={m:{n for n in re.findall(r'^import (\w+)',(R/'research'/f'{m}.lean').read_text(),re.M) if n in allmods} for m in mods}
 done=accepted();pending=[m for m in mods if m not in done];failed=set();active={}
 # Reserve time for validation and reporting under the user's 1800-second cap.
 deadline=1792118880 # 2026-10-16 02:48 UTC
 pool=ThreadPoolExecutor(max_workers=6)
 try:
  while pending or active:
   if (R/'.control/markov/STOP.json').exists() or time.time()>=deadline:pending=[]
   while len(active)<6:
    ready=next((m for m in pending if deps[m]<=done),None)
    if ready is None:break
    pending.remove(ready);active[pool.submit(run,[ready],timeout=150)]=ready
   if not active:break
   fs,_=wait(active,timeout=2,return_when=FIRST_COMPLETED)
   for f in fs:
    m=active.pop(f)
    if f.result().get('returncode')==0:done.add(m)
    else:failed.add(m)
   (O/'schedule-status.json').write_text(json.dumps(dict(charts=charts,accepted=sorted(set(mods)&done),failed=sorted(failed),pending=pending,active=list(active.values()),pid=os.getpid()),indent=2)+'\n')
 except KeyboardInterrupt:
  print('Interrupted: no queued work; waiting for signalled foreground compilers.',flush=True)
 finally:pool.shutdown(wait=True,cancel_futures=True)
 print('DONE',json.dumps(dict(accepted=len(set(mods)&done),failed=sorted(failed),remaining=len(set(mods)-done))),flush=True)
if __name__=='__main__':main()
