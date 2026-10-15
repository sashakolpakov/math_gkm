"""Machine-authored bounded foreground builds and replays with immutable attempt receipts."""
from pathlib import Path
import os,subprocess,time,json,hashlib,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5dc9c88d'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
pathfile=O/'optimized-lean-path.json'
if not pathfile.exists(): pathfile=O/'inherited-lean-path.json'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',TMPDIR=str(O/'work'),LEAN_PATH=str(O)+':'+json.loads(pathfile.read_text()))
def run(m,mode='build',timeout=100):
 p=R/'research'/f'{m}.lean';stamp=f'{m}-{mode}-{time.time_ns()}'; data=p.read_bytes(); (O/f'{stamp}.lean').write_bytes(data)
 binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean'
 cmd=[binary,'-o',str(O/f'{m}.olean'),str(p)] if mode=='build' else [binary,'--run',str(R/'research/ReplayKnown6d2c.lean'),m]
 t=time.monotonic()
 try:
  x=subprocess.run(cmd,cwd=R,env=env,text=True,capture_output=True,timeout=timeout); d=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
 except subprocess.TimeoutExpired as e:d=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
 d.update(source=str(p.relative_to(R)),sha256=hashlib.sha256(data).hexdigest(),mode=mode,command=cmd,seconds=time.monotonic()-t,limits='Inherited compiled imports reused; not fresh whole-source rebuild')
 q=O/f'run-{stamp}.json';q.write_text(json.dumps(d,indent=2)+'\n')
 print(json.dumps(dict(receipt=str(q.relative_to(R)),returncode=d.get('returncode'),timeout=d.get('timeout',False),seconds=d['seconds'],error=d.get('stdout','')[:1400] if d.get('returncode')!=0 else '')),flush=True)
 return d
if __name__=='__main__':
 d=run(sys.argv[1],sys.argv[2] if len(sys.argv)>2 else 'build',float(sys.argv[3]) if len(sys.argv)>3 else 100);sys.exit(d.get('returncode',1))
