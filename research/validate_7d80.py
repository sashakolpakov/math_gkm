"""Machine-authored foreground Lean compilation/replay; preserves every attempt."""
import pathlib,json,os,subprocess,time,hashlib,sys
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-7d80a785'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(o)+':'+json.loads((o/'inherited-lean-path.json').read_text()))
m=sys.argv[1];mode=sys.argv[2] if len(sys.argv)>2 else 'build';p=r/'research'/f'{m}.lean'
stamp=f'{m}-{mode}-{time.time_ns()}';data=p.read_bytes();(o/f'{m}-{stamp}.lean').write_bytes(data)
binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/'
cmd=[binary+'lean','-o',str(o/f'{m}.olean'),str(p)] if mode=='build' else [binary+'leanchecker',m]
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=r,env=env,text=True,capture_output=True,
   timeout=float(sys.argv[3]) if len(sys.argv)>3 else 150)
 rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
rec.update(source=str(p.relative_to(r)),sha256=hashlib.sha256(data).hexdigest(),command=cmd,lean_path=env['LEAN_PATH'],seconds=time.monotonic()-t,imports_status='Inherited compiled imports reused; not fresh whole-source rebuild')
q=o/f'run-{stamp}.json';q.write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(record=str(q.relative_to(r)),**{k:v for k,v in rec.items() if k in ['returncode','stdout','stderr','seconds','timeout']})),flush=True)
sys.exit(rec.get('returncode',1))
