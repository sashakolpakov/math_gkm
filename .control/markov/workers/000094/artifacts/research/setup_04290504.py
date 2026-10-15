"""Machine-authored live Markov research; reconcile interrupted worker, no replay."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-04290504'
O.mkdir(); (R/'research/markov-04290504-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
prior=R/'evidence/markov-cc599cf1'
manifest=json.loads((prior/'artifact-verification.json').read_text())
for k,v in manifest['files'].items(): checks.append(dict(path=k,expected=v,actual=sha(R/k)))
receipt=json.loads((R/'.control/markov/workers/000093/receipt.json').read_text())
for k,x in receipt['changes'].items():
 if x['after'] and not k.startswith('.scratch/'): checks.append(dict(path=k,expected=x['after'],actual=sha(R/k)))
assert all(x['actual']==x['expected'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000093/events.jsonl').read_text().splitlines()]
val=json.loads((prior/'validation.json').read_text())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,last_raw_events=events[-5:],prior_outcome=receipt['outcome'],prior_modules=len(val['modules']),prior_theorems=len(val['axioms']),conclusion='Outer timeout after finalization. Raw event log shows finalizer exited successfully and STOP check returned. Sixteen modules and 41 closures recorded as checked; 16 excluded drafts remain unproved. All saved artifact hashes match. No prior side effect replayed.'),indent=2)+'\n')
protected={x['path']:x['actual'] for x in checks}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority policy; not accessed. Unique research temporary directory used.'),indent=2)+'\n')
for base in ['validate','replay_union']:
 (R/f'research/{base}_04290504.py').write_text((R/f'research/{base}_cc599cf1.py').read_text().replace('cc599cf1','04290504'))
(R/'research/markov-04290504-checkpoint.md').write_text('# Checkpoint 04290504\n\nMachine-authored live research. Mission/design and independent audits read completely. Interrupted worker 93 reconciled: final artifacts were saved before outer timeout; no effects replayed. Exact root open. Investigating a tractable whole-block polynomial certificate.\n')
print(dict(verified_hashes=len(checks),modules=len(val['modules']),closures=len(val['axioms'])))
