"""Machine-authored evidence finalization only; no controller mutation."""
from pathlib import Path
import hashlib,json,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9f234835'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
rel=lambda p:str(p.relative_to(R))
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
inputs=json.loads((O/'input-hashes.json').read_text())
changed=[k for k,h in inputs.items() if not (R/k).is_file() or sha(R/k)!=h]
assert not changed,changed
prior=json.loads((R/'evidence/markov-f88f6a75/manifest.json').read_text())
assert all((R/k).is_file() and sha(R/k)==h for k,h in prior.items())
receipts=[]
for p in sorted(O.glob('build-*.json')):
 d=json.loads(p.read_text());receipts.append((p,d))
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
v=dict(modules=sources,compilation=build,replay=rel(replays[-1]),axioms=rel(audits[-1]),theorem_closures=len(ax),scope='Local source builds, isolated joint replay and axiom audit. Inherited compiled imports reused; not a fresh whole-source rebuild or independent completion audit.')
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
failed=[]
for p,d in receipts:
 if d.get('returncode')!=0:
  failed.append(dict(receipt=rel(p),snapshot=rel(p.with_suffix('.lean')),modules=d['modules'],timeout=d.get('timeout',False),returncode=d.get('returncode')))
(O/'failed-build-index.json').write_text(json.dumps(failed,indent=2)+'\n')
unaccepted=[rel(p) for p in (R/'research').glob('*M9F23.lean') if p.stem not in mods and not p.stem.startswith(('ReplayIsolated','MarkovAudit'))]
assert not unaccepted,unaccepted
(O/'unaccepted-drafts.json').write_text(json.dumps({'unaccepted_current_sources':unaccepted,'historical_rejected_snapshots':'failed-build-index.json','predecessor_drafts':'Unchanged; no promotion or replay.'},indent=2)+'\n')
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
bindings=dict(request_id='9f234835b0cf47d395d489f5776d690b',root_sha256=sha(R/'MathGKM/Markov.lean'),contract_canonical_sha256=canonical,contract_file_sha256=sha(R/'.control/markov/contract.json'),toolchain=(R/'lean-toolchain').read_text().strip(),stop_file=(R/'.control/markov/STOP.json').exists(),validation_sha256=sha(O/'validation.json'),correspondence_sha256=sha(R/'research/markov-9f234835-correspondence.md'),independent_completion_audit=False,fresh_whole_source_rebuild=False,completion=None)
(O/'final-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
exp=json.loads((O/'source-experiment.json').read_text());edges=json.loads((O/'upper-edges-experiment.json').read_text())
assert not exp['failures'] and not edges['failures']
coeffs=exp['lower_comparisons']+exp['upper_comparisons']+edges['low_coefficient_checks']
zeros=exp['coefficient_zeros']+edges['zeros'];triples=sum(exp['all_direction_triples'])
report=dict(request_id=bindings['request_id'],completion=None,
 summary='Closed all numerator-three lower diagonal and upper vertical/diagonal inequalities. Full pinned Conjecture63 remains unresolved.',
 actions=[
  'Read the required documents and independent audits; reconciled workers 198–200 and verified 132 predecessor artifacts without replaying completed effects: evidence/markov-9f234835/reconciliation.json.',
  f'Compiled and jointly kernel-replayed {len(mods)} modules; audited {len(ax)} theorem closures using only permitted axioms: evidence/markov-9f234835/validation.json.',
  f'Checked {len(inputs)} unchanged inputs and pinned root/contract bindings; preserved {len(failed)} rejected builds: evidence/markov-9f234835/last-verification.json and failed-build-index.json.'
 ],
 observations=[
  'Proved all numerator-three lower diagonal inequalities with j+2<=q, at every column and both residues: research/MarkovLowerSourceM9F23.lean.',
  'Proved the exact upper convolution identity and every upper vertical and diagonal inequality with b<=j+q, including exceptional columns and zeros: research/MarkovUpperCompleteM9F23.lean. Exact path/polygon transport is in research/MarkovOuterPathM9F23.lean.',
  'Proved Conjecture63 iff ThreeMiddleOnlyM9F23 and OtherFourM9E2. Both remain open: research/MarkovUpperCompleteM9F23.lean.',
  f'Finite experiments passed {coeffs:,} coefficient comparisons retaining {zeros:,} zeros and {triples:,} polygon-valid triples across all directions; these are not proofs: evidence/markov-9f234835/source-experiment.json and upper-edges-experiment.json.',
  'Proved an auxiliary negative paired-summand witness; it does not refute the source conjecture. Inherited compiled imports were reused; no fresh whole-source rebuild or independent completion audit occurred: research/markov-9f234835-correspondence.md and operational.md.'
 ],
 agenda=[
  'Investigate ThreeMiddleOnlyM9F23 or OtherFourM9E2; see research/markov-9f234835-next.md. All numerator-three outer transverse regions and the entire horizontal direction are closed.',
  'Retain the complete middle correction and crossing triples. The new increment-prefix method applies to the ramp kernel only on its proved parameter domain.',
  'Preserve every remaining family, direction, zero and endpoint. Completion requires a universal exact-root proof or refutation and all independent source correspondence checks.'
 ])
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
checkpoint=f'''# Final checkpoint

Request 9f234835b0cf47d395d489f5776d690b. Completion=null.
Full pinned root and exact negation remain open.

{len(mods)} mathematical modules compiled and jointly kernel-replayed;
{len(ax)} theorem closures use only permitted axioms. See validation.json.
The new closed scopes are all lower diagonal and all upper vertical/diagonal
inequalities for numerator three, every column and both residues. Combined
with inherited results, all three directions in both outer regions are closed.
Exact path/polygon transport: MarkovOuterPathM9F23.lean.
Exact root residual: ThreeMiddleOnlyM9F23 and OtherFourM9E2, both open.

{coeffs:,} finite coefficient comparisons ({zeros:,} zeros) and {triples:,}
polygon-valid triples passed. These are experiments, not universal proofs.
{len(failed)} rejected builds are retained, with no final unaccepted mathematical
source. No fresh whole-source rebuild or independent completion audit occurred.
No launched foreground work remains pending at finalization.
'''
(R/'research/markov-9f234835-checkpoint-final.md').write_text(checkpoint)
paths=list(O.rglob('*'))+[p for p in (R/'research').glob('*') if p.is_file() and ('9f234835' in p.name or 'M9F23' in p.name)]
manifest={rel(p):sha(p) for p in paths if p.is_file() and p.name not in ('manifest.json','last-verification.json')}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/k)==h for k,h in manifest.items())
assert all(sha(R/k)==h for k,h in inputs.items())
last=dict(artifacts=len(manifest),unchanged_inputs=len(inputs),predecessor_artifacts=len(prior),modules=len(mods),theorem_closures=len(ax),failed_builds=len(failed),timeouts=sum(x['timeout'] for x in failed),root_sha256=bindings['root_sha256'],contract_canonical_sha256=canonical,stop_file=bindings['stop_file'],completion=None)
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps(last));print(json.dumps({'coefficient_checks':coeffs,'zeros':zeros,'polygon_triples':triples}))
