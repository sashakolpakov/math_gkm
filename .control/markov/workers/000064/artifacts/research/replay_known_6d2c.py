"""Machine-authored bounded direct invocation of pinned kernel replay semantics."""
from pathlib import Path
import os,subprocess,time,json,hashlib
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-6d2c5a67'
mods=['MarkovAlignedCount6d2c','MarkovAlignedLC6d2c','MarkovAlignedPrefix6d2c','MarkovAlignedObstruction6d2c','MarkovTrimLinear6d2c','MarkovAlignedInterval6d2c']
driver=r/'research/ReplayKnown6d2c.lean'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(o)+':'+json.loads((o/'inherited-lean-path.json').read_text()))
cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--run',str(driver)]+mods
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=r,env=env,capture_output=True,text=True,timeout=100)
 rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
rec.update(command=cmd,seconds=time.monotonic()-t,driver_sha256=sha(driver),sources={m:sha(r/'research'/f'{m}.lean') for m in mods},oleans={m:sha(o/f'{m}.olean') for m in mods},scope='Same replay body as pinned LeanChecker; explicit known module names replace recursive discovery. Inherited compiled imports are reused. Not a fresh whole-source rebuild or an external verifier.')
(o/'known-kernel-replay.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
