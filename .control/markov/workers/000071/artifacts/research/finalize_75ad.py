"""Machine-authored final local evidence checkpoint; no root admission."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-75ad68f9'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def put(name,obj):(O/name).write_text(json.dumps(obj,indent=2)+'\n')
mods=['MarkovThirdCandidate75','MarkovThirdLow75','MarkovThirdMidLow75','MarkovThirdMidHigh75','MarkovThirdHigh75','MarkovThirdTransfer75','MarkovThirdRegions75','MarkovRunGauge75']
rows=[]
for m in mods:
 row=dict(module=m,sha256=sha(R/'research'/f'{m}.lean'))
 for mode in ['build','replay']:
  records=sorted(O.glob(f'run-{m}-{mode}-*.json'))
  good=[p for p in records if (d:=json.loads(p.read_text())).get('returncode')==0 and d['sha256']==row['sha256']]
  assert good,(m,mode)
  row[mode]=str(good[-1].relative_to(R))
 rows.append(row)
put('validation.json',dict(modules=rows,all_compiled=True,all_replayed=True,scope='Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit.'))
rec=json.loads((O/'reconciliation.json').read_text())
checks=[dict(path=x['path'],expected=x['expected'],actual=sha(R/x['path'])) for x in rec['artifact_checks']+rec['inherited_checks']]
checks += [dict(path=p,expected=rec[k],actual=sha(R/p)) for p,k in [('MathGKM/Markov.lean','root_sha256'),('.control/markov/contract.json','contract_sha256')]]
assert all(x['expected']==x['actual'] for x in checks)
put('preservation.json',dict(checks=checks,all_unchanged=True,stop_file_present=(R/'.control/markov/STOP.json').exists()))
put('operational-observations.json',dict(capabilities=rec['capabilities'],failures=['SymPy import failed: ModuleNotFoundError; exact rational/polynomial code used instead.','Initial combined read output was truncated; required mission/design/audits were reread separately.','Some guessed optional filenames did not exist; actual paths were located with rg.'],limits=rec['limits'],predecessor_reconciliation=rec['reconciliation'],background_processes_started=False,foreground_executions_completed=True))
put('literature.json',dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',access='Hosted web open on 2026-10-15; source equations and target context consulted.',mathematical_axioms_added=False))
report=dict(request_id='75ad68f9fceb45ac8c98b66f8abbd207',summary='Proved third-lower-slice candidate inequalities and exact trace/gauge identities. The universal source formula and full Conjecture63 remain unresolved.',actions=['Verified 98 predecessor artifacts and six inherited inputs: evidence/markov-75ad68f9/reconciliation.json.','Compiled and separately kernel-replayed eight modules: evidence/markov-75ad68f9/validation.json.','Executed exact symbolic, transport and independent recurrence experiments: evidence/markov-75ad68f9/third-verification.json, third-fit.json and pair-routes.json.','Recorded derivation and correspondence limits: research/markov-75ad68f9-mathematics.md and research/markov-75ad68f9-correspondence.md.'],observations=['Universal candidate-sequence log-concavity is proved in four parameter regions with zero tails. Its identification with every low-slope source third lower slice remains an explicit unproved hypothesis.','Proved all-cut source trace extraction and cyclic gauge identities giving every run block the same constant projection.','126894 candidate formula positions matched on 1518 sources; independent literal recurrence matched 1242 positions. These are finite experiments.','An enlarged adjacent-run word has triple [1012204,2012,4], gap -672. One endpoint is outside its synthetic polygon and it is not a source word. The actual 61/181 source gives [1011856,1660,0]. No root refutation.','All eight modules passed separate replay with permitted printed axiom closures. Pinned inputs and predecessor artifacts remain unchanged. No fresh whole-source rebuild or independent completion audit occurred.'],agenda=['Prove the general cubic cyclic expansion and the source pattern-count identities needed for ThirdFormula75; handle the small cycle corrections explicitly.','Do not assume unrestricted diagonal closure on arbitrary adjacent-run words. The new failure lies outside the synthetic polygon, so polygon-guarded enlargement is a separate question.','Resolve all remaining raw directions and correspondence obligations before root closure.'],completion=None)
put('report.json',report)
with (R/'research/markov-75ad68f9-checkpoint.md').open('a') as f:f.write('\nFinal checkpoint: eight modules compiled and separately replayed; candidate LC proved, universal third source formula open. 1518-source finite validation completed. See final report and correspondence files.\n')
files=[R/'research'/f'{m}.lean' for m in mods]+[p for p in (R/'research').glob('*75ad*')]+list(O.iterdir())
files={p for p in files if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']}
hashes={str(p.relative_to(R)):sha(p) for p in sorted(files)}
put('artifacts.json',dict(request_id=report['request_id'],hashes=hashes))
verification=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in hashes.items()]
assert all(x['expected']==x['actual'] for x in verification)
put('artifact-verification.json',dict(count=len(verification),all_match=True,checks=verification))
print(json.dumps(dict(modules=len(rows),artifacts=len(hashes),preserved=len(checks),completion=None)))
