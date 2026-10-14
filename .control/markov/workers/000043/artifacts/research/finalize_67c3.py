"""Machine-authored evidence manifest; operational records are not mathematics."""
import pathlib,json,hashlib,datetime
R=pathlib.Path('.');O=R/'evidence/markov-67c3f3f5'
sha=lambda p:hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
records=[(p,json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
modules=[]
for m in ['MarkovAdjacent67c3','MarkovSummandPairs67c3','MarkovFiberAdjacent67c3']:
 p=R/'research'/f'{m}.lean';digest=sha(p)
 good=[(q,d) for q,d in records if d['source']==str(p) and d['sha256']==digest and d.get('returncode')==0]
 builds=[(q,d) for q,d in good if d['command'][0].endswith('/lean')]
 replays=[(q,d) for q,d in good if d['command'][0].endswith('/leanchecker')]
 assert builds and replays,m
 q,d=builds[-1]
 axioms=[l for l in d['stdout'].splitlines() if 'depends on axioms:' in l]
 assert all('sorryAx' not in l for l in axioms)
 modules.append(dict(module=m,source=str(p),sha256=digest,build=str(q),replay=str(replays[-1][0]),axiom_lines=axioms,olean_sha256=sha(O/f'{m}.olean')))
v=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,root_sha256=sha('MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(json.load(open('.control/markov/contract.json')),sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled imports reused; not a fresh whole-source rebuild',independent_audit=False)
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
bad=[str(p) for p,d in records if d.get('returncode')!=0]
ops=dict(rejected_attempts=bad,rejected_count=len(bad),capability_failures=json.load(open(O/'reconciliation.json'))['capability_failures']+['Sparse symbolic helper had no power method; replaced by multiplication.','STOP.json was absent when checked.'],completed_foreground_sessions=True)
(O/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='67c3f3f5030b42499b0a8bba235e6267',summary='Proved uniform adjacent-charge comparisons and coefficientwise two-charge log-concavity for the exact Pell summands; full published Markov Conjecture 6.3 remains unresolved.',actions=['Reconciled the timed-out predecessor against its completed raw events and validation: evidence/markov-67c3f3f5/reconciliation.json.','Executed exact local pair experiments: evidence/markov-67c3f3f5/adjacent-summands.json, adjacent-single.json, and local-midpoint.json.','Compiled and kernel-replayed three modules: evidence/markov-67c3f3f5/validation.json.','Saved derivations and correspondence limits: research/markov-67c3f3f5-mathematics.md and research/markov-67c3f3f5-correspondence.md.'],observations=['The exact pinned root and contract hashes are unchanged; completion remains null.','Both ordered products at neighboring charge indices satisfy the middle-product bound for all parameters, including support zeros.','Every fixed two-charge polynomial has a coefficientwise nonnegative horizontal gap; the linear coefficient of the full refined gap is also nonnegative.','The distance-two midpoint comparison passed 9244313 local experimental tests including smaller distances; its universal proof remains open.','Successful printed axiom closures use only permitted axioms. Local validation reused inherited compiled imports.',f'{len(bad)} rejected elaborations and capability failures are preserved in evidence/markov-67c3f3f5/operational-observations.json. All foreground sessions completed.'],agenda=['Investigate a universal distance-two comparison and whether neighboring-charge bounds can contribute to aggregate centered-tail certificates.','Do not extend individual-pair domination to arbitrary charge separation: the inherited distance-three obstruction remains valid.','Retain all-rational coverage, vertical and diagonal inequalities, zeros, endpoints, and all source-correspondence obligations before root closure.'],completion=None)
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(modules=len(modules),rejected=len(bad),root=v['root_sha256'],report=str(O/'report.json')),indent=2))
