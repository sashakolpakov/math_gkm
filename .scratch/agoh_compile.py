# Actual Codex/Astra proof compilation helper, 2026-10-13.
import os, pathlib, subprocess, sys, json, time
root=pathlib.Path('/Users/sasha/math_gkm')
tc=pathlib.Path('/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2')
env=os.environ.copy()
env['LEAN_PATH']=':'.join([str(tc/'lib/lean'),str(root/'.scratch/agoh')]+[str(p/'.lake/build/lib/lean') for p in sorted((root/'.lake/packages').iterdir())])
source=sys.argv[1]
out=root/'.scratch/agoh'/pathlib.Path(source).with_suffix('.olean')
out.parent.mkdir(parents=True,exist_ok=True)
cmd=[str(tc/'bin/lean'),'-o',str(out),source]
r=subprocess.run(cmd,env=env,text=True,capture_output=True)
print(r.stdout,end=''); print(r.stderr,end='')
record={'source':source,'command':cmd,'lean_path':env['LEAN_PATH'],'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr}
(root/'evidence/agoh'/('compile-'+str(time.time_ns())+'.json')).write_text(json.dumps(record,indent=2))
sys.exit(r.returncode)
