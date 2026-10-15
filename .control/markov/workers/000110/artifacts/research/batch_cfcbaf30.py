"""Machine-authored bounded foreground build batch; no detached process."""
import sys,json
from concurrent.futures import ThreadPoolExecutor
from validate_cfcbaf30 import run,O
mods=[]
for arg in sys.argv[1:]:
 if arg.endswith('.json'):mods+=json.loads(open(arg).read())
 else:mods.append(arg)
with ThreadPoolExecutor(max_workers=2) as pool:
 results=list(pool.map(lambda m:run(m,timeout=180),mods))
print(json.dumps(dict(passed=sum(x.get('returncode')==0 for x in results),total=len(results))),flush=True)
