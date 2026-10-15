"""Machine-authored bounded foreground replay batch; no root admission."""
from pathlib import Path
import subprocess,sys,json
R=Path('/Users/sasha/math_gkm')
mods=sys.argv[1:]
for mod in mods:
 p=subprocess.run(['/opt/homebrew/bin/python3','research/validate_fdda.py',mod,'replay','90'],cwd=R,capture_output=True,text=True,timeout=100)
 print(p.stdout,flush=True)
 if p.returncode: print(p.stderr,flush=True);sys.exit(p.returncode)
