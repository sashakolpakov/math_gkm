"""Machine-authored final local validation and binding receipts."""
from pathlib import Path
import json,hashlib,re
from finish_41b38611 import validate,finish
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-41b38611'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'planned-modules.json').read_text())
data=validate(mods)
records=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
failures=[dict(receipt=str(p.relative_to(R)),modules=d.get('modules'),timeout=d.get('timeout',False),returncode=d.get('returncode'),seconds=d['seconds']) for p,d in records if d.get('returncode')!=0]
(O/'failed-build-index.json').write_text(json.dumps(failures,indent=2))
drafts={p.stem:sha(p) for p in (R/'research').glob('*M41B.lean') if p.stem not in mods and not p.stem.startswith(('Replay','MarkovAudit'))}
(O/'unaccepted-drafts.json').write_text(json.dumps(dict(sources=drafts,meaning='Only final source hashes listed in validation.json are accepted. Rejected intermediate snapshots remain in immutable build receipts.'),indent=2))
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={p:sha(R/p)==v['sha256'] for p,v in idx.items()}
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
root=sha(R/'MathGKM/Markov.lean')
assert all(bindings.values())
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
(O/'final-bindings.json').write_text(json.dumps(dict(request_id='41b38611ad354bc493dae65a2634a3d2',bindings=bindings,root_sha256=root,canonical_contract_sha256=ch,stop_file=(R/'.control/markov/STOP.json').exists(),completion=None),indent=2))
print(json.dumps(dict(modules=len(mods),closures=data['theorem_closures'],failed_builds=len(failures),timeouts=sum(x['timeout'] for x in failures),unaccepted_drafts=len(drafts))))
finish()
