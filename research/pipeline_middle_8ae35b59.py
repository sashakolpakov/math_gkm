"""Machine-authored bounded foreground certificate batches. No detached work."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import json,time,sys
from validate_8ae35b59 import run,R,O,sha
deadline=time.time()+900
def accepted(m):
 p=R/'research'/f'{m}.lean';h=sha(p)
 for q in O.glob(f'run-{m}-build-*.json'):
  d=json.loads(q.read_text())
  if d.get('returncode')==0 and d['sha256']==h:return True
 return False
def build(m):
 if accepted(m):return True
 if time.time()>deadline:
  print(json.dumps(dict(skipped=m,reason='foreground pipeline time bound')),flush=True);return False
 return run(m,'build',90).get('returncode')==0
def group(z,b):
 for a in range(9-b):
  if not build(f'MarkovMiddleGap{z}_{b}_{a}M8AE'):return False
 if not build(f'MarkovMiddleGap{z}_{b}M8AE'):return False
 return build(f'MarkovMiddleColumn{z}_{b}M8AE')
groups=[(3,0)]+[(z,b) for b in reversed(range(9)) for z in [0,2]]
with ThreadPoolExecutor(max_workers=2) as pool:
 results=list(pool.map(lambda x:group(*x),groups))
(O/'pipeline-result.json').write_text(json.dumps(dict(groups=groups,passed=results),indent=2)+'\n')
sys.exit(0 if all(results) else 1)
