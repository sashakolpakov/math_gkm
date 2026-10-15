"""Machine-authored foreground DAG runner. No detached work or controller changes."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,wait,FIRST_COMPLETED
import subprocess,sys,time,json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-722898f8'
inv=json.loads((O/'middle-inventory.json').read_text()); modules=sum(inv.values(),[])
deps={m:[x for x in re.findall(r'^import (\w+)',(R/'research'/f'{m}.lean').read_text(),re.M) if x in modules] for m in modules}
done={};running={};pending=list(modules);start=time.monotonic()
def run(m):
 p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/validate_722898f8.py'),m,'build','210'],cwd=R,text=True,capture_output=True)
 return dict(module=m,returncode=p.returncode,output=p.stdout,stderr=p.stderr)
with ThreadPoolExecutor(max_workers=3) as pool:
 while pending or running:
  for m in pending[:]:
   if any(d in done and done[d]['returncode']!=0 for d in deps[m]):
    done[m]=dict(module=m,returncode=2,reason='Dependency rejected; not launched');pending.remove(m)
   elif len(running)<3 and all(d in done for d in deps[m]) and time.monotonic()-start<1000 and not (R/'.control/markov/STOP.json').exists():
    running[pool.submit(run,m)]=m;pending.remove(m)
  if not running:break
  fs,_=wait(running,timeout=10,return_when=FIRST_COMPLETED)
  for f in fs:
   m=running.pop(f);d=f.result();done[m]=d;print(json.dumps(d),flush=True)
  (O/'middle-build-progress.json').write_text(json.dumps(dict(completed=done,running=list(running.values()),pending=pending,seconds=time.monotonic()-start),indent=2)+'\n')
(O/'middle-build-final.json').write_text(json.dumps(dict(completed=done,pending=pending,seconds=time.monotonic()-start),indent=2)+'\n')
print('Foreground batch finished',len(done),'pending',len(pending),flush=True)
