"""Machine-authored hash-bound local validation/report. No controller mutation."""
import pathlib,json,hashlib,datetime
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-58d2f411'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
names=['MarkovTopCertificate58d2','MarkovTopBinomial58d2','MarkovTopAlgebra58d2','MarkovTopSource58d2','MarkovTopHorizontal58d2']
runs=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
modules=[]
for name in names:
 p=r/'research'/f'{name}.lean';h=sha(p)
 good=[(q,v) for q,v in runs if v.get('source')==str(p.relative_to(r)) and v.get('sha256')==h and v.get('returncode')==0]
 build=[(q,v) for q,v in good if v['command'][0].endswith('/lean')]
 replay=[(q,v) for q,v in good if v['command'][0].endswith('/leanchecker')]
 if not build:raise RuntimeError('Missing final validation: '+name)
 q,v=build[-1];qr,vr=replay[-1] if replay else (None,None)
 assert 'sorryAx' not in v['stdout']
 modules.append(dict(module=name,source=str(p.relative_to(r)),sha256=h,build=str(q.relative_to(r)),replay=str(qr.relative_to(r)) if qr else None,axiom_lines=[z for z in v['stdout'].splitlines() if 'depends on axioms' in z],olean_sha256=sha(o/f'{name}.olean')))
c=json.loads((r/'.control/markov/contract.json').read_text())
validation=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled dependencies reused; no fresh whole-source rebuild',independent_audit=False)
(o/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
failed=[dict(path=str(q.relative_to(r)),returncode=v.get('returncode'),timeout=v.get('timeout',False)) for q,v in runs if v.get('returncode')!=0]
ops=dict(rejected_attempts=failed,notes=['Source bridge exposed auxiliary off-by-one N+B=D+2; corrected to N+B=D+1 and all affected modules rebuilt and replayed.','Earlier successful auxiliary builds do not certify the final theorem; final manifest binds hashes.','Two corrected-certificate builds briefly overlapped after a targeted pkill failed (sysmond service unavailable). Both completed successfully; the later build finished last. A final replay checks its output.','Higher-priority policy denies .scratch access; durable evidence paths used.','Fixed-row Sturm obstruction was already inherited in MarkovHorizontalExampleB46; no novelty credited.','Sage unavailable; no package changes.'])
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='58d2f4111d4e480ca66e64acbf12e225',summary='Established universal raw horizontal log-concavity for source triples ending on the top face; full published Markov Conjecture 6.3 remains unresolved.',actions=['Reconciled 66 predecessor artifact hashes: evidence/markov-58d2f411/reconciliation.json.','Compiled five modules; per-module kernel replay outcomes: evidence/markov-58d2f411/validation.json.','Executed exact symbolic and coefficient experiments: evidence/markov-58d2f411/top-gap-symbolic.json and top-probe.json.','Recorded derivations and scope: research/markov-58d2f411-mathematics.md and research/markov-58d2f411-correspondence.md.'],observations=['The pinned root and contract remain unchanged; Conjecture63 is unresolved.','The new top-face horizontal theorem covers all source paths, including support zeros and small-degree cases. A stronger scaled inequality holds for i+j≥2.','No failure occurred in 277139 finite top-crossing tests; 2332 exact transfer identities agreed. These experiments are not proofs.','The fixed-row real-rootedness failure at source 2/5 was a rediscovery of inherited evidence.','Successful compile axiom closures contain only permitted axioms. Validation reused inherited compiled imports; no independent completion audit was performed.',f'{len(failed)} rejected/timeout elaborations and operational corrections are retained in operational-observations.json. All foreground sessions completed.'],agenda=['Investigate top-crossing vertical comparisons with the same exact three-layer identities; the horizontal proof does not supply that direction.','Seek an induction extending top-layer horizontal aggregation to arbitrary depths using the exact transfers.','Preserve universal coverage, all directions, zeros, endpoints, and every source correspondence obligation.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(modules=len(modules),failed_attempts=len(failed),root=validation['root_sha256'],report=str((o/'report.json').relative_to(r)))))
