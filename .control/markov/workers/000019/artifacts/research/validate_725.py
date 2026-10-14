"""Machine-authored foreground compiler/replay; retain each attempt."""
import hashlib,json,os,pathlib,subprocess,sys,time
root=pathlib.Path('/Users/sasha/math_gkm');out=root/'evidence/markov-7252232b'
out.mkdir(exist_ok=True);tmp=root/'research/markov-7252232b-tmp';tmp.mkdir(exist_ok=True)
prior=json.loads((root/'evidence/markov-f6506bc6/run-1791949313076897000.json').read_text())
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',
 PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',TMPDIR=str(tmp),
 LEAN_PATH=str(out)+':'+prior['lean_path'])
module=sys.argv[1];mode=sys.argv[2] if len(sys.argv)>2 else 'build'
source=root/'research'/f'{module}.lean';data=source.read_bytes();stamp=str(time.time_ns())
(out/f'{module}-{stamp}.lean').write_bytes(data)
binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/'
cmd=[binary+'lean','-o',str(out/f'{module}.olean'),str(source)]
if mode=='kernel':cmd=[binary+'leanchecker',module]
start=time.monotonic()
try:
 p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True,timeout=90)
 rec=dict(returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
rec.update(source=str(source.relative_to(root)),sha256=hashlib.sha256(data).hexdigest(),
 command=cmd,seconds=time.monotonic()-start,lean_path=env['LEAN_PATH'],
 imports_status='Inherited compiled imports; fresh named module only')
(out/f'run-{stamp}.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(record=f'run-{stamp}.json',**{k:v for k,v in rec.items() if k in ['returncode','stdout','stderr','timeout','seconds']})),flush=True);sys.exit(rec.get('returncode',1))
