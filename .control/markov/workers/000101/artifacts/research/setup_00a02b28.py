"""Machine-authored live request 00a02b28: reconciliation, no inherited mutation replay."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-00a02b28'
O.mkdir(exist_ok=False)
(R/'research/markov-00a02b28-work').mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=R/'evidence/markov-1b02dddc'
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
for k,v in json.loads((prior/'artifact-verification.json').read_text())['files'].items():
 checks[k]=dict(expected=v,actual=sha(R/k))
worker=R/'.control/markov/workers/000100'
receipt=json.loads((worker/'receipt.json').read_text())
events=[json.loads(x) for x in (worker/'events.jsonl').read_text().splitlines()]
assert all(v['expected']==v['actual'] for v in checks.values())
v=json.loads((prior/'validation.json').read_text())
assert all(x['kernel_replay_passed'] for x in v['modules'])
rec=dict(checks=checks,previous_outcome=receipt['outcome'],last_events=events[-3:],event_count=len(events),accepted_modules=len(v['modules']),axiom_closures=len(v['axiom_audit']),conclusion='Worker 100 completed. Source-bound accepted inventory and raw terminal events inspected. Unaccepted generated onset gap modules remain candidates. Older interruption reconciliations retained; no possibly completed mutations replayed.')
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority sandbox; use unique research work directory.',heredoc='One initial zsh heredoc failed before Python execution: shell could not create temporary file. No Python side effects.',hosted_web='Publisher opened successfully. No shell networking used.'),indent=2)+'\n')
for name in ['validate','replay_union','batch']:
 text=(R/f'research/{name}_1b02dddc.py').read_text().replace('1b02dddc','00a02b28')
 (R/f'research/{name}_00a02b28.py').write_text(text)
(R/'research/markov-00a02b28-checkpoint.md').write_text('# Request 00a02b28\n\nMachine-authored experimental research. Full pinned root remains open. Read mission/design, contract, inherited index, independent target/residual/mathematical audits and latest handoff. Reconciled completed worker 100 and verified inherited hashes. Investigating five onset inequalities via separately checked polynomial certificates, preserving raw coefficients and all root scope.\n')
print(json.dumps(dict(verified_hashes=len(checks),prior_outcome=receipt['outcome'],prior_modules=len(v['modules']),raw_events=len(events))))
