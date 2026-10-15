"""Machine-authored request 1b02dddc: read-only reconciliation and new evidence setup."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-1b02dddc'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
prior=R/'evidence/markov-94b1de05'
for k,v in json.loads((prior/'artifact-verification.json').read_text())['files'].items():
 checks[k]=dict(expected=v,actual=sha(R/k))
worker=R/'.control/markov/workers/000099'
receipt=json.loads((worker/'receipt.json').read_text())
events=[json.loads(x) for x in (worker/'events.jsonl').read_text().splitlines()]
assert all(v['expected']==v['actual'] for v in checks.values())
v=json.loads((prior/'validation.json').read_text())
assert all(x['kernel_replay_passed'] for x in v['modules'])
rec=dict(checks=checks,previous_outcome=receipt['outcome'],last_events=events[-3:],event_count=len(events),accepted_modules=len(v['modules']),axiom_closures=len(v['axiom_audit']),conclusion='Worker 99 completed. Matching artifacts and raw terminal events inspected. Earlier interruption reconciliations retained. No inherited generator, finalizer, controller or possibly completed mutation replayed.')
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority policy; unique research/markov-1b02dddc-work directory used.',heredoc='Two zsh heredoc commands failed before Python execution because shell could not create its temporary file. No side effects from those Python bodies.',hosted_web='Publisher successfully opened; shell networking not used.'),indent=2)+'\n')
for name in ['validate','replay_union']:
 text=(R/f'research/{name}_94b1de05.py').read_text().replace('94b1de05','1b02dddc').replace('markov-1b02dddc-tmp','markov-1b02dddc-work')
 (R/f'research/{name}_1b02dddc.py').write_text(text)
(R/'research/markov-1b02dddc-checkpoint.md').write_text('# Request 1b02dddc\n\nMachine-authored live experimental research. Pinned root remains open. Mission/design, contract, inherited index and independent target/residual/mathematical audits read. Worker 99 completed; hashes and raw terminal events checked. New route: exact two-block backwards extraction followed by the six third-block onset positions. All root directions, zeros and endpoints retained. No inherited mutations replayed.\n')
print(json.dumps(dict(verified_hashes=len(checks),prior_outcome=receipt['outcome'],prior_modules=len(v['modules']),raw_events=len(events))))
