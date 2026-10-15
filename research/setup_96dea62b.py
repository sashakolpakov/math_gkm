"""Machine-authored live research: reconciliation only, no prior actions replayed."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-96dea62b'
O.mkdir(); (R/'research/markov-96dea62b-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
for tag in ['cc599cf1','04290504']:
 for k,v in json.loads((R/f'evidence/markov-{tag}/artifact-verification.json').read_text())['files'].items():
  checks[k]=dict(expected=v,actual=sha(R/k))
events={}
for n in ['000093','000094']:
 receipt=json.loads((R/f'.control/markov/workers/{n}/receipt.json').read_text())
 raw=[json.loads(x) for x in (R/f'.control/markov/workers/{n}/events.jsonl').read_text().splitlines()]
 events[n]=dict(outcome=receipt['outcome'],tail=raw[-5:],count=len(raw))
 for k,v in receipt['changes'].items():
  if v['after'] and not k.startswith('.scratch/'):
   checks[k]=dict(expected=v['after'],actual=sha(R/k))
assert all(v['expected']==v['actual'] for v in checks.values())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,events=events,conclusion='Both interrupted workers finalized saved artifacts before outer timeout. All hashes match. Worker 94 explicitly leaves 18 algebra-module kernel replays incomplete. No side effect replayed.'),indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
prior=R/'evidence/markov-04290504'
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority policy; not accessed',shell_heredoc='Failed because shell could not create temporary file; use apply_patch and unique research temporary directory'),indent=2)+'\n')
for base in ['validate','replay_union']:
 (R/f'research/{base}_96dea62b.py').write_text((R/f'research/{base}_04290504.py').read_text().replace('04290504','96dea62b'))
(R/'research/markov-96dea62b-checkpoint.md').write_text('# Live research checkpoint 96dea62b\n\nMission/design, independent target/residual/mathematical audits, inherited index and workers 93/94 reports and raw final events read. Hashes reconciled. Exact root remains open. Investigating the four early shifted offsets using the exact truncated convolution, rather than the invalid small-index falling-factorial substitution.\n')
print(dict(verified_hashes=len(checks)))
