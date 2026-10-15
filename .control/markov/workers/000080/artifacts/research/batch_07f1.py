"""Machine-authored bounded foreground orchestration of independent Lean checks."""
from concurrent.futures import ThreadPoolExecutor
import subprocess,sys
mode=sys.argv[1];mods=sys.argv[2:]
def one(m):
 x=subprocess.run(['/opt/homebrew/bin/python3','research/validate_07f1.py',m,mode,'150'],text=True,capture_output=True)
 print(x.stdout,flush=True)
 if x.stderr:print(x.stderr,flush=True)
 return x.returncode
with ThreadPoolExecutor(max_workers=3) as ex:results=list(ex.map(one,mods))
sys.exit(int(any(results)))
