"""Machine-authored foreground validation; pinned imports, unique receipts."""
import hashlib, json, os, pathlib, subprocess, sys, time
root = pathlib.Path('/Users/sasha/math_gkm')
out = root / 'evidence/markov-1998e47e'
out.mkdir(exist_ok=True)
(out/'MathGKM').mkdir(exist_ok=True)
prior = json.loads((root/'evidence/markov-4b57f2c3/run-1791933031540364000.json').read_text())[0]
paths = prior['lean_path'].split(':')
env = dict(os.environ, GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL='/dev/null',
           PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',
           LEAN_PATH=':'.join([str(out)]+paths))
mode = sys.argv[1] if len(sys.argv)>1 else 'top'
if mode == 'preflight': env['LEAN_PATH']=':'.join([paths[0],str(out)]+paths[1:])
sources = [('research/MarkovTop1998.lean','MarkovTop1998')]
if mode == 'boundary': sources = [('MathGKM/MarkovLogConcavity.lean','MathGKM.MarkovLogConcavity'),('MathGKM/MarkovBoundary.lean','MathGKM.MarkovBoundary')]
if mode in ('lc','kernel-lc'): sources = [('research/MarkovTopLC1998.lean','MarkovTopLC1998')]
if mode == 'fresh':
    env['LEAN_PATH']=':'.join([str(out)]+paths[1:])
    sources = [('MathGKM/Markov.lean','MathGKM.Markov'),('MathGKM/MarkovIndices.lean','MathGKM.MarkovIndices'),('research/MarkovDegree21a.lean','MarkovDegree21a'),('research/MarkovHomogeneous21a.lean','MarkovHomogeneous21a'),('research/MarkovSource4b5.lean','MarkovSource4b5')]
stamp = str(time.time_ns())
records=[]
for source,module in sources:
    data=(root/source).read_bytes()
    (out/(module+'-'+stamp+'.lean')).write_bytes(data)
    binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/'
    cmd=[binary+'lean','-o',str(out/(module.replace('.','/')+'.olean')),source]
    if mode.startswith('kernel'): cmd=[binary+'leanchecker',module]
    start=time.monotonic()
    try:
        p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True,timeout=120)
        rec=dict(source=source,sha256=hashlib.sha256(data).hexdigest(),command=cmd,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr,seconds=time.monotonic()-start,lean_path=env['LEAN_PATH'])
    except subprocess.TimeoutExpired as e:
        rec=dict(source=source,command=cmd,timeout=True,seconds=time.monotonic()-start)
    records.append(rec)
    (out/('run-'+stamp+'.json')).write_text(json.dumps(records,indent=2)+'\n')
    print(json.dumps(rec),flush=True)
    if rec.get('returncode',1): sys.exit(1)
