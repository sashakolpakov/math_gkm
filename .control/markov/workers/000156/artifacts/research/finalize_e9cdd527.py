"""Machine-authored source-bound inventory; operational checks, not root admission."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-e9cdd527'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
receipts=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
checked={}
for m in mods:
 p=R/'research'/f'{m}.lean';h=sha(p)
 candidates=[str(p.relative_to(R)) for p,v in receipts if v.get('returncode')==0 and v['modules'].get(m)==h]
 assert candidates,(m,h)
 assert not re.search(r'\b(sorry|admit|native_decide)\b',p.read_text()),m
 checked[m]={'source_sha256':h,'build_receipts':candidates,'olean_sha256':sha(O/f'{m}.olean')}
hashes={m:v['source_sha256'] for m,v in checked.items()}
valid=[(p,v) for p in O.glob('replay-*.json') if (v:=json.loads(p.read_text())).get('returncode')==0 and v['modules']==hashes]
assert valid,'No exact matching joint replay'
axvalid=[(p,v) for p in O.glob('axioms-*.json') if (v:=json.loads(p.read_text()))['sources']==hashes]
assert axvalid,'No exact matching closure audit'
validation={'request_id':'e9cdd527ea604fdcb514caecc8cc9944',
 'status':'local builds, joint isolated kernel replay and explicit axiom closure audit passed',
 'modules':checked,'replay':str(valid[-1][0].relative_to(R)),
 'axioms':str(axvalid[-1][0].relative_to(R)),
 'theorem_closures':len(axvalid[-1][1]['declarations']),
 'limits':'Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit. Full root unresolved.'}
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before=json.loads((O/'before.json').read_text())
own_initial={'research/setup_e9cdd527.py'}
changed=[p for p,h in before.items() if p not in own_initial and (not (R/p).exists() or sha(R/p)!=h)]
assert not changed,changed
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert sha(R/'MathGKM/Markov.lean')==contract['root_sha256']
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc',canonical
check={'snapshot_count':len(before),'inherited_input_count':len(before)-len(own_initial),
 'changed_inherited_inputs':changed,'self_owned_initial_paths':sorted(own_initial),
 'changed_self_owned':[p for p in own_initial if sha(R/p)!=before[p]],
 'root_sha256':sha(R/'MathGKM/Markov.lean'),'canonical_contract_hash':canonical,
 'stop_present':(R/'.control/markov/STOP.json').exists(),
 'unsuccessful_builds':sum(v.get('returncode')!=0 for p,v in receipts),'completion':None}
(O/'final-check.json').write_text(json.dumps(check,indent=2)+'\n')
new=[p for p in (R/'research').iterdir() if p.is_file() and
     (str(p.relative_to(R)) not in before or 'e9cdd527' in p.name or 'ME9C' in p.name)]
new += [p for p in O.iterdir() if p.is_file() and p.name not in ['manifest.json','last-verification.json']]
manifest={str(p.relative_to(R)):sha(p) for p in new}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
last={'artifact_count':len(manifest),'mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
 'inherited_input_count':len(before)-len(own_initial),
 'changed_inherited_inputs':[p for p,h in before.items() if p not in own_initial and sha(R/p)!=h],
 'manifest_sha256':sha(O/'manifest.json'),'completion':None}
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps({'validation':validation['status'],'modules':len(mods),
 'theorem_closures':validation['theorem_closures'],'final_check':check,'artifacts':len(manifest)}))
