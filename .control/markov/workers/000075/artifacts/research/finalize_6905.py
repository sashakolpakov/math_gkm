"""Machine-authored local evidence finalizer. Not a controller or admission gate."""
from pathlib import Path
import hashlib,json,re,sys,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6905e489'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
put=lambda name,x:(O/name).write_text(json.dumps(x,indent=2)+'\n')
inventory=json.loads((O/'audit-inventory.json').read_text())
mods=inventory['modules']+['MarkovAudit6905']
runs=[]
for p in O.glob('run-*.json'):
 d=json.loads(p.read_text());d['record']=str(p.relative_to(R));runs.append(d)
validation=[]
for m in mods:
 p=R/'research'/f'{m}.lean';h=sha(p)
 accepted={}
 for mode in ['build','replay']:
  a=[d for d in runs if d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h
     and d.get('mode')==mode and d.get('returncode')==0]
  assert a,(m,mode,'missing successful final-source validation')
  accepted[mode]=a[-1]['record']
 validation.append(dict(module=m,source=str(p.relative_to(R)),sha256=h,**accepted))
audit=[d for d in runs if d.get('source')=='research/MarkovAudit6905.lean' and d.get('returncode')==0 and d.get('mode')=='build'][-1]
axioms={name:set(x.strip() for x in ax.split(',') if x.strip()) for name,ax in
 re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",audit['stdout'])}
assert set(axioms)==set(inventory['theorems']),(set(inventory['theorems'])-set(axioms))
assert all(a<={'propext','Classical.choice','Quot.sound'} for a in axioms.values())
put('validation.json',dict(status='all listed final-source modules compiled and separately replayed',
 modules=validation,axioms={n:sorted(a) for n,a in axioms.items()},
 limits=['Pinned inherited compiled imports reused; no fresh whole-source rebuild.',
 'No independent English/source completion audit. Full root remains unresolved.']))
rec=json.loads((O/'reconciliation.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in rec['pins'].items()]
checks += [dict(path=c['path'],expected=c['expected'],actual=sha(R/c['path'])) for c in rec['checks']]
assert all(c['expected']==c['actual'] for c in checks)
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
put('preservation.json',dict(checks=checks,canonical_contract_hash=canonical,
 root_hash=sha(R/'MathGKM/Markov.lean'),stop_file_present=(R/'.control/markov/STOP.json').exists()))
failures=[dict(record=d['record'],returncode=d.get('returncode'),timeout=d.get('timeout',False))
 for d in runs if d.get('returncode')!=0]
put('operational-observations.json',dict(rejected_lean_runs=failures,
 python_failure='probe-initial-rejected.json: SyntaxError before execution, repaired and rerun.',
 capabilities=rec['capabilities'],limitations=rec['limitations'],
 missing_guessed_paths=['research/MarkovCyclicGauge75.lean','research/MarkovThirdFormula75.lean','research/third_verify_75ad.py'],
 contract_hash_note='Request hash uses sorted compact ASCII JSON without newline; actual pinned file adds a newline. Both verified.',
 process_status='Every bounded foreground validation has completed; no worker-created background process.',
 root_status='unresolved'))
put('source-use.json',dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',
 method='hosted web open and find',date='2026-10-15',
 used_sections=['(5)','(7)-(8)','Definitions 6.1-6.2','Conjecture 6.3'],
 role='Checked published raw coefficient/direction convention; no external assertion added as axiom.'))
reports=[R/'research'/f'markov-6905e489-{s}.md' for s in ['checkpoint','mathematics','correspondence']]
sources=[R/'research'/f'{m}.lean' for m in mods]
scripts=[R/'research'/s for s in ['start_6905.py','validate_6905.py','probe_cubic_6905.py',
 'local_moments_6905.py','audit_6905.py','finalize_6905.py']]
files=sources+scripts+reports+[p for p in O.iterdir() if p.is_file() and p.name not in
 ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(R)):sha(p) for p in files}
put('artifacts.json',dict(request_id='6905e489e1b94101b2cfdfbd54247a99',hashes=hashes))
verified=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in hashes.items()]
assert all(x['expected']==x['actual'] for x in verified)
put('artifact-verification.json',dict(checked=len(verified),failures=[],checks=verified))
print(json.dumps(dict(modules=len(validation),theorems=len(axioms),rejected_lean_runs=len(failures),
 artifacts=len(hashes),preserved_checks=len(checks),canonical_contract_hash=canonical,
 completion=None)))
