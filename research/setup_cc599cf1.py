"""Machine-authored live request cc599cf12cc74c9e84112aac7bc0f9ac."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-cc599cf1'
O.mkdir(); (R/'research/markov-cc599cf1-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
prior=R/'evidence/markov-f2da221d'
v=json.loads((prior/'validation.json').read_text())
for x in v['modules']:
 checks.append(dict(path=x['source'],expected=x['sha256'],actual=sha(R/x['source'])))
manifest=json.loads((prior/'artifact-verification.json').read_text())
receipt=json.loads((R/'.control/markov/workers/000092/receipt.json').read_text())
for k,x in receipt['changes'].items():
 if x['after']: checks.append(dict(path=k,expected=x['after'],actual=sha(R/k)))
assert all(x['actual']==x['expected'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000092/events.jsonl').read_text().splitlines()]
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,last_raw_events=events[-2:],prior_manifest=manifest,conclusion='Worker 92 completed, with matching validated sources and final artifacts. Its reconciliation of interrupted worker 91 is preserved. No incomplete prior action is replayed.'),indent=2)+'\n')
protected={x['path']:x['actual'] for x in checks}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority policy; not accessed. Unique research temp directory used.',heredoc='Initial shell heredoc failed because shell could not create its temporary file; subsequent scripts use files.',source='Publisher accessed through hosted web tool.'),indent=2)+'\n')
for base in ['validate','replay_union']:
 (R/f'research/{base}_cc599cf1.py').write_text((R/f'research/{base}_f2da221d.py').read_text().replace('f2da221d','cc599cf1'))
(R/'research/markov-cc599cf1-checkpoint.md').write_text('# Checkpoint cc599cf1\n\nMachine-authored research. Mission/design, pinned contract, inherited index, latest results and independent audits read. Prior completion reconciled from raw events and current hashes; no prior side effects replayed. Exact root remains open. Investigating the missing run-four first-shift triple and a whole shifted-block representation.\n')
print(dict(verified_hashes=len(checks),capabilities=json.loads((O/'capabilities.json').read_text())))
