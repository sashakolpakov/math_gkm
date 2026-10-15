"""Machine-authored bounded foreground individual kernel replay queue."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json,subprocess,sys,os,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-00a02b28'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
mods=sys.argv[1:]
def replay(m):
 p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/validate_00a02b28.py'),m,'replay','180'],cwd=R,env=env,capture_output=True,text=True)
 rec=dict(module=m,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
 print(json.dumps(rec),flush=True)
 return rec
with ThreadPoolExecutor(max_workers=3) as pool:result=list(pool.map(replay,mods))
(O/f'parallel-replay-{time.time_ns()}.json').write_text(json.dumps(result,indent=2)+'\n')
print('All foreground replay tasks joined.',flush=True)
sys.exit(int(any(r['returncode']!=0 for r in result)))
