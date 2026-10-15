"""Machine-authored request 5110b3fa. Reconcile receipts without replaying mutations."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-5110b3fa'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
prior=R/'.control/markov/workers/000111'
receipt=json.loads((prior/'receipt.json').read_text())
checks={k:dict(expected=v['after'],actual=sha(R/k) if (R/k).is_file() else None) for k,v in receipt['changes'].items()}
assert all(v['expected']==v['actual'] for v in checks.values())
assert all(v['expected']==v['actual'] for v in ic.values())
v=json.loads((R/'evidence/markov-13d40bd7/validation.json').read_text())
for name,d in v['modules'].items():
 assert sha(R/d['source'])==d['sha256']
 assert sha(R/'evidence/markov-13d40bd7'/f'{name}.olean')==d['olean_sha256']
 assert d['kernel_replay_passed'] and d['axiom_audit_complete']
out=dict(request_id='5110b3fac1864ad1b18b3138b0f468e8',prior_worker=111,changes=checks,inherited=ic,prior_validation=sha(R/'evidence/markov-13d40bd7/validation.json'),finding='Predecessor completed, not interrupted. Its source/olean hashes and replay/audit flags match. No prior generators rerun. Its superseded failed duplicate-name candidates are excluded. Earlier worker 110 interruption was reconciled by worker 111; no new partial effects inferred.')
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']+list((R/'research').glob('*.lean'))+list((R/'research').glob('*.md'))
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
lp=str(R/'evidence/markov-13d40bd7')+':'+json.loads((R/'evidence/markov-13d40bd7/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by active higher-priority policy; not accessed. Unique research/evidence files instead.',web='Hosted primary-source retrieval succeeded; shell network not attempted.',git='Not accessed; subprocesses set GIT_CONFIG_NOSYSTEM=1 and GIT_CONFIG_GLOBAL=/dev/null.'),indent=2)+'\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),prior_modules=len(v['modules']),inputs=len(files))))
