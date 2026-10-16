"""Machine-authored final evidence bindings; never edits controller records."""
from pathlib import Path
import json,hashlib,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1bb0aa1e'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
before=json.loads((O/'before.json').read_text())
changed=[p for p,h in before.items() if not (R/p).is_file() or sha(R/p)!=h]
assert not changed,changed
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
validation=json.loads((O/'validation.json').read_text())
assert validation['completion'] is None and validation['new_theorems']==43
files=[]
for p in (R/'research').rglob('*'):
 if p.is_file() and str(p.relative_to(R)) not in before:files.append(p)
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:files.append(p)
builds=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
result={'request_id':'1bb0aa1ee066482294f620401d001bf2','root_sha256':root,'canonical_contract_sha256':ch,
 'unchanged_inherited_inputs':len(before),'changed_inherited_inputs':changed,
 'validation_sha256':sha(O/'validation.json'),'new_modules':len(validation['new_modules']),
 'new_theorems':validation['new_theorems'],'reconciled_inherited_theorems':validation['inherited_theorems'],
 'unsuccessful_builds':[str(p.relative_to(R)) for p,v in builds if v.get('returncode')!=0],
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None,
 'status':'Partial mathematical progress only; no whole-source rebuild or independent completion audit.'}
(O/'final-check.json').write_text(json.dumps(result,indent=2)+'\n')
files.append(O/'final-check.json')
manifest={str(p.relative_to(R)):sha(p) for p in sorted(set(files))}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
bad=[p for p,h in manifest.items() if sha(R/p)!=h];assert not bad,bad
last={'manifest_sha256':sha(O/'manifest.json'),'verified_artifacts':len(manifest),'artifact_bytes':sum((R/p).stat().st_size for p in manifest),
 'mismatches':bad,'unchanged_inherited_inputs':len(before),'root_sha256':root,'canonical_contract_sha256':ch,'completion':None}
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n');print(json.dumps(last))
