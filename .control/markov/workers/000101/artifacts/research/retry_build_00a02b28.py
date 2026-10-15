"""Machine-authored bounded foreground compile queue. Joins every subprocess."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json,subprocess,sys,os,time
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-00a02b28'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
mods=sys.argv[1:] or json.loads((O/'planned-onset-modules.json').read_text())[1:]
start=time.monotonic()
def build(m):
 if time.monotonic()-start>1100 or (R/'.control/markov/STOP.json').exists():return dict(module=m,skipped=True)
 p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/validate_00a02b28.py'),m,'build','320'],cwd=R,env=env,capture_output=True,text=True)
 rec=dict(module=m,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
 print(json.dumps(rec),flush=True)
 return rec
with ThreadPoolExecutor(max_workers=4) as pool:
 result=list(pool.map(build,mods))
(O/f'parallel-build-{time.time_ns()}.json').write_text(json.dumps(result,indent=2)+'\n')
print('All foreground compile tasks joined.',flush=True)
sys.exit(int(any(r.get('returncode',1)!=0 for r in result)))
