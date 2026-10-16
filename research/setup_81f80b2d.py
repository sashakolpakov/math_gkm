"""Machine-authored request 81f80b2d: reconcile before new research actions."""
from pathlib import Path
import hashlib,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-81f80b2d'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
out={'request_id':'81f80b2ddbc44c6e86d8079cfc7a8e81','inherited':{k:sha(R/k)==v['sha256'] for k,v in idx.items()}}
for tag in ['d11e335e','5703599b']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 out[tag]={'checked':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
p=R/'.control/markov/workers/000133/events.jsonl'
es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
rc=json.loads((p.parent/'receipt.json').read_text())
out['interrupted_worker']={'sha256':sha(p),'count':len(es),'last_events':es[-4:],'outcome':rc['outcome'],'returncode':rc['returncode'],'elapsed_seconds':rc['elapsed_seconds']}
out['reconciliation']='Worker 133 timed out at reporting after its finalizer completed. Its 180 manifested artifacts, 30 compiled/replayed modules and 48 audited theorem closures are preserved; no side effect replayed. Its b>=2a row-two theorem and residual are inherited, not new results of this run.'
out['capabilities']=['Higher-priority policy denies .scratch; no access attempted. Unique research/evidence files used.','zsh heredoc failed to create a temporary file; use apply_patch and Python scripts.']
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-5703599b')+':'+json.loads((R/'evidence/markov-5703599b/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_5703599b.py','validate_81f80b2d.py'),('audit_5703599b.py','audit_81f80b2d.py'),('ReplayIsolatedM570.lean','ReplayIsolatedM81F.lean')]:
 s=(R/'research'/old).read_text().replace('5703599b','81f80b2d').replace('M570','M81F')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in out.items() if k!='interrupted_worker'}))
