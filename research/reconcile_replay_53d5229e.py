"""Fresh foreground replay and axiom check of interrupted worker's final bytes."""
from pathlib import Path
import json,os,subprocess,time,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-53d5229e'
inv=json.loads((R/'evidence/markov-07f1d410/audit-inventory.json').read_text())
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(O)+':'+json.loads((O/'inherited-lean-path.json').read_text()))
cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--run',str(R/'research/ReplayBatch07F1.lean'),*inv['modules']]
t=time.monotonic()
try:
 x=subprocess.run(cmd,cwd=R,env=env,text=True,capture_output=True,timeout=150)
 rec=dict(returncode=x.returncode,stdout=x.stdout,stderr=x.stderr)
except subprocess.TimeoutExpired as e:rec=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
rec.update(command=cmd,seconds=time.monotonic()-t,source_hashes={m:hashlib.sha256((R/'research'/f'{m}.lean').read_bytes()).hexdigest() for m in inv['modules']},limits='Union of new worker-80 constants replayed over inherited compiled boundary; no whole-source rebuild.')
(O/'inherited-union-replay.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
(R/'research/MarkovInheritedAudit53D.lean').write_text(''.join(f'import {m}\n' for m in inv['modules'])+'\n'+''.join(f'#print axioms MathGKM.Markov.{n}\n' for _,n in inv['theorems']))
