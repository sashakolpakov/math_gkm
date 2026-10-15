"""Machine-authored local research receipts; no admission or controller action."""
from pathlib import Path
import json,re,hashlib,shutil,importlib.util
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-adb2c7b0'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inventory=json.loads((O/'audit-inventory.json').read_text())
modules=inventory['modules']+['MarkovAuditADB2']
runs=[]
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text())
 if not isinstance(d,dict) or 'source' not in d or 'mode' not in d:continue
 d['receipt']=str(p.relative_to(R));runs.append(d)
accepted=[]
for m in modules:
 src=R/'research'/f'{m}.lean';h=sha(src);rec=dict(module=m,source=str(src.relative_to(R)),sha256=h)
 for mode in ['build','replay']:
  choices=[d for d in runs if d['source']==str(src.relative_to(R)) and d['sha256']==h and d['mode']==mode and d.get('returncode')==0]
  assert choices,(m,mode)
  rec[mode]=choices[-1]['receipt']
 accepted.append(rec)
audit=next(d for d in reversed(runs) if d['source']=='research/MarkovAuditADB2.lean' and d.get('returncode')==0 and d['mode']=='build')
axioms={n:set(a.strip() for a in s.split(',') if a.strip()) for n,s in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^]]*)\]",audit['stdout'])}
axioms.update({n:set() for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",audit['stdout'])})
assert set(axioms)=={n for _,n in inventory['theorems']},(set(axioms),inventory['theorems'])
assert all(a<={'propext','Classical.choice','Quot.sound'} for a in axioms.values())
(O/'validation.json').write_text(json.dumps(dict(status='all final-source modules compiled and separately kernel-replayed',modules=accepted,axioms={k:sorted(v) for k,v in axioms.items()},limits=['Pinned inherited compiled imports reused; no fresh whole-source rebuild.','Machine-authored scope audit only; no independent completion audit.','Full pinned Conjecture63 unresolved.']),indent=2)+'\n')
recon=json.loads((O/'reconciliation.json').read_text())
pres=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in recon['pins'].items()]
pres.extend(dict(path=d['path'],expected=d['expected'],actual=sha(R/d['path'])) for d in recon['checks'])
assert all(d['expected']==d['actual'] for d in pres)
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical_hash=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert canonical_hash=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')==contract['root_sha256']
(O/'preservation.json').write_text(json.dumps(dict(checks=pres,all_preserved=True,contract_canonical_sha256=canonical_hash,root_matches_contract=True,stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
rejected=[dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False),source=d['source']) for d in runs if d.get('returncode')!=0]
(O/'finalizer-repair.json').write_text(json.dumps(dict(failure='Initial finalizer glob included run-chamber-symbolic.json, a list, causing TypeError before any output writes.',repair='Filter for dictionary build receipts with source and mode fields. No completed side effect replayed.'),indent=2)+'\n')
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_builds=rejected,capabilities=dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None),other_observations=['One documentation apply_patch failed its precondition and made no changes; corrected patch succeeded.','One exploratory rg shell glob matched no files; subsequent explicit file reads succeeded.'],limitations=['Active policy denies .scratch; unique research/evidence paths used.','No package downloads or shell networking.','Rejected builds may show Lean error-recovery sorryAx; none are admitted results.','Inherited compiled imports reused; no full dependency source rebuild.'],foreground_executions='All completed before final report.'),indent=2)+'\n')
(O/'source-use.json').write_text(json.dumps(dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',retrieval='Hosted live web open and find during this request',sections=['(5)','(7)','(8)','Definitions 6.1–6.2','Conjecture 6.3'],use='Checked source raw-coefficient convention and three principal directions; no external axiom or novelty claim.'),indent=2)+'\n')
paths=list(O.glob('*'))+[R/'research'/f'{m}.lean' for m in modules]
paths += list((R/'research').glob('*adb2*'))
paths=[p for p in paths if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(R)):sha(p) for p in sorted(set(paths))}
(O/'artifacts.json').write_text(json.dumps(dict(request_id='adb2c7b044ee463584f90512a565fe95',hashes=hashes),indent=2)+'\n')
assert all(sha(R/p)==h for p,h in hashes.items())
(O/'artifact-verification.json').write_text(json.dumps(dict(checked=len(hashes),all_match=True,manifest_sha256=sha(O/'artifacts.json')),indent=2)+'\n')
print(json.dumps(dict(modules=len(modules)-1,theorems=len(axioms),rejected=len(rejected),artifacts=len(hashes),pinned_preserved=True)))
