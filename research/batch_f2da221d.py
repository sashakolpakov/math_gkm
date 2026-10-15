"""Machine-authored bounded foreground batch; all child processes joined."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import subprocess,sys
R=Path('/Users/sasha/math_gkm')
def run(m):
 p=subprocess.run(['/opt/homebrew/bin/python3','research/validate_f2da221d.py',m,'build','100'],cwd=R,capture_output=True,text=True)
 print(p.stdout,flush=True)
 return p.returncode
with ThreadPoolExecutor(max_workers=3) as pool: results=list(pool.map(run,sys.argv[1:]))
sys.exit(int(any(results)))
