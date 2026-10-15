"""Machine-authored bounded foreground batch; joined compiler processes, no detached work."""
import sys,json,concurrent.futures
from validate_5dc9c88d import run,O
mods=json.loads((O/'inventory.json').read_text())[sys.argv[1]]
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
 results=list(pool.map(lambda m:run(m,'build',100),mods))
print(json.dumps(dict(stage=sys.argv[1],passed=sum(x.get('returncode')==0 for x in results),failed=[x['source'] for x in results if x.get('returncode')!=0])),flush=True)
