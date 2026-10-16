"""Machine-authored immutable evidence manifest and inherited-input verification."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-ffd747f5'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
owned=lambda p:'ffd747f5' in p or 'MFFD' in p
v=json.loads((O/'validation.json').read_text())
assert v['completion'] is None and v['permitted_axioms_only']
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in v['sources'].items())
bad_tokens={}
for m in v['modules']:
 s=(R/'research'/f'{m}.lean').read_text()
 hits=re.findall(r'\b(?:sorry|admit|native_decide|axiom)\b',s)
 if hits:bad_tokens[m]=hits
assert not bad_tokens,bad_tokens
before=json.loads((O/'before.json').read_text())
old={p:h for p,h in before.items() if not owned(p)}
changed=[p for p,h in old.items() if not (R/p).is_file() or sha(R/p)!=h]
assert not changed,changed
latest=json.loads((R/'evidence/markov-1bb0aa1e/manifest.json').read_text())
assert all(sha(R/p)==h for p,h in latest.items())
root=sha(R/'MathGKM/Markov.lean')
c=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert c=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert not (R/'.control/markov/STOP.json').exists()
attempts=[json.loads(p.read_text()) for p in O.glob('build-*.json')]
d={'unchanged_inherited_inputs':len(old),'changed':changed,'rechecked_latest_artifacts':len(latest),
 'root_sha256':root,'canonical_contract_sha256':c,'validated_modules':len(v['modules']),
 'theorem_closures':v['closures'],'rejected_builds':sum(a.get('returncode')!=0 for a in attempts),
 'forbidden_proof_tokens':bad_tokens,'unused_candidate':'evidence/markov-ffd747f5/unused-small-rows-candidate.lean',
 'completion':None}
(O/'final-check.json').write_text(json.dumps(d,indent=2)+'\n')
report={'request_id':'ffd747f5c7a147069d5bfcaffb3e60e8',
 'summary':'Proved a universal numerator-three lower-row factorization and complete raw horizontal log-concavity on row j=5. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Reconciled interrupted-worker effects and verified 96 inherited artifacts: evidence/markov-ffd747f5/reconciliation.json and interrupted-reconciliation.json.',
  'Compiled and jointly kernel-replayed eleven mathematical modules; audited 43 theorem closures: evidence/markov-ffd747f5/validation.json.',
  'Verified unchanged inherited inputs, new artifact hashes and pinned root/contract hashes: evidence/markov-ffd747f5/final-check.json and last-verification.json.'],
 'observations':[
  'Proved the exact lower-row factorization for every numerator-three source and every j<=q, with all raw columns and zero tails retained: research/MarkovRowRecurrenceMFFD.lean and MarkovRowDegreeMFFD.lean.',
  'Proved horizontal raw log-concavity on row j=5 for every numerator-three source, including all small parameters and zero tails: source_three_horizontal_fifthMFFD in research/MarkovFifthSourceMFFD.lean.',
  'Proved Conjecture63 iff ThreeRemainingMFFD and OtherFourM9E2. Both residual predicates remain unproved: research/MarkovResidualMFFD.lean.',
  'Proved conditional transport from the uniform residual CrossLC condition; that condition remains unproved. A proposed fixed rational resolvent also lacks its formal coefficient bridge: research/MarkovRowTransferMFFD.lean and markov-ffd747f5-resolvent.md.',
  'Finite experiments passed 21,930 source-coefficient comparisons, 1,560 source j=5 triples, 19,600 residual adjacent tests and 31,785 proposed-resolvent comparisons. These are experiments, not proofs: evidence/markov-ffd747f5/source-row-experiments.json, row-shape-experiments.json and resolvent-experiments.json.',
  'All audited theorem closures use permitted axioms. Ten unsuccessful builds and capability restrictions are preserved; inherited compiled imports were reused. No fresh whole-source rebuild or independent completion audit occurred: research/markov-ffd747f5-operational.md and markov-ffd747f5-correspondence.md.'],
 'agenda':[
  'Investigate the uniform LowerRowShapeMFFD condition and proposed resolvent in research/markov-ffd747f5-next.md; the lower-row/source bridge is now proved.',
  'Retain ThreeRemainingMFFD and OtherFourM9E2 completely, including all directions, correction bands, reverse-factor ranges, zeros and endpoints.',
  'Discharge every source-correspondence obligation and obtain the independent hash-bound audit before claiming exact-root completion.'],
 'completion':None}
assert d['rejected_builds']==10,d
(R/'research/markov-ffd747f5-report.json').write_text(json.dumps(report,indent=2)+'\n')
paths=[p for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']]
paths += [p for p in (R/'research').iterdir() if p.is_file() and owned(p.name)]
manifest={str(p.relative_to(R)):sha(p) for p in sorted(paths)}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
last={'manifest_sha256':sha(O/'manifest.json'),'verified_artifacts':len(manifest),
 'artifact_bytes':sum((R/p).stat().st_size for p in manifest),'mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
 'unchanged_inherited_inputs':len(old),'root_sha256':root,'canonical_contract_sha256':c,'completion':None}
assert not last['mismatches']
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps({'final_check':d,'manifest':last}))
