"""Machine-authored receipts and preservation; not independent root admission."""
from pathlib import Path
import json,re,hashlib,shutil,importlib.util
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fddabb33'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv=json.loads((O/'audit-inventory.json').read_text());runs=[]
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));runs.append(d)
accepted=[]
for m in inv['modules']+['MarkovAuditFDDA']:
 p=R/'research'/f'{m}.lean';h=sha(p);a=dict(module=m,source=str(p.relative_to(R)),sha256=h)
 for mode in ['build','replay']:
  ds=[d for d in runs if d.get('source')==a['source'] and d.get('sha256')==h and d.get('mode')==mode and d.get('returncode')==0]
  assert ds,(m,mode)
  a[mode]=ds[-1]['receipt']
 accepted.append(a)
audit=[d for d in runs if d.get('source')=='research/MarkovAuditFDDA.lean' and d.get('mode')=='build' and d.get('returncode')==0 and d['sha256']==sha(R/'research/MarkovAuditFDDA.lean')][-1]
axs={n:set(x.strip() for x in a.split(',') if x.strip()) for n,a in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^]]*)\]",audit['stdout'])}
axs.update({n:set() for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",audit['stdout'])})
assert set(axs)=={n for _,n in inv['theorems']}
assert all(a<={'propext','Classical.choice','Quot.sound'} for a in axs.values())
(O/'validation.json').write_text(json.dumps(dict(status='Final accepted sources compiled and separately replayed',modules=accepted,axioms={n:sorted(a) for n,a in axs.items()},limits=['Inherited compiled dependencies reused; not a fresh whole-source rebuild.','No independent hash-bound completion audit.','Full pinned Conjecture63 unresolved; completion null.']),indent=2)+'\n')
recon=json.loads((O/'reconciliation.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in recon['pins'].items()]
checks += [dict(path=d['path'],expected=d['expected'],actual=sha(R/d['path'])) for d in recon['checks']]
assert all(d['expected']==d['actual'] for d in checks)
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')==contract['root_sha256']
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_preserved=True,contract_canonical_sha256=ch,root_matches_contract=True,stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
rejected=[dict(receipt=d['receipt'],source=d.get('source'),returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in runs if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_builds=rejected,capabilities=dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None),other_observations=['Shell here-document temporary-file creation denied; replaced with persistent Python scripts.','Initial read output truncated by inherited embedded history; mission/design and audits subsequently read separately.','Two attempted reads used MathGKM paths for research modules and failed; corrected to research/.','Large algebraic normalization proof split after timeout; failed receipts retained.'],limitations=['Active higher-priority sandbox denies .scratch, so uniquely named persistent research/evidence paths used.','No package updates, shell networking, controller calls, commits, or protected edits.','Rejected Lean elaborations may print error-recovery sorryAx; no such result accepted.'],foreground_executions='Completed before final report.'),indent=2)+'\n')
paths=list(O.glob('*'))+list((R/'research').glob('*fdda*'))+list((R/'research').glob('*FDDA*'))
paths=[p for p in paths if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(R)):sha(p) for p in sorted(set(paths))}
(O/'artifacts.json').write_text(json.dumps(dict(request_id='fddabb33d2704cfe80b4fa474cf8edc1',hashes=hashes),indent=2)+'\n')
assert all(sha(R/p)==h for p,h in hashes.items())
(O/'artifact-verification.json').write_text(json.dumps(dict(checked=len(hashes),all_match=True,manifest_sha256=sha(O/'artifacts.json')),indent=2)+'\n')
print(json.dumps(dict(modules=len(inv['modules']),theorems=len(axs),rejected=len(rejected),artifacts=len(hashes),pinned_preserved=True)))
