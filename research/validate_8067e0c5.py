"""Machine-authored foreground Lean compilation/replay with attempt receipts."""
from pathlib import Path
import os,subprocess,time,json,hashlib,sys
r=Path('/Users/sasha/math_gkm');out=r/'evidence/markov-8067e0c5'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',TMPDIR=str(r/'research/markov-8067e0c5-tmp'),LEAN_PATH=str(out)+':'+json.loads((out/'inherited-lean-path.json').read_text()))
m=sys.argv[1];mode=sys.argv[2] if len(sys.argv)>2 else 'build';p=r/'research'/f'{m}.lean';data=p.read_bytes();stamp=f'{m}-{mode}-{time.time_ns()}'
(out/f'{stamp}.lean').write_bytes(data)
binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/'
cmd=[binary+'lean','-o',str(out/f'{m}.olean'),str(p)] if mode=='build' else [binary+'lean','--run',str(r/'research/ReplayKnown6d2c.lean'),m]
if (out/"skip-builds.json").exists() and m in json.loads((out/"skip-builds.json").read_text()):
 rec=dict(source=str(p.relative_to(r)),sha256=hashlib.sha256(data).hexdigest(),mode=mode,skipped=True,reason="Research direction revised before this queued build started")
 (out/f"run-{stamp}.json").write_text(json.dumps(rec,indent=2)+"\n")
 print(json.dumps(rec),flush=True)
 sys.exit(2)
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=r,env=env,text=True,capture_output=True,timeout=float(sys.argv[3]) if len(sys.argv)>3 else 100)
 rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
rec.update(source=str(p.relative_to(r)),sha256=hashlib.sha256(data).hexdigest(),command=cmd,seconds=time.monotonic()-t,imports_status='Inherited compiled imports reused; no fresh whole-source rebuild',mode=mode)
q=out/f'run-{stamp}.json';q.write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(record=str(q.relative_to(r)),**{k:((v[:1800] if rec.get("returncode")!=0 else str(len(v))+" chars retained in receipt") if k in ['stdout','stderr'] else v) for k,v in rec.items()})),flush=True)
sys.exit(rec.get('returncode',1))
