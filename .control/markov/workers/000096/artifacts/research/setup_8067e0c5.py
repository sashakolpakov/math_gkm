"""Machine-authored live research reconciliation; no prior write is replayed."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-8067e0c5'
O.mkdir(); (R/'research/markov-8067e0c5-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
for k,v in json.loads((R/'evidence/markov-96dea62b/artifact-verification.json').read_text())['files'].items():
 checks[k]=dict(expected=v,actual=sha(R/k))
receipt=json.loads((R/'.control/markov/workers/000095/receipt.json').read_text())
raw=[json.loads(x) for x in (R/'.control/markov/workers/000095/events.jsonl').read_text().splitlines()]
assert all(v['expected']==v['actual'] for v in checks.values())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,previous_outcome=receipt['outcome'],last_events=raw[-5:],event_count=len(raw),conclusion='Worker 95 completed and reconciled earlier interruptions. Its artifact hashes match. No previous setup or finalizer was replayed.'),indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
prior=R/'evidence/markov-96dea62b'
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Higher-priority policy denies reads; not accessed. Unique research temporary directory used.'),indent=2)+'\n')
(R/'research/validate_8067e0c5.py').write_text((R/'research/validate_96dea62b.py').read_text().replace('96dea62b','8067e0c5'))
(R/'research/markov-8067e0c5-checkpoint.md').write_text('# Live research 8067e0c5\n\nRead mission and design fully, exact contract, inherited index and independent audits. Reconciled completed predecessor 95, including raw final events and hashes. Exact root remains open. Investigating general first shifted block by separating parameter substitutions and coefficient identities; no prior writes replayed.\n')
print(dict(verified_hashes=len(checks),previous_outcome=receipt['outcome'],raw_events=len(raw)))
