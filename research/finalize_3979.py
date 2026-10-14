"""Machine-authored evidence finalization; does not modify controller records."""
import hashlib,json,pathlib
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-3979f3c7'
records=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
modules={}
for m in ['MarkovPellMixture3979','MarkovPellKernelObstruction3979']:
    src=r/'research'/f'{m}.lean';h=hashlib.sha256(src.read_bytes()).hexdigest()
    hits=[(p,v) for p,v in records if v['sha256']==h and v.get('returncode')==0]
    build=[p for p,v in hits if pathlib.Path(v['command'][0]).name=='lean']
    replay=[p for p,v in hits if pathlib.Path(v['command'][0]).name=='leanchecker']
    assert build and replay, ('Missing final validation',m)
    assert all('sorryAx' not in v.get('stdout','') for _,v in hits)
    modules[m]=dict(source=str(src.relative_to(r)),sha256=h,build=str(build[-1].relative_to(r)),kernel_replay=str(replay[-1].relative_to(r)))
root=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
v=dict(modules=modules,rejected=[str(p.relative_to(r)) for p,x in records if x.get('returncode')!=0],root_sha256=root,imports='Inherited compiled imports; not a fresh whole-source rebuild',status='New modules compiled and kernel-replayed locally; no root closure',completion=None)
(o/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
op=dict(capabilities={'python':'/opt/homebrew/bin/python3','sympy':False,'numpy':False,'scipy':False,'sage':False,'gap':'/opt/homebrew/bin/gap'},failures=[
 'zsh heredoc temporary-file creation denied; used direct Python arguments and durable research files.',
 'Active higher-priority policy denies .scratch reads; did not use the requested temporary directory.',
 'Several guessed inherited filenames were absent; located actual files using rg.',
 'One inline Python exploratory comprehension had a syntax error; it produced no mathematical result.',
 'First Lean elaboration failed at natural-subtraction arithmetic and an opaque rational-cast definition. Snapshot and diagnostics retained as rejected evidence.'
],executions='Foreground only; no external execution requests, package changes, controller edits, Git access or commits.',axioms='Successful printed closures only propext, Classical.choice, Quot.sound')
(o/'operational-observations.json').write_text(json.dumps(op,indent=2)+'\n')
report=dict(request_id='3979f3c739b946f2a07319e5c9795bce',summary='Checked the zero-excess Pell vertical inequality and exact summation obstructions. Full pinned Conjecture63 remains unresolved.',actions=[
 'Reconciled the interrupted predecessor against raw events and saved source hashes: evidence/markov-3979f3c7/reconciliation.json.',
 'Proved raw Pell bottom-triple formulas, their inequalities and the exact cumulative threshold: research/MarkovPellMixture3979.lean.',
 'Proved the geometric prefix coefficient bridge and a precisely scoped zero-excess preservation failure: research/MarkovPellKernelObstruction3979.lean.',
 'Compiled and kernel-replayed both final modules: evidence/markov-3979f3c7/validation.json.',
 'Executed exact deformation, symbolic-interior and enlarged-word probes; details in research/markov-3979f3c7-mathematics.md.'
],observations=[
 'Every chosen source triple is valid and raw-log-concave, but their unweighted sum reverses the inequality exactly when N>=17. This is not a source-family counterexample.',
 'The geometric prefix transform has [11,155,2202], with 155^2<11*2202, despite the input satisfying all zero-excess vertical comparisons.',
 'Finite probes: 129600 generalized-kernel comparisons; nonnegative shifted gap coefficients in six positive-excess bands; 951 enlarged words with no horizontal failure. Experiments are not proofs.',
 'Root unchanged. Successful closures use permitted axioms; imports were inherited, not freshly rebuilt. Correspondence limits: research/markov-3979f3c7-correspondence.md.',
 'Capability failures and rejected elaborations: evidence/markov-3979f3c7/operational-observations.json.'
],agenda=[
 'Investigate fixed-charge comparisons in the alternating-path monomer-dimer interpretation of HorizontalFiberGoal9a72; arbitrary sums and geometric-prefix closure are insufficient.',
 'Seek a uniform symbolic gap certificate in the excess parameter, with boundary cases explicit, or an invariant for all mechanical source words.',
 'Require fresh whole-source rebuilding and independent hash-bound English/source auditing before any exact root closure.'
],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
with (r/'research/markov-3979f3c7-checkpoint.md').open('a') as f:
    f.write('\nFinal: both final modules compiled and kernel-replayed. The zero-excess Pell vertical case is proved, along with exact source-mixture and geometric-prefix obstructions. All universal interior inequalities and full-source root resolution remain open. Final records: evidence/markov-3979f3c7/validation.json and report.json.\n')
print(json.dumps(dict(validated_modules=len(modules),rejected_attempts=len(v['rejected']),root_unchanged=True,report=str((o/'report.json').relative_to(r)))))
