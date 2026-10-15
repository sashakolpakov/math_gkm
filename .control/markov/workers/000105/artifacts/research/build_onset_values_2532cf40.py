"""Machine-authored foreground checks of remaining chart values."""
from concurrent.futures import ThreadPoolExecutor
from validate_2532cf40 import run
mods=[f'MarkovOnset{p}Value{k}M253' for p in ['Low','High','Top'] for k in range(1,8) if (p,k) not in [('Low',1),('High',1)]]
with ThreadPoolExecutor(max_workers=2) as pool:
 results=list(pool.map(lambda m:run(m,'build',150),mods))
print('Value batch completed:',sum(x.get('returncode')==0 for x in results),'/',len(results),flush=True)
