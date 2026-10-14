"""Machine-authored report assembly. Does not modify controller records."""
import json,pathlib,hashlib,time
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-65c4dfb8'
modules=['MarkovAbel65c4','MarkovTruncatedFiber65c4','MarkovFiberPolynomial65c4']
logs=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
validation=[]
for m in modules:
 p=r/'research'/f'{m}.lean';sha=hashlib.sha256(p.read_bytes()).hexdigest()
 runs=[(f,d) for f,d in logs if d['source']==str(p.relative_to(r)) and d['sha256']==sha]
 builds=[(f,d) for f,d in runs if d['command'][0].endswith('/lean') and d.get('returncode')==0]
 replays=[(f,d) for f,d in runs if d['command'][0].endswith('/leanchecker') and d.get('returncode')==0]
 validation.append(dict(module=m,sha256=sha,build=str(builds[-1][0].relative_to(r)) if builds else None,replay=str(replays[-1][0].relative_to(r)) if replays else None,axiom_output=builds[-1][1]['stdout'] if builds else None))
(o/'validation.json').write_text(json.dumps(dict(modules=validation,imports='Inherited compiled imports; not fresh whole-source rebuild',independent_audit=False),indent=2)+'\n')
failed=[dict(record=str(p.relative_to(r)),returncode=d.get('returncode'),timeout=d.get('timeout',False)) for p,d in logs if d.get('returncode')!=0]
ops=dict(failed_elaborations=failed,capability_failures=['Sage executable absent','sympy unavailable in mandated Python','zsh heredoc temporary-file creation denied','Policy denies .scratch, so research/evidence used','Guessed inherited filenames absent; actual names located by rg'],stop_file='Absent when checked',network='Hosted web only; no shell networking',processes='All foreground validation and experiment sessions completed')
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
(o/'literature.json').write_text(json.dumps(dict(retrieved='2026-10-14',sources=[dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',use='Pinned target reread'),dict(url='https://arxiv.org/html/math/0504164v7',use='Finite Abel transfer and LC-positivity interpretation; not a proof of the Markov array hypothesis'),dict(url='https://arxiv.org/html/2610.09312v1',use='Fan-coordinate laminar products; no Markov exponent-fiber identification obtained')],external_axioms_added=False),indent=2)+'\n')
done=[v['module'] for v in validation if v['build'] and v['replay']]
report=dict(request_id='65c4dfb883e140b0a62fddbffe247137',summary='Investigated centered horizontal-fiber positivity and checked partial transfer/certificate results; the full published Markov goal remains open.',actions=['Reconciled predecessor raw events and source hashes: evidence/markov-65c4dfb8/reconciliation.json.','Executed exact centered-tail, randomized, and symbolic-polynomial probes: evidence/markov-65c4dfb8/pair-probe.json, pair-random.json, pair-polynomial.json.','Compiled and kernel-replayed '+', '.join(done)+': evidence/markov-65c4dfb8/validation.json.','Recorded mathematics, correspondence limits, source usage and operational failures under research/markov-65c4dfb8-*.md and evidence/markov-65c4dfb8/.'],observations=['Pinned Conjecture63 remains unresolved and unchanged; completion is null.','No centered-tail failure in 286187 exhaustive nonzero fibers or 703 randomized nonzero fibers. These are finite experiments.','19080 exact shifted-polynomial tail expansions had nonnegative coefficients; arbitrary excess, combined fiber index and the excluded small-a region remain unresolved.','The general truncated-fiber condition is unproved. Its conditional source transfer covers only horizontal Pell triples.','A uniform polynomial certificate for one refined fiber is recorded in research/MarkovFiberPolynomial65c4.lean; actual validation status is in validation.json.','Validation uses inherited compiled imports, not a fresh whole-source rebuild or independent hash-bound correspondence audit.'],agenda=['Investigate a uniform centered-tail positivity certificate for H(a,j,s,q), including the region a<s+k+1.','Use the exact positive shift-polynomial pattern to seek an all-parameter identity; finite expansions do not suffice.','Keep all-rational coverage, other directions and independent source correspondence as mandatory root obligations.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
files=list(o.glob('*'))+list((r/'research').glob('*65c4*'))
hashes={str(p.relative_to(r)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files if p.is_file() and p.name!='artifact-hashes.json'}
hashes['MathGKM/Markov.lean']=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()
(o/'artifact-hashes.json').write_text(json.dumps(hashes,indent=2)+'\n')
print(json.dumps(dict(validated=done,failed=len(failed),root_sha256=hashes['MathGKM/Markov.lean'])))
