"""Machine-authored research setup; only new evidence is written."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ead8a96f'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
receipt=json.loads((R/'.control/markov/workers/000115/receipt.json').read_text())
checks={k:dict(expected=v['after'],actual=sha(R/k) if (R/k).is_file() else None) for k,v in receipt['changes'].items()}
assert all(v['expected']==v['actual'] for v in checks.values())
assert all(v['expected']==v['actual'] for v in ic.values())
v=json.loads((R/'evidence/markov-7584c5d0/validation.json').read_text())
for name,d in v['modules'].items():
 assert sha(R/d['source'])==d['sha256']
 assert sha(R/'evidence/markov-7584c5d0'/f'{name}.olean')==d['olean_sha256']
 assert d['kernel_replay_passed'] and d['axiom_audit_complete']
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='ead8a96ffc1e4391a573c70eab8b255a',prior_worker=115,changes=checks,inherited=ic,prior_validation=sha(R/'evidence/markov-7584c5d0/validation.json'),finding='Worker 115 completed. Source/olean hashes match; no pending side effect replayed. Earlier interruptions reconciled by completed workers.'),indent=2)+'\n')
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']+list((R/'research').glob('*.lean'))+list((R/'research').glob('*.md'))
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
lp=str(R/'evidence/markov-7584c5d0')+':'+json.loads((R/'evidence/markov-7584c5d0/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by higher-priority policy; not accessed. Unique research/evidence paths used.',heredoc='Failed before Python execution: zsh cannot create temp file. Project scripts used.',git='Not accessed; configured environment supplied to subprocesses.'),indent=2)+'\n')
src=(R/'research/validate_7584c5d0.py').read_text().replace('7584c5d0','ead8a96f')
(R/'research/validate_ead8a96f.py').write_text(src)
print(json.dumps(dict(artifacts=len(checks),inherited=list(ic),prior_modules=len(v['modules']),inputs=len(files),stop=(R/'.control/markov/STOP.json').exists())))
