"""Machine-authored final integrity check. Contract identifier is canonical JSON SHA256."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0a5fcabe'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
m=json.loads((O/'artifact-verification.json').read_text())['files']
assert all(sha(R/k)==h for k,h in m.items())
v=json.loads((O/'validation.json').read_text())
assert all(d['kernel_replay_passed'] and d['axiom_audit_complete'] and
 sha(R/d['source'])==d['sha256'] and sha(O/(d['module']+'.olean'))==d['olean_sha256'] for d in v['modules'])
contract=R/'.control/markov/contract.json'
canonical=hashlib.sha256(json.dumps(json.loads(contract.read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
d=dict(artifacts_verified=len(m),accepted_modules_verified=len(v['modules']),theorem_closures=len(v['axiom_audit']),contract_canonical_hash=canonical,contract_file_hash=sha(contract),root_hash=sha(R/'MathGKM/Markov.lean'),all_passed=True,completion=None,operational_correction='Initial ad-hoc final check incorrectly compared the request canonical contract hash with the raw file hash and raised AssertionError. Canonical sorted compact ASCII JSON matches the request exactly. Raw contract bytes are unchanged from the initial preservation manifest; no contract was edited.')
(O/'last-verification.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(d),flush=True)
