"""Machine-authored local receipts, not an independent root-completion audit."""
from pathlib import Path
import json,re,hashlib,shutil,importlib.util
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bdee9a64'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inventory=json.loads((O/'audit-inventory.json').read_text())
modules=inventory['modules']+['MarkovAuditBDEE'];runs=[]
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text())
 if isinstance(d,dict) and 'source' in d and 'mode' in d:
  d['receipt']=str(p.relative_to(R));runs.append(d)
accepted=[]
for m in modules:
 src=R/'research'/f'{m}.lean';h=sha(src);rec=dict(module=m,source=str(src.relative_to(R)),sha256=h)
 for mode in ['build','replay']:
  choices=[d for d in runs if d['source']==str(src.relative_to(R)) and d['sha256']==h and d['mode']==mode and d.get('returncode')==0]
  assert choices,(m,mode)
  rec[mode]=choices[-1]['receipt']
 accepted.append(rec)
audit=next(d for d in reversed(runs) if d['source']=='research/MarkovAuditBDEE.lean' and d.get('returncode')==0 and d['mode']=='build' and d['sha256']==sha(R/'research/MarkovAuditBDEE.lean'))
axioms={n:set(a.strip() for a in s.split(',') if a.strip()) for n,s in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^]]*)\]",audit['stdout'])}
axioms.update({n:set() for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",audit['stdout'])})
assert set(axioms)=={n for _,n in inventory['theorems']}
assert all(a<={'propext','Classical.choice','Quot.sound'} for a in axioms.values())
(O/'validation.json').write_text(json.dumps(dict(status='Final accepted modules compiled and separately kernel-replayed',modules=accepted,axioms={k:sorted(v) for k,v in axioms.items()},limits=['Pinned inherited compiled imports reused; no fresh whole-source rebuild.','Machine-authored scope audit only; no independent completion audit.','Uniform interior coefficient formula remains unproved. Full pinned Conjecture63 unresolved.']),indent=2)+'\n')
recon=json.loads((O/'reconciliation.json').read_text())
pres=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in recon['pins'].items()]
pres.extend(dict(path=d['path'],expected=d['expected'],actual=sha(R/d['path'])) for d in recon['checks'])
assert all(d['expected']==d['actual'] for d in pres)
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')==contract['root_sha256']
(O/'preservation.json').write_text(json.dumps(dict(checks=pres,all_preserved=True,contract_canonical_sha256=ch,root_matches_contract=True,stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
rejected=[dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False),source=d['source']) for d in runs if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_builds=rejected,capabilities=dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None),other_observations=['One premature dependent build failed before its import was accepted; it was rerun after confirmed completion.','Rejected coefficient simplifications, Fin/natural casts, and a lexical inequality parsing failure were repaired; one run-jet attempt timed out.'],limitations=['Active policy denies .scratch; unique persistent research/evidence paths used.','No package updates or shell networking.','Rejected builds may show Lean error-recovery sorryAx; none are accepted results.','Inherited compiled imports reused; no full source rebuild.'],foreground_executions='Completed before final report.'),indent=2)+'\n')
paths=list(O.glob('*'))+list((R/'research').glob('*bdee*'))+list((R/'research').glob('*BDEE*'))
paths=[p for p in paths if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(R)):sha(p) for p in sorted(set(paths))}
(O/'artifacts.json').write_text(json.dumps(dict(request_id='bdee9a64cacb4562b1d69ef649d7da48',hashes=hashes),indent=2)+'\n')
assert all(sha(R/p)==h for p,h in hashes.items())
(O/'artifact-verification.json').write_text(json.dumps(dict(checked=len(hashes),all_match=True,manifest_sha256=sha(O/'artifacts.json')),indent=2)+'\n')
print(json.dumps(dict(modules=len(modules)-1,theorems=len(axioms),rejected=len(rejected),artifacts=len(hashes),pinned_preserved=True)))
