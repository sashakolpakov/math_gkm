"""Bounded foreground batch of independent builds, two at a time; no controller calls."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess,sys,json
names=sys.argv[1:]
def run(m):
 p=subprocess.run(['/opt/homebrew/bin/python3','research/validate_fd72158c.py',m,'build','90'],capture_output=True,text=True,timeout=100)
 print(p.stdout,flush=True)
 return dict(module=m,returncode=p.returncode,stderr=p.stderr)
with ThreadPoolExecutor(max_workers=2) as ex: result=list(ex.map(run,names))
Path('evidence/markov-fd72158c/batch-'+names[0]+'.json').write_text(json.dumps(result,indent=2)+'\n')
sys.exit(int(any(z['returncode'] for z in result)))
