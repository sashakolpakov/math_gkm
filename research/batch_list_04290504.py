"""Machine-authored foreground proof checks with bounded concurrency."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess,sys,json
R=Path('/Users/sasha/math_gkm')
mods=sys.argv[2:];timeout=sys.argv[1]
def run(m):
 x=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/validate_04290504.py'),m,'build',timeout],cwd=R,text=True,capture_output=True)
 print(x.stdout,flush=True)
 if x.stderr:print(x.stderr,flush=True)
 return m,x.returncode
with ThreadPoolExecutor(max_workers=3) as ex:result=list(ex.map(run,mods))
print(result,flush=True)
sys.exit(int(any(c for m,c in result)))
