"""Machine-authored immutable artifact manifest and inherited-input verification."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-4687d03f'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
owned=lambda p:'4687d03f' in p or 'M468' in p
v=json.loads((O/'validation.json').read_text())
assert v['completion'] is None and v['permitted_axioms_only']
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in v['sources'].items())
bad={}
for m in v['modules']:
 hits=re.findall(r'\b(?:sorry|admit|native_decide|axiom)\b',(R/'research'/f'{m}.lean').read_text())
 if hits:bad[m]=hits
assert not bad,bad
before=json.loads((O/'before.json').read_text());old={p:h for p,h in before.items() if not owned(p)}
changed=[p for p,h in old.items() if not (R/p).is_file() or sha(R/p)!=h];assert not changed,changed
latest=json.loads((R/'evidence/markov-ffd747f5/manifest.json').read_text())
assert all(sha(R/p)==h for p,h in latest.items())
root=sha(R/'MathGKM/Markov.lean')
c=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert c=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
stop=(R/'.control/markov/STOP.json').exists()
attempts=[json.loads(p.read_text()) for p in O.glob('build-*.json')]
d={'unchanged_inherited_inputs':len(old),'changed':changed,'rechecked_latest_artifacts':len(latest),
 'root_sha256':root,'canonical_contract_sha256':c,'validated_modules':len(v['modules']),
 'theorem_closures':v['closures'],'rejected_builds':sum(a.get('returncode')!=0 for a in attempts),
 'forbidden_proof_tokens':bad,'stop_file_present':stop,'completion':None}
(O/'final-check.json').write_text(json.dumps(d,indent=2)+'\n')
report={'request_id':'4687d03ffe8948abad1b235a519bed69',
 'summary':'Proved the lower-row rational resolvent and new numerator-three raw inequalities in all three directions on specified lower-region triples. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Reconciled inherited/interrupted effects and verified 100 latest artifacts: evidence/markov-4687d03f/reconciliation.json.',
  f"Compiled and jointly kernel-replayed {len(v['modules'])} mathematical modules; audited {v['closures']} theorem closures: evidence/markov-4687d03f/validation.json.",
  f"Verified {len(old)} unchanged inherited inputs, new artifact hashes and pinned root/contract hashes: evidence/markov-4687d03f/final-check.json and last-verification.json."],
 'observations':[
  'Proved the exact formal rational resolvent and its numerator-three lower-row source bridge; uniform residual CrossLC remains unproved: research/MarkovRowResolventM468.lean and MarkovResolventSourceM468.lean.',
  'Proved the raw column-5 formula for every numerator-three source at j<=q, and horizontal LC across columns 3,4,5 throughout that range: research/MarkovFiveSourceM468.lean.',
  'Proved strict vertical LC in column 5 and strict diagonal LC through (3,j+2),(4,j+1),(5,j), for every j+2<=q in both source families: research/MarkovFiveDirectionsM468.lean.',
  'Proved Conjecture63 iff ThreeRemainingM468 and OtherFourM9E2, with explicit polygon membership for the new triples. Both residual predicates remain unproved: research/MarkovResidualM468.lean.',
  'Proved a denominator-difference identity and conditional route to uniform row shape. Its minimal-denominator and mixed-cross premises remain open: research/MarkovRowDifferenceM468.lean.',
  'Finite direct source checks passed 2,970 coefficient comparisons and 2,730 triples. Larger residual and difference scans passed; binomial-normalized residual LC failed. Experiments are not proofs: evidence/markov-4687d03f/source-experiments.json, shape-experiments.json, shape-routes.json and difference-shape.json.',
  f"All audited closures use permitted axioms; {d['rejected_builds']} rejected builds and capability failures are preserved. Inherited compiled imports were reused; no whole-source rebuild or independent completion audit occurred: research/markov-4687d03f-operational.md and markov-4687d03f-correspondence.md."],
 'agenda':[
  'Investigate the uniform resolvent shape or conditional denominator-difference route in research/markov-4687d03f-next.md; the fixed rational-resolvent/source bridge is now proved.',
  'Retain ThreeRemainingM468 and OtherFourM9E2 completely, including correction bands, all directions, reverse-factor ranges, zeros and endpoints.',
  'Discharge every correspondence obligation and obtain the independent hash-bound audit before claiming exact-root completion.'],
 'completion':None}
(R/'research/markov-4687d03f-report.json').write_text(json.dumps(report,indent=2)+'\n')
paths=[p for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']]
paths += [p for p in (R/'research').iterdir() if p.is_file() and owned(p.name)]
manifest={str(p.relative_to(R)):sha(p) for p in sorted(paths)}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
last={'manifest_sha256':sha(O/'manifest.json'),'verified_artifacts':len(manifest),
 'artifact_bytes':sum((R/p).stat().st_size for p in manifest),
 'mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
 'unchanged_inherited_inputs':len(old),'root_sha256':root,'canonical_contract_sha256':c,'completion':None}
assert not last['mismatches']
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps({'final_check':d,'manifest':last}))
