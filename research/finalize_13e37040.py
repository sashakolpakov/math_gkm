"""Machine-authored evidence finalization; does not edit controller state."""
from pathlib import Path
import json,hashlib,re,datetime
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-13e37040'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
dump=lambda name,obj:(O/name).write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
mods=json.loads((O/'mathematical-modules.json').read_text())
hashes={m:sha(R/'research'/f'{m}.lean') for m in mods}
receipts=[]
for p in O.glob('build-*.json'):
 d=json.loads(p.read_text());receipts.append((p,d))
builds={}
for m,h in hashes.items():
 good=[(p,d) for p,d in receipts if d.get('returncode')==0 and d['modules'].get(m)==h]
 assert good,m
 p,d=sorted(good)[-1];builds[m]=str(p.relative_to(R))
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide)\b|^\s*axiom\s',s,re.M),m
replays=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and d['modules']==hashes and 'replay union passed' in d['stdout']:replays.append(p)
assert replays
axp=sorted(O.glob('axioms-*.json'))[-1];ax=json.loads(axp.read_text())
assert ax['sources']==hashes
assert all(set(a)<= {'propext','Classical.choice','Quot.sound'} for a in ax['declarations'].values())
dump('validation.json',{'modules':hashes,'build_receipts':builds,'kernel_replay':str(replays[-1].relative_to(R)),
 'axiom_audit':str(axp.relative_to(R)),'theorem_closures':len(ax['declarations']),
 'permitted_axioms_only':True,'fresh_whole_source_rebuild':False,'independent_completion_audit':False,
 'auxiliary_unchanged_rebuilds_outside_selected_bundle':['MarkovGeometricM679','MarkovQuadraticKernelM9E2'],
 'completion':None})
failed=[{'receipt':str(p.relative_to(R)),'source_snapshot':str(p.with_suffix('.lean').relative_to(R)),
 'modules':d['modules'],'timeout':d.get('timeout',False),'returncode':d.get('returncode')} for p,d in receipts if d.get('returncode')!=0]
dump('failed-build-index.json',failed)
inputs=json.loads((O/'input-hashes.json').read_text())
changed=[k for k,h in inputs.items() if not (R/k).is_file() or sha(R/k)!=h]
assert not changed,changed
prior=json.loads((R/'evidence/markov-50c262c5/manifest.json').read_text())
assert all((R/k).is_file() and sha(R/k)==h for k,h in prior.items())
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert not (R/'.control/markov/STOP.json').exists()
dump('final-bindings.json',{'request_id':'13e3704044384ce789e16ba0f49af882','root_sha256':root,
 'contract_raw_sha256':sha(R/'.control/markov/contract.json'),'contract_canonical_ascii_sha256':canonical,
 'pins':{p:sha(R/p) for p in ['lean-toolchain','lakefile.toml','lake-manifest.json']},
 'unchanged_inputs':len(inputs),'predecessor_artifacts':len(prior),'stop_file_exists':False})
dump('source-retrieval.json',{'source':contract['source'],'method':'hosted web open/find',
 'date':'2026-10-17','sections':['seed and numerator recurrence material','Definitions 6.1 and 6.2','Conjecture 6.3'],
 'status':'Retrieved primary text; no external assertion added as a Lean axiom.'})
report={
 'request_id':'13e3704044384ce789e16ba0f49af882',
 'summary':'Proved a universal rational generating-function decomposition and trisection bridge for numerator-three sources. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Read required documents and audits; reconciled interrupted effects and verified 112 predecessor artifacts: evidence/markov-13e37040/reconciliation.json.',
  'Compiled and jointly kernel-replayed ten selected modules; audited 55 theorem closures using only permitted axioms: evidence/markov-13e37040/validation.json.',
  'Recorded exact symbolic and source-recurrence experiments, preserved rejected builds, and verified unchanged inputs and pinned bindings: evidence/markov-13e37040/last-verification.json.'
 ],
 'observations':[
  'Proved the actual source series equals three explicit rational series for every parameter and both residues; the third summand vanishes in columns i>=3: research/MarkovGFSourceM13E.lean and research/MarkovGFLowSupportM13E.lean.',
  'Proved the D summand is the exact trisection of a simpler master generating function: research/MarkovGFSectionM13E.lean. The two global binomial coefficient extractions remain open in Lean; a detailed paper derivation is in research/markov-13e37040-global-formula.md.',
  'Proved vertical log-concavity of the complete guarded affine correction, including zero boundaries, and its exact source attachment on j=q+1 for all q>=2 and i>=3: research/MarkovCorrectionModelM13E.lean.',
  'Proved Conjecture63 iff ThreeRationalTriangleM13E and OtherFourM9E2. Both remain open; no new raw-LC region is claimed: research/MarkovRationalResidualM13E.lean.',
  'Finite checks passed 105712 source comparisons, retaining 11400 zeros, both separate kernel extractions at those indices, and 275100 polygon-valid triples. These are experiments: evidence/markov-13e37040/gf-source-experiment.json.',
  'Inherited compiled imports were reused. Capability limits and rejected builds are preserved; no fresh whole-source rebuild or independent completion audit occurred: research/markov-13e37040-operational.md and research/markov-13e37040-correspondence.md.'
 ],
 'agenda':[
  'Investigate MasterKernelExtractionM13E and CorrectionKernelExtractionM13E using the proved rational source bridge and the coefficient derivation in research/markov-13e37040-global-formula.md.',
  'Control the full total gap, retaining negative mixed contributions and crossing triples; correction LC alone is insufficient. OtherFourM9E2 remains an alternative exact-root direction.',
  'Preserve all families, directions, zeros and endpoints; completion still requires exact-root closure and independent hash-bound correspondence validation.'
 ],'completion':None}
dump('report.json',report)
checkpoint=f'''# Final checkpoint

Machine-authored request 13e3704044384ce789e16ba0f49af882. Completion=null.
Ten selected modules jointly kernel-replayed; 55 theorem closures use permitted
axioms only. Exact rational source decomposition and trisection are proved.
Global finite-binomial extraction and the full raw total-gap inequalities remain
open in Lean. No root closure, full-source rebuild or independent completion audit.

Source tests: 105712 comparisons, 11400 zeros, 275100 valid triples; no failures.
These are experiments. Rejected builds preserved: {len(failed)}. Unchanged baseline
inputs: {len(inputs)}; predecessor manifest artifacts verified: {len(prior)}.
See evidence/markov-13e37040/report.json and validation.json, and the detailed
paper derivation in markov-13e37040-global-formula.md. No launched work is pending.
'''
(R/'research/markov-13e37040-checkpoint-final.md').write_text(checkpoint)
artifacts={}
for p in O.rglob('*'):
 if p.is_file() and p.name not in ('manifest.json','last-verification.json'):artifacts[str(p.relative_to(R))]=sha(p)
for p in (R/'research').iterdir():
 if p.is_file() and ('13e37040' in p.name or 'M13E' in p.name):artifacts[str(p.relative_to(R))]=sha(p)
dump('manifest.json',artifacts)
assert all(sha(R/k)==h for k,h in artifacts.items())
dump('last-verification.json',{'time_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'artifacts':len(artifacts),'unchanged_inputs':len(inputs),'predecessor_artifacts':len(prior),
 'rejected_builds':len(failed),'root_sha256':root,'contract_hash':canonical,
 'validation_sha256':sha(O/'validation.json'),'manifest_sha256':sha(O/'manifest.json'),
 'stop_file_exists':False,'completion':None})
print(json.dumps(json.loads((O/'last-verification.json').read_text()),indent=2))
