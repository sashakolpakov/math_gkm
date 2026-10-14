"""Machine-authored research evidence finalizer; no controller writes."""
import pathlib,json,hashlib,re,datetime
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-0c12f51d'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
modules=['MarkovMidpoint0c12','MarkovMovingFiber0c12','MarkovSourceCorner0c12','MarkovPairObstruction0c12']
runs=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
validated=[];failed=[]
for p,d in runs:
 if d.get('returncode')!=0:failed.append(str(p.relative_to(r)))
for m in modules:
 p=r/'research'/f'{m}.lean';h=sha(p)
 builds=[(q,d) for q,d in runs if d['source']==str(p.relative_to(r)) and d['sha256']==h and d.get('returncode')==0 and d['command'][0].endswith('/lean')]
 replays=[(q,d) for q,d in runs if d['source']==str(p.relative_to(r)) and d['sha256']==h and d.get('returncode')==0 and d['command'][0].endswith('/leanchecker')]
 assert builds and replays,m
 q,d=builds[-1];v,w=replays[-1]
 assert 'sorryAx' not in d['stdout']
 axiom_lines=[x for x in d['stdout'].splitlines() if 'depends on axioms:' in x]
 assert axiom_lines,m
 for line in axiom_lines:
  names=line.split('depends on axioms: [',1)[1].split(']',1)[0].split(', ')
  assert set(names)<= {'propext','Classical.choice','Quot.sound'}
 validated.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,olean_sha256=sha(o/f'{m}.olean'),build=str(q.relative_to(r)),replay=str(v.relative_to(r)),axiom_lines=axiom_lines))
root=sha(r/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
manifest=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=validated,imports='Inherited compiled imports; not a fresh whole-source rebuild',independent_audit=False,root_sha256=root)
(o/'validation.json').write_text(json.dumps(manifest,indent=2)+'\n')
ops=dict(rejected_elaborations=failed,capability_failures=['Shell here-document temp creation denied','Developer denies .scratch reads; working artifacts kept in research/evidence','SymPy unavailable: ModuleNotFoundError under /opt/homebrew/bin/python3'],foreground_sessions='All completed before final report',no_background_processes=True)
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='0c12f51d13954e288fe0129642b586e0',summary='Checked an infinite-family obstruction to single-pair comparison, positive aggregate fibers, and literal source triples; full published Markov goal remains open.',actions=['Reconciled the interrupted predecessor without replaying completed effects: evidence/markov-0c12f51d/reconciliation.json.','Executed exact midpoint and rational-polynomial diagnostics: evidence/markov-0c12f51d/midpoint.json, source-polynomial.json, uniform-probe.json.','Compiled and kernel-replayed four new modules with permitted axiom closures: evidence/markov-0c12f51d/validation.json.','Recorded derivations and all correspondence limits: research/markov-0c12f51d-mathematics.md and research/markov-0c12f51d-correspondence.md.'],observations=['Pinned Conjecture63 is unchanged and unresolved.','For every a>=22, one Pell summand product exceeds every single middle product with the same total index; this is not a source counterexample.','For a>=7, the selected moving refined fiber has nonnegative gap for every cutoff. The universal fiber goal remains unproved.','For every source a/(a+1), a>=7, raw coefficients at (0,a+3),(1,a+3),(2,a+3) satisfy strict log-concavity, with original polygon membership proved.','Validation reused inherited compiled imports; no fresh whole-source rebuild or independent hash-bound source audit is claimed.','Capability failures and rejected elaborations: evidence/markov-0c12f51d/operational-observations.json.'],agenda=['Seek aggregate matching or telescoping certificates; single summand-to-single-pair domination is uniformly obstructed.','Investigate uniform centered-tail positivity for arbitrary excess, row and total index, while retaining all-rational and remaining-direction obligations.','Require fresh whole-source rebuilding and independent hash-bound correspondence auditing before any root closure.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
paths=list(o.glob('*'))+[p for p in (r/'research').glob('*0c12*') if p.is_file()]
(o/'artifact-hashes.json').write_text(json.dumps({str(p.relative_to(r)):sha(p) for p in paths if p.is_file() and p.name!='artifact-hashes.json'},indent=2)+'\n')
print(json.dumps(dict(modules=len(validated),rejected_elaborations=len(failed),root_sha256=root,report=str(o/'report.json'))))
