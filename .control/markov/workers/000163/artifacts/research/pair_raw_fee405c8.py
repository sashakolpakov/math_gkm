"""Machine-authored bounded foreground raw-polynomial GAP experiment."""
from pathlib import Path
import subprocess,os,json,time,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fee405c8'
p=R/'research/pair_raw_fee405c8.g';start=time.monotonic()
cmd=['/opt/homebrew/bin/gap','-q','-b','-r','-A',str(p)]
try:
 r=subprocess.run(cmd,cwd=R,env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null'),capture_output=True,text=True,timeout=60)
 d={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
except subprocess.TimeoutExpired as e:d={'timeout':True,'stdout':str(e.stdout),'stderr':str(e.stderr)}
d.update(command=cmd,seconds=time.monotonic()-start,source_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),status='symbolic experiment only; unvalidated algebraic candidate')
(O/'pair-raw.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d))
