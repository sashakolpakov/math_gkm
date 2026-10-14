"""Machine-authored research evidence finalization; no controller mutations."""
import hashlib,json,pathlib
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-654a72ea'
modules=['MarkovPellLowerSum26ca','MarkovPellLowerFormula26ca',
 'MarkovPellLowerLC654a','MarkovPellLowerSmall654a','MarkovPellCorner654a',
 'MarkovPellLowerBand654a','MarkovPellGenerating654a']
records=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
validation={}
for m in modules:
 source=r/'research'/f'{m}.lean';h=hashlib.sha256(source.read_bytes()).hexdigest()
 good=[(p,v) for p,v in records if v['sha256']==h and v.get('returncode')==0]
 build=[(p,v) for p,v in good if v['command'][0].endswith('/lean')]
 replay=[(p,v) for p,v in good if v['command'][0].endswith('/leanchecker')]
 assert build and replay,m
 assert 'sorryAx' not in build[-1][1]['stdout'],m
 validation[m]=dict(source=str(source.relative_to(r)),sha256=h,
   build=str(build[-1][0].relative_to(r)),kernel_replay=str(replay[-1][0].relative_to(r)))
root=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
out=dict(status='Local compiled and kernel-replayed partial theorems',modules=validation,
 root_sha256=root,imports='Inherited compiled imports, not a fresh whole-source closure rebuild',
 rejected=[str(p.relative_to(r)) for p,v in records if v.get('returncode')!=0],
 completion=None)
(o/'validation.json').write_text(json.dumps(out,indent=2)+'\n')
ops=dict(scratch='Higher-priority policy denies .scratch; no access attempted',
 shell_failures=['Here-document implicit temporary-file creation denied',
 'Missing exploratory filename MarkovFibSeries3556.lean',
 'Unmatched exploratory zsh filename globs',
 'One Python shell command had an unescaped Lean apostrophe and was rejected before execution; no file mutation occurred'],
 mathematical_failures='Rejected elaborations preserved by validate_654a.py; never accepted as proofs',
 workers_reconciled='28 had unfinished LC elaboration; 29–31 recorded no changed files and capacity failures',
 processes='All foreground sessions completed; no background process, controller, model call, or agent spawned',
 protected='Root unchanged; no controller/control/protected source or independent evidence edits',
 network='Only hosted web search; no shell network or package update')
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
literature=dict(status='Hosted search observations only; no imported theorem',
 queries=['Markov polynomials log concavity Conjecture 6.3 Evans Veselov Winn proof coefficients',
 'log-concavity powers Riordan array coefficients','strong q-log-concavity binomial'],
 primary_sources=['https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',
 'https://arxiv.org/abs/1605.00257'],
 conclusion='No theorem from these searches was used to close a source coefficient inequality. No new novelty claim.')
(o/'literature.json').write_text(json.dumps(literature,indent=2)+'\n')
report=dict(request_id='654a72ea1e2f44769f8a3d78a690543a',
 summary='Proved both raw inequalities across the complete first positive-excess Pell band, including boundary cases. Full pinned Conjecture63 remains unresolved.',
 actions=[
 'Reconciled four interrupted workers and preserved failed elaborations: evidence/markov-654a72ea/reconciliation.json.',
 'Recovered and corrected lower-strip inequalities, then proved the complete unbounded band: research/MarkovPellLowerBand654a.lean, source_near_one_lower_band654a.',
 'Proved the exact whole-Pell-family generating equation: research/MarkovPellGenerating654a.lean.',
 'Compiled and kernel-replayed seven modules with hash-bound receipts: evidence/markov-654a72ea/validation.json.',
 'Recorded derivations and correspondence limits: research/markov-654a72ea-mathematics.md and research/markov-654a72ea-correspondence.md.'],
 observations=[
 'The band theorem covers every actual source with b=a+1 and every natural i,j with i+j=a+1, horizontally and vertically, retaining zeros.',
 'The candidate positive lower-excess generating formula passed 98,760 exact checks through a=40; its formal regrading bridge is unproved: evidence/markov-654a72ea/lower-series-check.json.',
 'Accepted printed axiom closures use only permitted axioms. Validation reused inherited compiled imports; it is not an independent full-source audit.',
 'The pinned root is unchanged. Capability and execution failures are recorded in evidence/markov-654a72ea/operational-observations.json. All foreground sessions completed.'],
 agenda=[
 'Investigate cross-strip inequalities for L_s=(x+y)^(2s)/((1-x)^(s+1)(1-y)^s), first proving the exact formal source regrading.',
 'Seek a summation argument for arbitrary Pell strips and then a representation extending to all mechanical source words; HorizontalFiberGoal9a72 remains unproved.',
 'Require fresh full-source verification and independent hash-bound correspondence auditing before root closure.'],
 completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(modules=len(validation),rejected=len(out['rejected']),root_unchanged=True,report=str(o/'report.json'))))
