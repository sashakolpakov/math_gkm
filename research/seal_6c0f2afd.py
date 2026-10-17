"""Machine-authored final hash binding and preservation checks."""
from finish_6c0f2afd import R,O,sha,finish
import json,hashlib
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in idx.items()}
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert all(bindings.values())
(O/'final-bindings.json').write_text(json.dumps(dict(inherited=bindings,canonical_contract_sha256=ch,root_sha256=sha(R/'MathGKM/Markov.lean'),validation_sha256=sha(O/'validation.json'),completion=None),indent=2))
finish()
