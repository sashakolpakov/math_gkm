"""Live worker fa9eb434: reconcile only; no inherited side effects replayed."""
from pathlib import Path
import json,hashlib,shutil,importlib.util
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fa9eb434';O.mkdir();(R/'research/markov-fa9eb434-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
for k,v in json.loads((R/'evidence/markov-8067e0c5/artifact-verification.json').read_text())['files'].items():checks[k]=dict(expected=v,actual=sha(R/k))
receipt=json.loads((R/'.control/markov/workers/000096/receipt.json').read_text())
raw=[json.loads(x) for x in (R/'.control/markov/workers/000096/events.jsonl').read_text().splitlines()]
assert all(v['expected']==v['actual'] for v in checks.values())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,previous_outcome=receipt['outcome'],last_events=raw[-5:],event_count=len(raw),conclusion='Worker 96 completed. All inherited hashes match. Worker 95 reconciled earlier interruptions. No previous setup/finalizer replayed.'),indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
prior=R/'evidence/markov-8067e0c5';(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Higher-priority read denial: not accessed; unique research temporary directory used.',heredoc='First shell heredoc failed because its implicit temporary file was denied; no setup write occurred. Used apply_patch instead.'),indent=2)+'\n')
(R/'research/validate_fa9eb434.py').write_text((R/'research/validate_8067e0c5.py').read_text().replace('8067e0c5','fa9eb434'))
(R/'research/markov-fa9eb434-checkpoint.md').write_text('# Live research fa9eb434\n\nExact root remains open. Mission, design, pinned root, independent target/residual/mathematical audits and latest report read. Completed worker 96 reconciled, hashes verified, no interrupted side effects replayed. Investigating full fourth numerator chamber/source bridge.\n')
print(json.dumps(dict(verified_hashes=len(checks),previous_outcome=receipt['outcome'],raw_event_count=len(raw),last_event_types=[x.get('type') for x in raw[-5:]],inherited_keys=list(inh),capabilities=json.loads((O/'capabilities.json').read_text())),indent=2))
