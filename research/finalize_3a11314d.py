"""Machine-authored source-bound inventory and preservation checks. Not root admission."""
from pathlib import Path
import json,hashlib,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-3a11314d'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovFibLowM3A1','MarkovCentralSumsM3A1','MarkovCentralSquareM3A1','MarkovSourceCentralM3A1','MarkovCentralLinearM3A1','MarkovResidualM3A1','MarkovCentralWitnessM3A1']
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
receipts=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
checked={}
for m in mods:
 p=R/'research'/f'{m}.lean';h=sha(p)
 candidates=[str(p.relative_to(R)) for p,v in receipts if v.get('returncode')==0 and v['modules'].get(m)==h]
 assert candidates,(m,h)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',p.read_text()),m
 checked[m]={'source_sha256':h,'build_receipts':candidates,'olean_sha256':sha(O/f'{m}.olean')}
replays=[(p,json.loads(p.read_text())) for p in O.glob('replay-*.json')]
valid=[(p,v) for p,v in replays if v.get('returncode')==0 and v['modules']=={m:checked[m]['source_sha256'] for m in mods}]
assert valid,'No exact matching joint replay'
axes=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
axvalid=[(p,v) for p,v in axes if v['sources']=={m:checked[m]['source_sha256'] for m in mods}]
assert axvalid,'No exact matching closure audit'
validation={'request_id':'3a11314d099d45f1bab6c685fa152e7b','status':'local build, joint isolated kernel replay, explicit axiom closure audit passed','modules':checked,'replay':str(valid[-1][0].relative_to(R)),'axioms':str(axvalid[-1][0].relative_to(R)),'theorem_closures':len(axvalid[-1][1]['declarations']),'limits':'Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit. Full root unresolved.'}
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before=json.loads((O/'before.json').read_text())
changed=[p for p,h in before.items() if not (R/p).exists() or sha(R/p)!=h]
assert not changed,changed
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert sha(R/'MathGKM/Markov.lean')==contract['root_sha256']
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc',canonical
check={'before_count':len(before),'changed_prior_inputs':changed,'root_sha256':sha(R/'MathGKM/Markov.lean'),'canonical_contract_hash':canonical,'stop_present':(R/'.control/markov/STOP.json').exists(),'unsuccessful_builds':sum(v.get('returncode')!=0 for p,v in receipts),'completion':None}
(O/'final-check.json').write_text(json.dumps(check,indent=2)+'\n')
report={'request_id':'3a11314d099d45f1bab6c685fa152e7b','summary':'Proved an unbounded source-dependent central horizontal inequality and explicit rational linear certificate. Full pinned Conjecture63 remains unresolved.','actions':['Reconciled interrupted effects and verified latest and inherited bindings: evidence/markov-3a11314d/reconciliation.json.','Compiled and jointly kernel-replayed seven mathematical modules; audited 28 theorem closures: evidence/markov-3a11314d/validation.json.','Verified prior-input preservation and pinned root/contract hashes: evidence/markov-3a11314d/final-check.json.'],'observations':['For every actual source 2/(2q+1), proved A(2,q) A(4,q) <= A(3,q)^2 with raw coefficients and zero cases: research/MarkovSourceCentralM3A1.lean.','Proved the explicit source-dependent center 1+10/(q^2+3q+5) gives a nonnegative linear moment certificate on that triple: research/MarkovCentralLinearM3A1.lean.','Proved Conjecture63 iff InteriorCore63M3A1, removing only this central horizontal family. All other clauses remain unresolved: research/MarkovResidualM3A1.lean.','Proved an unbounded literal source family satisfying all preceding residual guards: research/MarkovCentralWitnessM3A1.lean.','Finite exact tests checked 3780 proposed full-row identities, independently compared 40 source recurrence/matrix evaluations, and tested 1880 triples including 1100 zero triples. Experiments are not proofs: evidence/markov-3a11314d/central-experiments.json and source-experiments.json.','The proposed full-row derivation remains unformalized: research/markov-3a11314d-full-row-derivation.md.','Inherited compiled imports were reused; no whole-source rebuild or independent completion audit occurred: research/markov-3a11314d-correspondence.md.'],'agenda':['Formalize the full central-row binomial convolution and decreasing-ratio argument in research/markov-3a11314d-full-row-derivation.md.','Retain every unresolved clause in research/MarkovResidualM3A1.lean, including all reverse-factor ranges.','Discharge all source-correspondence obligations before exact-root completion.'],'completion':None}
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
new=[p for p in (R/'research').iterdir() if p.is_file() and (str(p.relative_to(R)) not in before or '3a11314d' in p.name or 'M3A1' in p.name)]
new += [p for p in O.iterdir() if p.is_file() and p.name not in ['manifest.json','last-verification.json']]
manifest={str(p.relative_to(R)):sha(p) for p in new}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
last={'artifact_count':len(manifest),'mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],'prior_input_count':len(before),'changed_prior_inputs':[p for p,h in before.items() if sha(R/p)!=h],'manifest_sha256':sha(O/'manifest.json'),'completion':None}
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps({'validation':validation['status'],'modules':len(mods),'theorem_closures':validation['theorem_closures'],'final_check':check,'artifacts':len(manifest)}))
