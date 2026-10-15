"""Machine-authored foreground replay of reconciled compiled certificates."""
from pathlib import Path
import subprocess,sys,json,os,time,hashlib
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-722898f8'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(O)+':'+json.loads((O/'inherited-lean-path.json').read_text()),TMPDIR=str(O/'work'))
for m in sys.argv[1:]:
 data=(R/'research'/f'{m}.lean').read_bytes(); t=time.monotonic()
 cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--run',str(R/'research/ReplayKnown6d2c.lean'),m]
 try:
  p=subprocess.run(cmd,env=env,cwd=R,text=True,capture_output=True,timeout=300)
  d=dict(returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
 except subprocess.TimeoutExpired as e:d=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
 d.update(module=m,source=f'research/{m}.lean',sha256=hashlib.sha256(data).hexdigest(),seconds=time.monotonic()-t,command=cmd,mode='replay',limits='Inherited import boundary; not a fresh whole-source rebuild')
 q=O/f'run-{m}-replay-{time.time_ns()}.json';q.write_text(json.dumps(d,indent=2)+'\n')
 print(json.dumps(dict(receipt=str(q.relative_to(R)),**d)),flush=True)
