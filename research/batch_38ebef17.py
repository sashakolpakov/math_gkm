"""Machine-authored bounded foreground compilation, joined threads."""
from concurrent.futures import ThreadPoolExecutor
import sys,json
from validate_38ebef17 import run,O
mods=sys.argv[1:]
with ThreadPoolExecutor(max_workers=3) as pool:
 results=list(pool.map(lambda m:run(m,timeout=180),mods))
sys.exit(0 if all(d.get('returncode')==0 for d in results) else 1)
