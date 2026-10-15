"""Machine-authored foreground kernel replay of a source-bound module union."""
import json,time,subprocess,sys
from validate_0a5fcabe import R,O,env,sha
mods=sys.argv[1:]
if mods[0]=='current':
 inv=json.loads((O/'MarkovAuditM38E-inventory.json').read_text());mods=list(inv['modules'])
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--run',str(R/'research/ReplayBatch07F1.lean'),*mods]
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=R,env=env,text=True,capture_output=True,timeout=300);d=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:d=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
d.update(modules=sources,command=cmd,driver_sha256=sha(R/'research/ReplayBatch07F1.lean'),seconds=time.monotonic()-t,limits='Selected modules excluded from inherited import boundary; inherited compiled imports reused. No fresh whole-source rebuild.')
p=O/f'kernel-union-{time.time_ns()}.json';p.write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(dict(receipt=str(p.relative_to(R)),returncode=d.get('returncode'),timeout=d.get('timeout',False),seconds=d['seconds'],stdout=d['stdout'][-1000:])),flush=True)
sys.exit(d.get('returncode',1))
