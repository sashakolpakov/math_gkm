"""Machine-authored live request 5dc9c88d: reconcile, preserve, never replay setup."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-5dc9c88d'
O.mkdir(exist_ok=False); (O/'work').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-722898f8'
checks={}
for k,v in json.loads((old/'artifact-verification.json').read_text())['files'].items():
 checks[k]={'expected':v,'actual':sha(R/k)}
assert all(x['expected']==x['actual'] for x in checks.values())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for k,v in inh.items():
 assert hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256']
 assert sha(R/k)==v['sha256']
events=[json.loads(s) for s in (R/'.control/markov/workers/000103/events.jsonl').read_text().splitlines()]
rec=json.loads((R/'.control/markov/workers/000103/receipt.json').read_text())
last=[x for x in events if x.get('type')=='item.completed'][-5:]
reconciliation=dict(request_id='5dc9c88dfee041f18445d13ddd622849',checks=checks,inherited_index_verified=True,
 predecessor_outcome=rec['outcome'],raw_event_count=len(events),last_completed_events=last,
 finding='Worker 103 finalized before its last nine-module union replay returned. That replay passed after validation.json was written; the low-direct audit and individual replay timed out. No setup, build, or mutation was blindly replayed. New modules and receipts use unique names.',
 previous_reconciliation='evidence/markov-722898f8/reconciliation.json',completion=None)
(O/'reconciliation.json').write_text(json.dumps(reconciliation,indent=2)+'\n')
paths=list(checks)+list(inh)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lakefile.toml','lake-manifest.json','lean-toolchain']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in paths},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=shutil.which('python3'),sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority permission profile; use evidence/markov-5dc9c88d/work instead',shell_network='disabled'),indent=2)+'\n')
(R/'research/markov-5dc9c88d-checkpoint.md').write_text('# Live request 5dc9c88d\n\nMachine-authored. Read mission/design and pinned root, inherited index and independent target/residual audits. Reconciled worker 103 raw events and 398 artifact hashes; its final union replay postdated its validation inventory. Low-direct replay/audit timed out. No prior writes repeated. Exact root unresolved.\n\nChosen action: complete the two general middle-interval parameter charts by splitting polynomial gap certificates into independently checked coefficients, then connect them to actual raw source coefficients. Keep all original scope restrictions.\n')
print('Verified',len(checks),'predecessor artifacts; initialized',O)
