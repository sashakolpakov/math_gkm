"""Machine-authored report preparation. No admission authority is claimed."""
from pathlib import Path
import json,hashlib,re
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-6d34d54a'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
modules=['MarkovWindowLC6d34','MarkovWindowFormula6d34','MarkovRunDegree6d34','MarkovRunLayer6d34','MarkovRunPrefix6d34','MarkovRunLayerLC6d34','MarkovRunInterval6d34']
records=[];failed=[]
for m in modules:
 p=r/'research'/f'{m}.lean';h=sha(p);runs=[]
 for q in sorted(o.glob(f'run-{m}-*.json')):
  d=json.loads(q.read_text());d['receipt']=str(q.relative_to(r));runs.append(d)
  if d.get('returncode')!=0:failed.append(dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False)))
 builds=[d for d in runs if '-build-' in d['receipt'] and d['sha256']==h and d.get('returncode')==0 and 'sorryAx' not in d.get('stdout','')]
 replays=[d for d in runs if '-replay-' in d['receipt'] and d['sha256']==h and d.get('returncode')==0]
 axioms=sorted({a.strip() for b in builds[-1:] for block in re.findall(r'depends on axioms: \[([^\]]*)\]',b.get('stdout',''),re.S) for a in block.split(',') if a.strip()})
 assert set(axioms)<=set(['propext','Classical.choice','Quot.sound'])
 records.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,build=builds[-1]['receipt'] if builds else None,replay=replays[-1]['receipt'] if replays else None,printed_axioms=axioms,forbidden_source_tokens=re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',p.read_text())))
v=dict(status='local current-source builds and separate kernel replay; inherited imports reused',modules=records,builds_passed=sum(bool(d['build']) for d in records),replays_passed=sum(bool(d['replay']) for d in records),fresh_whole_source_rebuild=False,independent_english_audit=False,root_completion=False)
(o/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
contract=json.loads((r/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
pres=dict(root_sha256=sha(r/'MathGKM/Markov.lean'),root_expected='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe',contract_canonical_sha256=canonical,contract_expected='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc',stop_file_present=(r/'.control/markov/STOP.json').exists())
assert pres['root_sha256']==pres['root_expected'] and canonical==pres['contract_expected']
(o/'preservation.json').write_text(json.dumps(pres,indent=2)+'\n')
(o/'operational-observations.json').write_text(json.dumps(dict(rejected_builds_or_replays=failed,capability_limits=['Higher-priority policy denied .scratch; no access attempted; durable evidence used.'],read_probe_failures=['STOP.json absent (normal no-stop state).','Requested MarkovCutPF2Fe01.lean, MarkovUpperTransfer725.lean and Mathlib Combinatorics/Enumerative/LogConcavity.lean paths did not exist; actual declarations located by rg.','A zsh unmatched research/MarkovCutEnumeration340*.lean glob aborted that read; files subsequently read by exact paths.'],background_processes_launched=False,external_action_requests_pending=False),indent=2)+'\n')
(o/'literature-observations.json').write_text(json.dumps(dict(source='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',actions=['Hosted open of published target','Hosted search: Markov polynomials coefficient log concavity Conjecture 6.3 proof 2026','Hosted find of Conjecture 6.3 and Theorem 6.4'],result='No retrieved theorem adopted as an axiom or proof premise. Source references only; not a comprehensive literature audit.'),indent=2)+'\n')
report=dict(request_id='6d34d54ad28c46a8a04b48ac176196b1',summary='Exact higher-cut degree-interval aggregation for repeated-B source words; full Conjecture63 remains unresolved.',completion=None,actions=['Reconciled 73 predecessor artifacts and six inherited hashes: evidence/markov-6d34d54a/reconciliation.json.','Developed exact last-cut, raw-prefix and finite-window proofs: research/MarkovRunInterval6d34.lean.','Recorded current-source builds and kernel replays: evidence/markov-6d34d54a/validation.json.','Executed exact aggregation and formula experiments under evidence/markov-6d34d54a/.','Saved mathematical derivation and scope audit: research/markov-6d34d54a-mathematics.md and research/markov-6d34d54a-correspondence.md.'],observations=[f"{v['builds_passed']} modules compiled and {v['replays_passed']} modules kernel-replayed at current source hashes; inherited imports reused.",'Repeated-B layers retain exact mask multiplicities and have an explicit negative-binomial formula. Final degree-interval theorem status is in validation.json.','Finite scans checked 89,888,933 source interval inequalities and 536,015 arbitrary-word layer inequalities with cuts at most five; no failures. These are not proofs.','Repeated-B formula checks matched 1,612,688 coefficient identities for lengths 1 through 32.','General mixed mechanical words, cross-cut horizontal/vertical inequalities, and the full pinned root remain unresolved.','Protected root and canonical contract hashes match. No independent completion audit or fresh whole-source rebuild occurred.'],agenda=['Extend actual-multiplicity degree-interval aggregation from repeated-B words to mixed mechanical source words.','Use the exact last-cut and finite-window formulas as building blocks; arbitrary nonnegative mask reweighting remains invalid.','Address comparisons across cut counts for horizontal and vertical directions, retaining polygon guards, zeros, endpoints and universal rational scope.'])
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
files=[p for p in o.iterdir() if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
files += [r/'research'/f'{m}.lean' for m in modules]
files += [r/'research'/p for p in ['start_6d34.py','aggregation_6d34.py','run_formula_6d34.py','layer_witnesses_6d34.py','validate_6d34.py','finalize_6d34.py','markov-6d34d54a-checkpoint.md','markov-6d34d54a-mathematics.md','markov-6d34d54a-correspondence.md']]
hashes={str(p.relative_to(r)):sha(p) for p in sorted(files)}
(o/'artifacts.json').write_text(json.dumps(dict(provenance='Machine-authored live worker 6d34d54a',hashes=hashes),indent=2)+'\n')
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in hashes.items()]
assert all(x['expected']==x['actual'] for x in checks)
(o/'artifact-verification.json').write_text(json.dumps(dict(verified=len(checks),all_match=True,checks=checks),indent=2)+'\n')
print(json.dumps(dict(validation=v,failed=len(failed),verified=len(checks),preservation=pres)))
