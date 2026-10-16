"""Machine-authored final documentation/hash checkpoint; preserve first manifest."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-d11e335e'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for name in ['manifest','last-verification']:
 old=O/f'{name}.json'; keep=O/f'{name}-initial.json'
 assert not keep.exists()
 keep.write_bytes(old.read_bytes())
manifest={}
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:
  manifest[str(p.relative_to(R))]=sha(p)
for p in (R/'research').iterdir():
 if p.is_file() and ('d11e335e' in p.name or 'MD11' in p.name):
  manifest[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
before=json.loads((O/'before.json').read_text())
prior={p:h for p,h in before.items() if 'd11e335e' not in p and 'MD11' not in p}
assert all(sha(R/p)==h for p,h in prior.items())
root=sha(R/'MathGKM/Markov.lean')
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
out={'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),
 'root_sha256':root,'canonical_contract_hash':ch,'unchanged_prior_inputs':len(prior),
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),
 'scope':'Final documentation refresh; first completed manifest and verification preserved.'}
(O/'last-verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
