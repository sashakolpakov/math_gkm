"""Machine-authored evidence checkpoint; does not edit controller records."""
import pathlib,hashlib,json,datetime,sys
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-88f3b553'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
records=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
modules=[];accepted=[]
for m in ['MarkovObjects88f3','MarkovSwapObstruction88f3','MarkovObjectGoal88f3']:
 p=r/'research'/f'{m}.lean';h=sha(p)
 relevant=[(q,x) for q,x in records if x['source']==str(p.relative_to(r)) and x['sha256']==h]
 builds=[(q,x) for q,x in relevant if x.get('returncode')==0 and x['command'][0].endswith('/lean') and 'sorryAx' not in x['stdout']]
 replays=[(q,x) for q,x in relevant if x.get('returncode')==0 and x['command'][0].endswith('/leanchecker')]
 row=dict(module=m,source=str(p.relative_to(r)),sha256=h,build=str(builds[-1][0].relative_to(r)) if builds else None,replay=str(replays[-1][0].relative_to(r)) if replays else None,
   axiom_lines=[s for s in builds[-1][1]['stdout'].splitlines() if 'axioms' in s] if builds else [],olean_sha256=sha(o/f'{m}.olean') if (o/f'{m}.olean').exists() else None)
 modules.append(row)
 if builds and replays:accepted.append(m)
contract=json.loads((r/'.control/markov/contract.json').read_text())
validation=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled imports; not fresh whole-source rebuild',independent_audit=False)
(o/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
failures=[dict(record=str(p.relative_to(r)),**{k:x[k] for k in ['source','sha256','returncode','timeout','stdout','stderr'] if k in x}) for p,x in records if x.get('returncode')!=0]
ops=dict(python_executable=sys.executable,failures=failures,other=['Here-document failed: cannot create temp file, operation not permitted.','Developer denies .scratch reads; retained work uses uniquely named research/evidence files.','Sage not on PATH. GAP found but not invoked.','Predecessor monotonicity kernel replay remains unconfirmed; no prior side effect replayed.'])
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='88f3b55352d94aa995ace708cad23b17',completion=None,
 summary='Established an exact all-source counting reformulation and a checked obstruction to common-vertex path switching; the full published Markov goal remains open.',
 actions=['Read mission, design, contract, inherited evidence and independent target/residual audits.',
 'Reconciled interrupted predecessor artifacts and raw events: evidence/markov-88f3b553/reconciliation.json.',
 'Executed exact decorated-path probes and overlay inventory: evidence/markov-88f3b553/orbit-horizontal.json and orbit-inventory.json.',
 'Compiled and kernel-replayed '+', '.join(accepted)+': evidence/markov-88f3b553/validation.json.',
 'Saved derivations and scope: research/markov-88f3b553-mathematics.md and research/markov-88f3b553-correspondence.md.'],
 observations=['The pinned root and canonical contract hashes match; Conjecture63 remains unresolved.',
 'Every source raw coefficient equals an explicit list multiplicity. root_iff_objects88 preserves all paths, directions, zeros and endpoint clauses; neither side is proved.',
 'At actual source 1/4, a valid endpoint path pair has component differences (1,1),(1,-1), so common-vertex swaps cannot produce a horizontal middle pair. Actual raw coefficients [2,6,4] satisfy strict LC.',
 'Finite exact overlay inventory: 34 classes, two negative classes, and total middle/endpoint counts 36/8. This requires cross-overlay compensation and is not a universal proof.',
 'Successful printed axiom closures contain only permitted axioms. Validation reused inherited compiled imports and is not an independent audit.',
 'Operational failures and rejected elaborations are retained in evidence/markov-88f3b553/operational-observations.json.'],
 agenda=['Seek aggregate injections or inequalities that can change the joint decorated-edge multiset; common-vertex switching alone is obstructed.',
 'Use the exact canonical source object model, retaining all-rational coverage and all three directions; arbitrary clouds need not satisfy LC.',
 'The Pell total-fiber positivity problem remains open; centered-layer monotonicity alone does not settle it.',
 'Require fresh whole-source rebuild, kernel replay and independent hash-bound correspondence auditing before root closure.'])
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
checkpoint=r/'research/markov-88f3b553-checkpoint.md'
with checkpoint.open('a') as f:
 f.write('\nFinal checkpoint '+validation['time']+': accepted build-and-replay modules: '+', '.join(accepted)+'.\n')
 f.write('Root hash '+validation['root_sha256']+'. Full root remains unresolved.\n')
 f.write('Report, validation manifest, operational observations and correspondence limits saved.\n')
print(json.dumps(dict(accepted=accepted,rejected=len(failures),root_sha256=validation['root_sha256'],canonical_contract_sha256=validation['contract_canonical_sha256'],report='evidence/markov-88f3b553/report.json')))
