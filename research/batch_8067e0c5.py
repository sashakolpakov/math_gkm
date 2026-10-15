"""Bounded foreground compilation of independent sources; no detached processes."""
from concurrent.futures import ThreadPoolExecutor
import subprocess,sys
def run(m):
 return subprocess.run(['/opt/homebrew/bin/python3','research/validate_8067e0c5.py',m,sys.argv[1],sys.argv[2]],capture_output=True,text=True)
with ThreadPoolExecutor(max_workers=3) as ex:
 for m,x in zip(sys.argv[3:],ex.map(run,sys.argv[3:])):
  print(m,x.returncode,x.stdout,flush=True)
