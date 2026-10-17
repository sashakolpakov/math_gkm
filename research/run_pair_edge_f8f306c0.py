"""Machine-authored bounded foreground GAP execution."""
from pathlib import Path
import subprocess,os,time,json,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8f306c0';p=R/'research/pair_edge_f8f306c0.g'
cmd=['/opt/homebrew/bin/gap','-q','-b','-r','-A',str(p)];start=time.monotonic()
try:
 r=subprocess.run(cmd,cwd=R,env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null'),capture_output=True,text=True,timeout=90)
 out={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
except subprocess.TimeoutExpired as e:out={'timeout':True,'stdout':str(e.stdout),'stderr':str(e.stderr)}
out.update(command=cmd,seconds=time.monotonic()-start,source_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),status='exact symbolic experiment, not a Lean theorem')
(O/f'absorbed-boundary-linear-{time.time_ns()}.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:(v[:200] if k=="stdout" else v) for k,v in out.items()}))
