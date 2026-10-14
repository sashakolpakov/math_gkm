"""Machine-authored foreground proof validation with unique immutable receipts."""
import hashlib,json,os,pathlib,subprocess,sys,time
root=pathlib.Path('/Users/sasha/math_gkm')
out=root/'evidence/markov-de6ce8a9'
out.mkdir(exist_ok=True)
prior=json.loads((root/'evidence/markov-4b57f2c3/run-1791933097650514000.json').read_text())[0]
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',
         PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',
         LEAN_PATH=str(out)+':'+prior['lean_path'])
module=sys.argv[1] if len(sys.argv)>1 else 'MarkovBlowupDe6'
mode=sys.argv[2] if len(sys.argv)>2 else 'build'
source=root/'research'/f'{module}.lean'
stamp=str(time.time_ns())
data=source.read_bytes()
(out/f'{module}-{stamp}.lean').write_bytes(data)
binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/'
cmd=[binary+'lean','-o',str(out/f'{module}.olean'),str(source)]
if mode=='kernel': cmd=[binary+'leanchecker',module]
start=time.monotonic()
try:
    p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True,
                     timeout=int(os.environ.get('DE6_TIMEOUT','100')))
    rec=dict(returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
except subprocess.TimeoutExpired:
    rec=dict(timeout=True)
rec.update(source=str(source.relative_to(root)),sha256=hashlib.sha256(data).hexdigest(),
           command=cmd,seconds=time.monotonic()-start,lean_path=env['LEAN_PATH'],
           imports_status='Inherited compiled project imports; new module rebuilt from source')
(out/f'run-{stamp}.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec),flush=True)
sys.exit(rec.get('returncode',1))
