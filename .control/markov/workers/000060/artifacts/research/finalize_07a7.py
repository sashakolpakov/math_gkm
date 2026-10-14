"""Machine-authored final evidence, no root-completion authority."""
from pathlib import Path
import json,hashlib,re
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-07a7e5b7'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovCutPrefix07a7','MarkovCutDegree07a7','MarkovDegreeObstruction07a7','MarkovDegreeTransfer07a7','MarkovDegreeBridge07a7']
rows=[];attempts=[]
for f in sorted(o.glob('run-*.json')):
 q=json.loads(f.read_text());q['record']=str(f.relative_to(r));attempts.append(q)
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p)
 aa=[q for q in attempts if q['source']==str(p.relative_to(r)) and q['sha256']==h]
 builds=[q for q in aa if '-o' in q['command'] and q.get('returncode')==0]
 replays=[q for q in aa if 'leanchecker' in q['command'][0] and q.get('returncode')==0]
 rows.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,compiled=bool(builds),replayed=bool(replays),build_records=[q['record'] for q in builds],replay_records=[q['record'] for q in replays],axiom_output=builds[-1]['stdout'] if builds else None,forbidden_tokens=re.findall(r'\b(?:sorry|admit|native_decide)\b|^axiom\s',p.read_text(),re.M)))
(o/'validation.json').write_text(json.dumps(dict(status='local partial-results validation; no root completion',modules=rows,imports='Inherited compiled imports reused; no fresh whole-source rebuild or independent source/English completion audit'),indent=2)+'\n')
rc=json.loads((o/'reconciliation.json').read_text())
changes=[p for p in rc['checks']+rc['inherited'] if sha(r/p['path'])!=p['actual']]
contract=json.loads((r/'.control/markov/contract.json').read_text())
pres=dict(changed_inherited_paths=changes,root_sha256=sha(r/'MathGKM/Markov.lean'),root_unchanged=sha(r/'MathGKM/Markov.lean')==rc['root_sha256'],contract_file_sha256=sha(r/'.control/markov/contract.json'),contract_file_unchanged=sha(r/'.control/markov/contract.json')==rc['contract_file_sha256'],canonical_contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest(),stop_file_exists=(r/'.control/markov/STOP.json').exists())
(o/'preservation.json').write_text(json.dumps(pres,indent=2)+'\n')
failed=[dict(record=q['record'],source=q['source'],timeout=q.get('timeout',False),returncode=q.get('returncode'),stdout=q['stdout'],stderr=q['stderr']) for q in attempts if q.get('returncode')!=0]
ops=dict(failed_validation_attempts=failed,capabilities=['.scratch denied by higher-priority policy; durable research/evidence files used','Sage not discoverable','SymPy import raised ModuleNotFoundError','GAP discoverable, not required','Initial guessed cut_experiment_fe01.py path and optional historical horizontal-roots-12-True.json absent; no mathematical inference'],web=dict(primary='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',queries=['Markov polynomial coefficient log concavity Christoffel words horizontal log concavity 2026','log concavity coefficients fence poset rank polynomial circular fence Christoffel'],use='Source rereading and exploratory literature search; no external theorem adopted'))
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='07a7e5b715cd4825bb464f056e32ebfa',summary='Established an exact degree-refined three-state cut representation and source-specific aggregation obstructions. Full Conjecture63 remains unresolved.',actions=['Reconciled 81 predecessor artifacts and six inherited hashes: evidence/markov-07a7e5b7/reconciliation.json.','Compiled five Lean modules and recorded separate kernel replay outcomes: evidence/markov-07a7e5b7/validation.json.','Executed exact degree-group, transfer, interval and marked-gap experiments: evidence/markov-07a7e5b7/.','Saved mathematical derivations and correspondence limits: research/markov-07a7e5b7-mathematics.md and research/markov-07a7e5b7-correspondence.md.'],observations=['The pinned root and canonical contract hashes remain unchanged; completion is null.','Proved exact mask degrees, marked-mask enumeration, a positive three-state transfer, ordinary coefficient bridges, and nonnegativity with interval support for every degree layer.','Proved failures of chronological partial aggregation at source 11/13 and auxiliary degree-coordinate concavity at source 2/7. Their complete polygon-guarded raw triples satisfy the required inequalities.','All 489 reduced interior sources through denominator 40 passed degree-layer/prefix/suffix tests; 533536 coefficients matched the independent transfer implementation. These are finite experiments.','Marked-degree extensions fail for small positive markers at 2/7 and across cut counts at 1/3; no pinned raw-source counterexample was found.',f'{sum(q["compiled"] for q in rows)} modules compiled; {sum(q["replayed"] for q in rows)} completed separate kernel replay. Accepted printed axiom closures use only permitted axioms. Inherited compiled imports were reused; no fresh whole-source rebuild or independent completion audit occurred.','Rejected elaborations, replay timeouts and capability limits are retained in evidence/markov-07a7e5b7/operational-observations.json.'],agenda=['Investigate degree-layer and source degree-interval log-concavity using the checked three-state transfer; summation remains a separate obligation.','Test or prove the source diagonal marked-gap strengthening, while retaining source order and avoiding the refuted joint-degree and arbitrary-weight assertions.','Address horizontal and vertical comparisons across different cut counts, preserving the exact root, polygon guards, zeros, endpoints and universal scope.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
paths=list(o.glob('*'))+[p for p in (r/'research').glob('*') if '07a7' in p.name]
paths=[p for p in paths if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(r)):sha(p) for p in sorted(paths)}
(o/'artifacts.json').write_text(json.dumps(dict(request_id='07a7e5b715cd4825bb464f056e32ebfa',hashes=hashes),indent=2)+'\n')
verify=dict(checked=len(hashes),mismatches=[p for p,h in hashes.items() if sha(r/p)!=h])
(o/'artifact-verification.json').write_text(json.dumps(verify,indent=2)+'\n')
print(json.dumps(dict(modules=[{k:v for k,v in q.items() if k in ['module','compiled','replayed','forbidden_tokens']} for q in rows],preservation=pres,failed_attempts=len(failed),artifacts=verify)))
