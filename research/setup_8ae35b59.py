"""Machine-authored request 8ae35b59: read-only reconciliation, new evidence only."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-8ae35b59'
O.mkdir(); (R/'research/work-8ae35b59').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-2532cf40'
v=json.loads((old/'artifact-verification.json').read_text())
checks={k:dict(expected=h,actual=sha(R/k)) for k,h in v['files'].items()}
assert all(x['expected']==x['actual'] for x in checks.values())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for k,v in inh.items():
 assert hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256']
 assert sha(R/k)==v['sha256']
events=[json.loads(s) for s in (R/'.control/markov/workers/000105/events.jsonl').read_text().splitlines()]
receipt=json.loads((R/'.control/markov/workers/000105/receipt.json').read_text())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,inherited_index_verified=True,predecessor_outcome=receipt['outcome'],raw_event_count=len(events),last_events=events[-3:],finding='Worker 105 completed; no interrupted mutations replayed. Earlier interruptions reconciled by 104/105. Unaccepted middle candidates remain candidates.',completion=None),indent=2)+'\n')
paths=list(checks)+list(inh)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lakefile.toml','lake-manifest.json','lean-toolchain']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in paths},indent=2)+'\n')
pf=old/'optimized-lean-path.json'
if not pf.exists():pf=old/'inherited-lean-path.json'
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads(pf.read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=shutil.which('python3'),sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority sandbox; research/work-8ae35b59 used'),indent=2)+'\n')
(R/'research/markov-8ae35b59-checkpoint.md').write_text('# Request 8ae35b59\n\nMachine-authored live experimental research. Exact pinned root unresolved. Mission/design and independent audits read. Worker 105 completed and hashes reconciled. New action: central fourth-slice polynomial gap certificates, with Horner layout and staged coefficient assembly. Existing candidates are not assumed proved.\n')
print('Reconciled',len(checks),'artifacts;',len(inh),'inherited entries; prior outcome',receipt['outcome'])
