"""Machine-authored request 94b1de05. Read-only inheritance reconciliation."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-94b1de05'
O.mkdir(); (R/'research/markov-94b1de05-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
prior=R/'evidence/markov-06b5b1f9'
for k,v in json.loads((prior/'artifact-verification.json').read_text())['files'].items():
 checks[k]=dict(expected=v,actual=sha(R/k))
worker=R/'.control/markov/workers/000098'
receipt=json.loads((worker/'receipt.json').read_text())
events=[json.loads(x) for x in (worker/'events.jsonl').read_text().splitlines()]
assert all(v['expected']==v['actual'] for v in checks.values())
v=json.loads((prior/'validation.json').read_text())
assert all(x['kernel_replay_passed'] for x in v['modules'])
rec=dict(checks=checks,previous_outcome=receipt['outcome'],last_events=events[-6:],event_count=len(events),accepted_modules=len(v['modules']),axiom_closures=len(v['axiom_audit']),conclusion='Worker 98 completed, with matching saved artifacts. Its reconciliation of interrupted worker 97 is retained. No inherited generator, finalizer or possibly completed mutation replayed.')
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority policy; unique research temporary directory used.',file_discovery='Initial rg discovery reported permission errors on .git and .scratch despite exclusion globs; no content obtained. Later discovery uses explicitly allowed directories only.'),indent=2)+'\n')
for name in ['validate','replay_union']:
 (R/f'research/{name}_94b1de05.py').write_text((R/f'research/{name}_06b5b1f9.py').read_text().replace('06b5b1f9','94b1de05'))
(R/'research/markov-94b1de05-checkpoint.md').write_text('# Request 94b1de05\n\nMachine-authored live research. Mission/design fully read; pinned root and independent audits read. Worker 98 and its predecessor reconciliation inspected, hashes checked. Root remains open. Investigating the weaker fourth-tail threshold n+k>=7, then remaining fourth-slice blocks. No inherited mutations replayed.\n')
print(json.dumps(dict(verified_hashes=len(checks),prior_outcome=receipt['outcome'],prior_modules=len(v['modules']),raw_events=len(events))))
