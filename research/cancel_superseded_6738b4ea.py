"""Machine-authored resource cleanup of this request's superseded foreground jobs."""
import subprocess,os,signal,json,time,hashlib
from pathlib import Path
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6738b4ea'
p=subprocess.run(['/bin/ps','-axo','pid=,command='],capture_output=True,text=True)
out=dict(returncode=p.returncode,stderr=p.stderr,selected=[],reason='Superseded certificate normalization attempts; replacing rw auto-reduction with explicit congrArg equality composition.')
if p.returncode==0:
 for line in p.stdout.splitlines():
  a=line.strip().split(None,1)
  if len(a)!=2:continue
  pid,cmd=int(a[0]),a[1]
  direct=cmd.startswith('/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean -j 1 -o /Users/sasha/math_gkm/evidence/markov-6738b4ea/MarkovTemplate')
  batch=cmd.startswith('/opt/homebrew/bin/python3 -c import sys; sys.path.insert(0,"research"); from validate_6738b4ea import run; results=')
  if pid!=os.getpid() and (direct or batch):out['selected'].append(dict(pid=pid,command=cmd,batch=batch))
 for z in sorted(out['selected'],key=lambda z:not z['batch']):
  try:os.kill(z['pid'],signal.SIGTERM);z['signal']='SIGTERM'
  except ProcessLookupError:z['signal']='already exited'
out['sources']={str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in (R/'research').glob('MarkovTemplate*M673.lean')}
(O/f'superseded-cancellation-{time.time_ns()}.json').write_text(json.dumps(out,indent=2))
print(json.dumps({k:v for k,v in out.items() if k!='sources'}))
