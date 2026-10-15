"""Machine-authored bounded foreground kernel replay, distinct evidence path."""
from pathlib import Path
import os,subprocess,time,json,hashlib,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-e2cd486c'
mods=sys.argv[1:];env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(O)+':'+json.loads((O/'inherited-lean-path.json').read_text()))
cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--run',str(R/'research/ReplayBatch07F1.lean'),*mods];t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=R,env=env,text=True,capture_output=True,timeout=100);rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
rec.update(command=cmd,seconds=time.monotonic()-t,modules={m:hashlib.sha256((R/'research'/f'{m}.lean').read_bytes()).hexdigest() for m in mods},limits='Union kernel replay over inherited imports; no whole-source rebuild.')
p=O/f'replay-group-{time.time_ns()}.json';p.write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(receipt=str(p.relative_to(R)),**rec)),flush=True)
