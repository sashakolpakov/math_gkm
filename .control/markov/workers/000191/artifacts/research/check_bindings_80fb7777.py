"""Machine-authored final exact pinned-binding check; no control mutation."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-80fb7777'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in idx.items()}
contract=json.loads((R/'.control/markov/contract.json').read_text())
h=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
root=sha(R/'MathGKM/Markov.lean')
assert all(bindings.values())
assert h=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
d=dict(bindings=bindings,canonical_contract_sha256=h,root_sha256=root,
 stop_file=(R/'.control/markov/STOP.json').exists(),completion=None)
(O/'final-bindings.json').write_text(json.dumps(d,indent=2))
print(json.dumps(d))
