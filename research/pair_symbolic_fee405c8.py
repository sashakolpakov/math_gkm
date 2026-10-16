"""Machine-authored bounded foreground GAP capability and algebra probe."""
from pathlib import Path
import subprocess,os,json,time,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fee405c8'
p=R/'research/pair_symbolic_fee405c8.g';start=time.monotonic()
cmd=['/opt/homebrew/bin/gap','-q','-b','-r','-A',str(p)]
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null')
try:
 r=subprocess.run(cmd,cwd=R,env=env,capture_output=True,text=True,timeout=90)
 d={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
except subprocess.TimeoutExpired as e:d={'timeout':True,'stdout':str(e.stdout),'stderr':str(e.stderr)}
d.update(command=cmd,seconds=time.monotonic()-start,source_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),status='operational/symbolic experiment only, not a theorem')
(O/'pair-symbolic.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps({k:(v[:1000] if k in ['stdout','stderr'] else v) for k,v in d.items()}))
