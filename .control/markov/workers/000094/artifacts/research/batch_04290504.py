"""Machine-authored bounded foreground batch, all subprocesses joined."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess,sys,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-04290504'
inv=json.loads((O/'certificate-inventory.json').read_text())
stage=sys.argv[1];timeout=sys.argv[2] if len(sys.argv)>2 else '240'
mods=[]
for row in inv.values():
 v=row[stage];mods.extend(v if isinstance(v,list) else [v])
def run(m):
 x=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/validate_04290504.py'),m,'build',timeout],cwd=R,text=True,capture_output=True)
 print(x.stdout,flush=True)
 if x.stderr:print(x.stderr,flush=True)
 return m,x.returncode
with ThreadPoolExecutor(max_workers=4) as ex: result=list(ex.map(run,mods))
print(result,flush=True)
sys.exit(int(any(c for m,c in result)))
