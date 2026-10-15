"""Machine-authored live worker 2532cf40: preservation and reconciliation only."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-2532cf40'
O.mkdir(); (O/'work').mkdir()
sha=lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-5dc9c88d'
v=json.loads((old/'artifact-verification.json').read_text())
checks={k:dict(expected=h,actual=sha(R/k)) for k,h in v['files'].items()}
assert all(x['expected']==x['actual'] for x in checks.values())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for k,v in inh.items():
 assert hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256']
 assert sha(R/k)==v['sha256']
events=[json.loads(s) for s in (R/'.control/markov/workers/000104/events.jsonl').read_text().splitlines()]
receipt=json.loads((R/'.control/markov/workers/000104/receipt.json').read_text())
rec=dict(checks=checks,inherited_index_verified=True,predecessor_outcome=receipt['outcome'],raw_event_count=len(events),last_events=events[-3:],finding='Predecessor completed. Read its final checkpoint, validation and final receipts; no interrupted side effect is replayed. Failed general middle candidates remain unaccepted.',completion=None)
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
paths=list(checks)+list(inh)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lakefile.toml','lake-manifest.json','lean-toolchain']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in paths},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'optimized-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=shutil.which('python3'),sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied; evidence work directory used',heredoc='Initial shell heredoc failed because default temp directory denied',source='Publisher opened live using hosted web tool'),indent=2)+'\n')
(R/'research/markov-2532cf40-checkpoint.md').write_text('# Request 2532cf40\n\nMachine-authored experimental research. Read MISSION.md and docs/DESIGN.md completely, contract, inherited index and independent audits. Exact root unresolved. Reconciled completed worker 104; no prior mutations replayed. First action: prove the five onset inequalities for numerator-one predecessors and connect them to the fourth slice. General charts may follow if resources permit.\n')
print('Verified',len(checks),'artifacts and',len(inh),'inherited entries. Previous validation:',(old/'validation.json').read_text()[:5000])
