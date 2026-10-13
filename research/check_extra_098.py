"""Machine-authored foreground compile/kernel tool. Preserves each attempt."""
import hashlib,json,os,pathlib,subprocess,sys,time
root=pathlib.Path('/Users/sasha/math_gkm')
out=root/'evidence/markov-098a5a66'
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',
         PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
p=subprocess.run(['lake','env','printenv','LEAN_PATH'],cwd=root,env=env,text=True,capture_output=True,timeout=30)
assert p.returncode==0,p.stderr
env['LEAN_PATH']=str(out)+':'+':'.join(x for x in p.stdout.strip().split(':') if x!=str(root/'.lake/build/lib/lean'))
stamp=str(time.time_ns())
if sys.argv[1]=='compile':
    src='research/MarkovUnique098.lean'
    cmd=['lean','-o',str(out/'MarkovUnique098.olean'),src]
    (out/('source-'+stamp+'.lean')).write_bytes((root/src).read_bytes())
else:
    cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/leanchecker',sys.argv[2]]
start=time.monotonic()
p=subprocess.run(cmd,cwd=root,env=env,text=True,capture_output=True,timeout=120)
rec=dict(command=cmd,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr,seconds=time.monotonic()-start,lean_path=env['LEAN_PATH'])
if sys.argv[1]=='compile': rec['source_sha256']=hashlib.sha256((root/src).read_bytes()).hexdigest()
(out/(sys.argv[1]+'-'+stamp+'.json')).write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec,indent=2))
sys.exit(p.returncode)
