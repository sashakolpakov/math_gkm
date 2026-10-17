"""Machine-authored bounded foreground source experiment runner."""
from pathlib import Path
import subprocess,json,hashlib,time,os
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9647c1ba'
p=R/'research/source_experiment_9647c1ba.py';start=time.monotonic()
cmd=['/opt/homebrew/bin/python3',str(p)]
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
try:
 r=subprocess.run(cmd,cwd=R,env=env,capture_output=True,text=True,timeout=180)
 d={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
except subprocess.TimeoutExpired as e:d={'timeout':True,'stdout':str(e.stdout),'stderr':str(e.stderr)}
d.update(command=cmd,source_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),seconds=time.monotonic()-start)
(O/f'source-run-{time.time_ns()}.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d))
