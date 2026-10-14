"""Machine-authored evidence manifest. Does not edit controller state."""
import pathlib,json,hashlib,datetime
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-a3c53fa7'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
names=['MarkovDeformedJetA3c5','MarkovDeformedSourceA3c5','MarkovDeformationThresholdA3c5','MarkovTypeMatrixA3c5']
runs=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
modules=[]
for m in names:
 s=r/'research'/f'{m}.lean';h=sha(s)
 good=[(p,d) for p,d in runs if d['source']==str(s.relative_to(r)) and d['sha256']==h and d.get('returncode')==0]
 builds=[(p,d) for p,d in good if d['command'][0].endswith('/lean')]
 replays=[(p,d) for p,d in good if d['command'][0].endswith('/leanchecker')]
 assert builds and replays,m
 p,d=builds[-1];q,e=replays[-1]
 assert 'sorryAx' not in d['stdout']
 modules.append(dict(module=m,source=str(s.relative_to(r)),sha256=h,build=str(p.relative_to(r)),replay=str(q.relative_to(r)),axiom_lines=[x for x in d['stdout'].splitlines() if 'axioms' in x],olean_sha256=sha(o/f'{m}.olean')))
contract=json.loads((r/'.control/markov/contract.json').read_text())
v=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled imports; not fresh whole-source rebuild',independent_audit=False)
assert v['root_sha256']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert v['contract_canonical_sha256']=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(o/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
ops=dict(rejected_runs=[str(p.relative_to(r)) for p,d in runs if d.get('returncode')!=0],capabilities={'python':'/opt/homebrew/bin/python3','sage':'not available on PATH','gap':'available, not invoked','scratch':'Higher-priority read denial; retained unique research/evidence artifacts used','missing_sources':'Initial MathGKM/MarkovObjects88f3.lean and MathGKM/MarkovObjectGoal88f3.lean reads failed; actual inherited modules located in research/'},validation_limit=v['imports'],unmatched_foreground_sessions=False)
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
literature=dict(primary_source='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',queries=['"Markov polynomials" "log-concavity" proof','"Markov polynomials" coefficients concavity 2026','log concavity coloured matchings path fixed color counts Christoffel'],result='Publisher retrieved live. No external theorem imported or used as an axiom. Search not exhaustive.')
(o/'literature.json').write_text(json.dumps(literature,indent=2)+'\n')
report=dict(request_id='a3c53fa7bcea4aaf80795a13558baa99',completion=None,summary='Checked an exact Pell type-deformation formula and sharp gap-polynomial threshold; full published Markov Conjecture 6.3 remains open.',actions=['Read mission/design, pinned contract, inherited evidence, independent audits, latest report and raw predecessor events. Reconciliation: evidence/markov-a3c53fa7/reconciliation.json.','Executed exact type-refined coefficient comparison: evidence/markov-a3c53fa7/type-refinement.json.','Proved universal moving coefficient identities, the source specialization, a positive matrix representation, and the gap-polynomial threshold.','Compiled and kernel-replayed four modules: evidence/markov-a3c53fa7/validation.json.','Saved derivations and scope: research/markov-a3c53fa7-mathematics.md and research/markov-a3c53fa7-correspondence.md.'],observations=['Pinned root and canonical contract hashes match; no proof or refutation of the full root was obtained.','For the displayed Pell triple, the real gap polynomial is nonnegative for every a>=3 exactly when t>=0 and t^2<=2. Its formal coefficient/matrix bridge uses integer t.','Weight 2 reverses this vertical inequality for every a>=40; the actual source weight 1 satisfies it strictly. Polygon membership is checked. This is not a root counterexample.','The finite type-refined scan tested 377267 triples: 92 vertical and 16 diagonal coefficientwise failures, no horizontal failures. No universal conclusion follows.','Successful printed axiom closures use only permitted axioms. Validation reused inherited compiled imports and is not an independent audit.','Rejected elaborations and capability limits are preserved in evidence/markov-a3c53fa7/operational-observations.json. All foreground sessions completed.'],agenda=['Investigate the unproved horizontal type-refined inequality on canonical source words, possibly using the no-consecutive-C restriction.','Vertical and diagonal aggregate comparisons must permit compensation between C-type-count classes as well as decorated-edge overlay classes.','Retain full rational coverage, raw coefficients, all three directions, zeros and endpoints; require fresh rebuilding and independent hash-bound correspondence auditing before closure.'])
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
p=r/'research/markov-a3c53fa7-checkpoint.md';p.write_text(p.read_text()+'\nFinal checkpoint: four final modules compiled and kernel-replayed. See validation.json and report.json. Only permitted printed axioms; inherited imports reused. Full root unresolved, completion null. All foreground sessions completed.\n')
paths=[r/'research'/f'{m}.lean' for m in names]+list(o.glob('*.json'))+[r/'research/markov-a3c53fa7-mathematics.md',r/'research/markov-a3c53fa7-correspondence.md']
(o/'artifact-hashes.json').write_text(json.dumps({str(p.relative_to(r)):sha(p) for p in paths},indent=2)+'\n')
print(json.dumps(dict(modules=len(modules),rejected=len(ops['rejected_runs']),report=str((o/'report.json').relative_to(r)),completion=None)))
