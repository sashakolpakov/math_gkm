"""Bounded foreground compiler jobs, no autonomous controller or background service."""
from validate_81f80b2d import run
from concurrent.futures import ThreadPoolExecutor
import sys
with ThreadPoolExecutor(max_workers=3) as pool:
 results=list(pool.map(lambda m:run([m],'build',150),sys.argv[1:]))
sys.exit(0 if all(r.get('returncode')==0 for r in results) else 1)
