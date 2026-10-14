"""Machine-authored foreground Lean validation for request 654a72ea."""
import hashlib,json,os,pathlib,subprocess,sys,time
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-654a72ea'
o.mkdir(exist_ok=True)
prior=json.loads((r/'evidence/markov-26ca8e85/run-1791960269375439000.json').read_text())
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(o)+':'+prior['lean_path'])
m=sys.argv[1];mode=sys.argv[2] if len(sys.argv)>2 else 'build';p=r/'research'/f'{m}.lean'
data=p.read_bytes();stamp=str(time.time_ns());(o/f'{m}-{stamp}.lean').write_bytes(data)
binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/'
cmd=[binary+'lean','-o',str(o/f'{m}.olean'),str(p)] if mode=='build' else [binary+'leanchecker',m]
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=r,env=env,text=True,capture_output=True,timeout=100)
 rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
rec.update(source=str(p.relative_to(r)),sha256=hashlib.sha256(data).hexdigest(),command=cmd,lean_path=env['LEAN_PATH'],seconds=time.monotonic()-t,imports_status='Inherited compiled imports; not fresh full-source rebuild')
q=o/f'run-{stamp}.json';q.write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(record=str(q.relative_to(r)),**{k:v for k,v in rec.items() if k in ['returncode','stdout','stderr','seconds','timeout']})),flush=True)
sys.exit(rec.get('returncode',1))
