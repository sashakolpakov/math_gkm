"""Machine-authored bounded foreground batch. All child executions joined."""
from concurrent.futures import ThreadPoolExecutor
import sys
from validate_2532cf40 import run
mode=sys.argv[1];timeout=float(sys.argv[2]);mods=sys.argv[3:]
with ThreadPoolExecutor(max_workers=2) as pool:
 results=list(pool.map(lambda m:run(m,mode,timeout),mods))
sys.exit(0 if all(r.get('returncode')==0 for r in results) else 1)
