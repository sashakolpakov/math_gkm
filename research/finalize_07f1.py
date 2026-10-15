"""Machine-authored validation and preservation inventory; not independent admission."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv=json.loads((O/'audit-inventory.json').read_text());runs=[]
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));runs.append(d)
unions=[]
for p in O.glob('kernel-union-*.json'):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));unions.append(d)
accepted=[]
for m in inv['modules']+['MarkovAudit07F1']:
 p=R/'research'/f'{m}.lean';h=sha(p);a=dict(module=m,source=str(p.relative_to(R)),sha256=h)
 ds=[d for d in runs if d.get('source')==a['source'] and d.get('sha256')==h and d.get('mode')=='build' and d.get('returncode')==0]
 assert ds,(m,'build');a['build']=ds[-1]['receipt']
 ds=[d for d in runs if d.get('source')==a['source'] and d.get('sha256')==h and d.get('mode')=='replay' and d.get('returncode')==0]
 us=[d for d in unions if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 assert ds or us,(m,'replay')
 a['kernel_replay']=ds[-1]['receipt'] if ds else us[-1]['receipt']
 accepted.append(a)
audit=json.loads((R/accepted[-1]['build']).read_text())
axs={n:set(x.strip() for x in a.split(',') if x.strip()) for n,a in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^]]*)\]",audit['stdout'])}
axs.update({n:set() for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",audit['stdout'])})
assert set(axs)=={n for _,n in inv['theorems']}
assert all(a<={'propext','Classical.choice','Quot.sound'} for a in axs.values())
(O/'validation.json').write_text(json.dumps(dict(status='Final sources compiled; all accepted constants kernel-replayed; named axiom closures permitted',modules=accepted,axioms={n:sorted(a) for n,a in axs.items()},limits=['Inherited compiled dependencies reused; not a fresh whole-source rebuild.','No independent hash-bound English/source completion audit.','Full pinned Conjecture63 unresolved; completion null.']),indent=2)+'\n')
rec=json.loads((O/'reconciliation.json').read_text());checks=[]
for p,h in {**rec['pins'],**rec['inherited_fdda']}.items():checks.append(dict(path=p,expected=h,actual=sha(R/p)))
checks += [dict(path=d['path'],expected=d['expected'],actual=sha(R/d['path'])) for d in rec['checks']]
assert all(d['expected']==d['actual'] for d in checks)
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')==contract['root_sha256']
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_preserved=True,contract_canonical_sha256=ch,root_matches_contract=True,stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
rejected=[dict(receipt=d['receipt'],source=d.get('source'),returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in runs if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_builds=rejected,rejected_replays=[d['receipt'] for d in unions if d.get('returncode')!=0],limitations=['Sandbox denies .scratch; persistent uniquely named research/evidence files used.','Initial shell here-document failed on temporary-file creation.','Monolithic second-band r=1 proof timed out twice; split certificate succeeded.','Rejected Lean error-recovery declarations are not accepted.','Existing generators were read; new generators and files have unique names. Final accepted files may include manual repairs; do not blindly regenerate.','No packages, protected roots, controller records, prior evidence, or permissions changed.']),indent=2)+'\n')
paths=list(O.glob('*'))+list((R/'research').glob('*07f1*'))+list((R/'research').glob('*07F1*'))
paths=[p for p in paths if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(R)):sha(p) for p in sorted(set(paths))}
(O/'artifacts.json').write_text(json.dumps(dict(request_id='07f1d4107cd9444f9e7c04207d4f33d9',hashes=hashes),indent=2)+'\n')
assert all(sha(R/p)==h for p,h in hashes.items())
(O/'artifact-verification.json').write_text(json.dumps(dict(checked=len(hashes),all_match=True,manifest_sha256=sha(O/'artifacts.json')),indent=2)+'\n')
print(json.dumps(dict(modules=len(inv['modules']),theorems=len(axs),rejected=len(rejected),artifacts=len(hashes),pinned_preserved=True)))
