"""Machine-authored request 06b5b1f9: read-only predecessor reconciliation."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-06b5b1f9'
O.mkdir(); (R/'research/markov-06b5b1f9-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
prior=R/'evidence/markov-fa9eb434'
for k,v in json.loads((prior/'artifact-verification.json').read_text())['files'].items():
 checks[k]=dict(expected=v,actual=sha(R/k))
worker=R/'.control/markov/workers/000097'
receipt=json.loads((worker/'receipt.json').read_text())
events=[json.loads(x) for x in (worker/'events.jsonl').read_text().splitlines()]
assert all(v['expected']==v['actual'] for v in checks.values())
v=json.loads((prior/'validation.json').read_text())
assert all(x['kernel_replay_passed'] for x in v['modules'])
rec=dict(checks=checks,previous_outcome=receipt['outcome'],last_events=events[-6:],event_count=len(events),accepted_modules=len(v['modules']),axiom_closures=len(v['axiom_audit']),conclusion='Worker 97 timed out at outer transport, after its finalizer returned successfully. All 49 claimed accepted modules have validation/replay receipts, with hashes matching. Excluded drafts remain excluded. No inherited mutable action replayed.')
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
for p in R.joinpath('research').glob('*FA.lean'):protected[str(p.relative_to(R))]=sha(p)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority filesystem policy; not accessed. Unique research temporary directory used.',heredoc='Initial read-only Python here-document failed to create implicit temporary file; no mutation.'),indent=2)+'\n')
(R/'research/validate_06b5b1f9.py').write_text((R/'research/validate_fa9eb434.py').read_text().replace('fa9eb434','06b5b1f9'))
(R/'research/markov-06b5b1f9-checkpoint.md').write_text('# Request 06b5b1f9\n\nMission and design read completely; exact root and three independent audits read. Worker 97 reconciled: outer timeout followed completed finalizer, matching artifacts and 49 accepted modules. No inherited effects replayed. Full Conjecture63 remains open. Investigating chamber/source identities and exact inequality transport.\n')
print(json.dumps(dict(verified_hashes=len(checks),prior_outcome=receipt['outcome'],prior_modules=len(v['modules']),raw_events=len(events),capabilities=json.loads((O/'capabilities.json').read_text()))))
