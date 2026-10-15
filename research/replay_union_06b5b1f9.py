"""Machine-authored bounded foreground union replay."""
from pathlib import Path
import os,subprocess,time,json,hashlib,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-06b5b1f9'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=sys.argv[1:];sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
runs=[json.loads(p.read_text()) for p in O.glob('run-Markov*.json')]
for m,h in sources.items():assert any(d.get('source')==f'research/{m}.lean' and d.get('sha256')==h and d.get('returncode')==0 and d.get('mode')=='build' for d in runs),m
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(O)+':'+json.loads((O/'inherited-lean-path.json').read_text()))
cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--run',str(R/'research/ReplayBatch07F1.lean'),*mods]
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=R,env=env,text=True,capture_output=True,timeout=120)
 rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
rec.update(modules=sources,command=cmd,seconds=time.monotonic()-t,driver_sha256=sha(R/'research/ReplayBatch07F1.lean'),limits='Inherited import boundary reused. Union replay excludes these new modules from imports; no fresh whole-source rebuild.')
p=O/f'kernel-union-{time.time_ns()}.json';p.write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(receipt=str(p.relative_to(R)),**rec)),flush=True)
sys.exit(rec.get('returncode',1))
