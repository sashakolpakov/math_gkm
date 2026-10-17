"""Machine-authored research evidence finalization; never edits controller records."""
from pathlib import Path
import hashlib,json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-50c262c5'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
rel=lambda p:str(p.relative_to(R))
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
inputs=json.loads((O/'input-hashes.json').read_text())
changed=[k for k,h in inputs.items() if not (R/k).is_file() or sha(R/k)!=h]
assert not changed,changed
prior=json.loads((R/'evidence/markov-9f234835/manifest.json').read_text())
assert all((R/k).is_file() and sha(R/k)==h for k,h in prior.items())
receipts=[(p,json.loads(p.read_text())) for p in sorted(O.glob('build-*.json'))]
build={}
for m,h in sources.items():
 matches=[p for p,d in receipts if d.get('returncode')==0 and d.get('modules')=={m:h}]
 assert matches,m
 build[m]=rel(matches[-1])
replays=[p for p in sorted(O.glob('replay-*.json')) if json.loads(p.read_text()).get('modules')==sources and json.loads(p.read_text()).get('returncode')==0]
assert replays
audits=[p for p in sorted(O.glob('axioms-*.json')) if json.loads(p.read_text()).get('sources')==sources]
assert audits
ax=json.loads(audits[-1].read_text())['declarations']
assert all(set(v)<= {'propext','Classical.choice','Quot.sound'} for v in ax.values())
for m in mods:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',s),m
v=dict(modules=sources,compilation=build,replay=rel(replays[-1]),axioms=rel(audits[-1]),theorem_closures=len(ax),scope='Local source compilation, isolated joint kernel replay and axiom audit. Inherited compiled imports reused; not a fresh whole-source rebuild or independent completion audit.')
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
failed=[dict(receipt=rel(p),snapshot=rel(p.with_suffix('.lean')),modules=d['modules'],timeout=d.get('timeout',False),returncode=d.get('returncode')) for p,d in receipts if d.get('returncode')!=0]
(O/'failed-build-index.json').write_text(json.dumps(failed,indent=2)+'\n')
unaccepted=[rel(p) for p in (R/'research').glob('*M50C.lean') if p.stem not in mods and not p.stem.startswith(('ReplayIsolated','MarkovAudit'))]
assert not unaccepted,unaccepted
(O/'unaccepted-drafts.json').write_text(json.dumps({'unaccepted_current_sources':unaccepted,'historical_rejected_snapshots':'failed-build-index.json','prior_drafts':'Unchanged; not promoted.'},indent=2)+'\n')
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
bindings=dict(request_id='50c262c5afce4cf0a717cbef7a352e92',root_sha256=sha(R/'MathGKM/Markov.lean'),contract_canonical_sha256=canonical,contract_file_sha256=sha(R/'.control/markov/contract.json'),toolchain=(R/'lean-toolchain').read_text().strip(),stop_file=(R/'.control/markov/STOP.json').exists(),validation_sha256=sha(O/'validation.json'),correspondence_sha256=sha(R/'research/markov-50c262c5-correspondence.md'),independent_completion_audit=False,fresh_whole_source_rebuild=False,completion=None)
(O/'final-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
exp=json.loads((O/'source-experiment.json').read_text());model=json.loads((O/'correction-model.json').read_text())
assert not exp['failures'] and not model['failures']
report=dict(request_id=bindings['request_id'],completion=None,
 summary='Proved an unbounded triangular part of the numerator-three middle transverse inequalities and discovered a conjectural positive formula for the remaining correction. Full pinned Conjecture63 remains unresolved.',
 actions=[
  'Read required documents and independent audits; reconciled raw event logs and verified 122 predecessor artifacts without replaying prior side effects: evidence/markov-50c262c5/reconciliation.json.',
  f'Compiled and jointly kernel-replayed {len(mods)} mathematical modules; audited {len(ax)} theorem closures using only permitted axioms: evidence/markov-50c262c5/validation.json.',
  f'Verified {len(inputs)} unchanged inputs and pinned bindings; preserved {len(failed)} rejected builds and capability failures: evidence/markov-50c262c5/last-verification.json and research/markov-50c262c5-operational.md.'
 ],
 observations=[
  'Proved middle transverse inequalities outside the correction support, including boundary crossings. For b=3q+delta, every vertical column i>=q+delta+4 and diagonal start i>=q+delta+2 is now closed for all rows: research/MarkovMiddleTriangleLCM50C.lean and research/MarkovThreeHighColumnsM50C.lean. Path/polygon transport: research/MarkovMiddleTrianglePathM50C.lean.',
  'Proved a broader exact template/convolution identity from its leading coefficients and extended the complete signed correction through j=q-1: research/MarkovTemplateDiagonalM50C.lean and research/MarkovMiddleCrossingM50C.lean.',
  'Proved Conjecture63 iff ThreeTriangleResidualM50C and OtherFourM9E2. Both remain open: research/MarkovMiddleTriangleResidualM50C.lean.',
  f'A new conjectural two-positive-kernel coefficient formula passed {model["coefficients"]:,} exact source comparisons, including {model["source_zeros"]:,} zeros. Its universal source bridge remains unproved: research/markov-50c262c5-correction-model.md and evidence/markov-50c262c5/correction-model.json. A separate scan passed {sum(exp["all_direction_triples"]):,} polygon-valid triples; experiments are not proofs.',
  'Proved actual-source mixed-gap obstructions -32 and -520 at 3/8, while full raw gaps are +292 and +18001; these refute a sum-gluing shortcut only: research/MarkovMiddleMixedDiagnosticM50C.lean. Inherited compiled imports reused; no fresh whole-source rebuild or independent completion audit occurred.'
 ],
 agenda=[
  'Investigate the new global correction identity and a uniform total-gap proof: research/markov-50c262c5-correction-model.md and markov-50c262c5-next.md.',
  'Retain negative mixed contributions, support zeros and boundary-crossing triples. Separate log-concavity of the candidate summands is insufficient.',
  'ThreeTriangleResidualM50C and OtherFourM9E2 remain open. Completion requires universal exact-root closure, every correspondence bridge, fresh whole-source validation and an independent hash-bound English/source audit.'
 ])
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
checkpoint=f'''# Final checkpoint

Machine-authored request {bindings['request_id']}. Completion=null.
The exact pinned root and its negation remain open.

{len(mods)} mathematical modules compiled and jointly kernel-replayed; {len(ax)}
theorem closures use only permitted axioms. See evidence/markov-50c262c5/validation.json.
New closed scopes: middle transverse triangles and all-row high-column thresholds
for numerator three, with correction/boundary/path/polygon bridges as documented.
Exact root residual: ThreeTriangleResidualM50C and OtherFourM9E2, both open.

The new global two-positive-kernel identity is conjectural, with {model['coefficients']:,}
finite exact coefficient checks including {model['source_zeros']:,} zeros. The actual-source
negative mixed-term diagnostic is proved; it is not a conjecture counterexample.
{len(failed)} rejected builds are preserved, including {sum(x['timeout'] for x in failed)} timeout(s).
No final unaccepted mathematical source. No fresh whole-source rebuild or independent
completion audit. No controller action requested or waiting.
'''
(R/'research/markov-50c262c5-checkpoint-final.md').write_text(checkpoint)
paths=list(O.rglob('*'))+[p for p in (R/'research').glob('*') if p.is_file() and ('50c262c5' in p.name or 'M50C' in p.name)]
manifest={rel(p):sha(p) for p in paths if p.is_file() and p.name not in ('manifest.json','last-verification.json')}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/k)==h for k,h in manifest.items())
assert all(sha(R/k)==h for k,h in inputs.items())
last=dict(artifacts=len(manifest),unchanged_inputs=len(inputs),predecessor_artifacts=len(prior),modules=len(mods),theorem_closures=len(ax),failed_builds=len(failed),timeouts=sum(x['timeout'] for x in failed),root_sha256=bindings['root_sha256'],contract_canonical_sha256=canonical,stop_file=bindings['stop_file'],completion=None)
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps(last))
