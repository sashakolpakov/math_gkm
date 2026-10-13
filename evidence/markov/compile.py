"""Pinned standalone compilation; each attempt retained, without admission claims."""
import json, os, subprocess, sys, time
from pathlib import Path
root=Path(__file__).resolve().parents[2]
tc=Path('/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2')
out=root/'.scratch/markov'
env=os.environ.copy()
env['LEAN_PATH']=':'.join(map(str,[tc/'lib/lean',out]+[p/'.lake/build/lib/lean' for p in sorted((root/'.lake/packages').iterdir())]))
modules=sys.argv[1:] or ['MathGKM.Markov']
records=[]
for module in modules:
    target=out/(module.replace('.','/')+'.olean'); target.parent.mkdir(parents=True,exist_ok=True)
    cmd=[str(tc/'bin/lean'),'-o',str(target),module.replace('.','/')+'.lean']
    start=time.monotonic()
    r=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True,timeout=180)
    records.append(dict(module=module,command=cmd,returncode=r.returncode,stdout=r.stdout,stderr=r.stderr,seconds=time.monotonic()-start))
    print(r.stdout+r.stderr,flush=True)
    print(module, r.returncode,flush=True)
    if r.returncode: break
path=root/'evidence/markov'/('compile-'+str(time.time_ns())+'.json')
path.write_text(json.dumps(dict(lean_path=env['LEAN_PATH'],records=records),indent=2)+'\n')
sys.exit(records[-1]['returncode'])
