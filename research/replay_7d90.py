"""Machine-authored bounded replay of explicit modules using pinned replay body."""
from pathlib import Path
import os,subprocess,time,json,hashlib,sys
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-7d905904'
mods=sys.argv[1:];driver=r/'research/ReplayKnown6d2c.lean'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(o)+':'+json.loads((o/'inherited-lean-path.json').read_text()))
cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--run',str(driver)]+mods
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=r,env=env,capture_output=True,text=True,timeout=150)
 rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def obj(m):return next(Path(p)/f'{m}.olean' for p in env['LEAN_PATH'].split(':') if (Path(p)/f'{m}.olean').is_file())
rec.update(command=cmd,seconds=time.monotonic()-t,driver_sha256=sha(driver),sources={m:sha(r/'research'/f'{m}.lean') for m in mods},oleans={m:dict(path=str(obj(m)),sha256=sha(obj(m))) for m in mods},scope='Same replay body as pinned LeanChecker, inspected this run; explicit known module names replace recursive discovery. Inherited compiled imports reused. Not a fresh whole-source rebuild or an external verifier.')
p=o/f'known-replay-{time.time_ns()}.json';p.write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(record=str(p),**rec)),flush=True)
