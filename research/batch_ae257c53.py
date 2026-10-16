"""Bounded foreground compiler pool. No detached processes or controller invocation."""
from validate_ae257c53 import *
from concurrent.futures import ThreadPoolExecutor,as_completed

def batch(mods,workers=3,timeout=150):
 results={}
 with ThreadPoolExecutor(max_workers=workers) as pool:
  fs={pool.submit(run,[m],timeout=timeout):m for m in mods}
  for f in as_completed(fs):results[fs[f]]=f.result().get('returncode')==0
 return results

if __name__=='__main__':
 plan=json.loads((O/'generated-plan.json').read_text())
 charts=sys.argv[1:]
 results={}
 for level in range(5):
  mods=[m for n in charts for m in plan[n][level]]
  if (R/'.control/markov/STOP.json').exists():break
  r=batch(mods);results.update(r)
  (O/f'batch-{charts[0]}-{charts[-1]}.json').write_text(json.dumps(results,indent=2)+'\n')
  if not all(r.values()):
   print('FAILED',json.dumps([m for m,v in r.items() if not v]),flush=True);break
 print('FINISHED',json.dumps(dict(success=sum(results.values()),total=len(results))),flush=True)
