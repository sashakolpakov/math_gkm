"""Machine-authored research request 9e104e0c; read-only predecessor reconciliation."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-9e104e0c'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
receipt=json.loads((R/'.control/markov/workers/000112/receipt.json').read_text())
checks={k:dict(expected=v['after'],actual=sha(R/k) if (R/k).is_file() else None) for k,v in receipt['changes'].items()}
assert all(v['expected']==v['actual'] for v in checks.values())
assert all(v['expected']==v['actual'] for v in ic.values())
v=json.loads((R/'evidence/markov-5110b3fa/validation.json').read_text())
for name,d in v['modules'].items():
 assert sha(R/d['source'])==d['sha256']
 assert sha(R/'evidence/markov-5110b3fa'/f'{name}.olean')==d['olean_sha256']
 assert d['kernel_replay_passed'] and d['axiom_audit_complete']
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='9e104e0c0bd245b08fe1674f6fdfedec',prior_worker=112,changes=checks,inherited=ic,prior_validation=sha(R/'evidence/markov-5110b3fa/validation.json'),finding='Worker 112 completed, no pending candidates or executions reported. Source and olean hashes match. No inherited generators replayed; previous interruptions already reconciled.'),indent=2)+'\n')
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']+list((R/'research').glob('*.lean'))+list((R/'research').glob('*.md'))
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
lp=str(R/'evidence/markov-5110b3fa')+':'+json.loads((R/'evidence/markov-5110b3fa/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by higher-priority policy, not accessed. Unique research/evidence files used.',heredoc='First Python shell heredoc failed: cannot create temp file; replaced by project source file.',git='Not accessed; validation subprocesses set required Git environment.'),indent=2)+'\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),prior_modules=len(v['modules']),inputs=len(files))))
