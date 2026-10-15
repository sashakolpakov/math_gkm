"""Machine-authored evidence manifest; no controller mutation or root admission."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-b485717c'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
modules=['MarkovCutActivityB485','MarkovActivityFormulaB485','MarkovActivityFailureB485','MarkovGeometricWordB485','MarkovGeometricSlice3B485','MarkovGeometricSlice4B485','MarkovGeometricSlice5B485','MarkovGeometricFailureB485','MarkovGeometricSourceB485']
records=[]
for p in sorted(O.glob('run-*.json')):
 r=json.loads(p.read_text())
 if 'source' in r and 'command' in r:records.append(dict(record=str(p.relative_to(R)),**r))
validation=[]
for m in modules:
 p=R/'research'/f'{m}.lean';h=sha(p)
 rr=[r for r in records if r['source']==str(p.relative_to(R)) and r['sha256']==h]
 build=[r for r in rr if r['mode']=='build' and r.get('returncode')==0 and 'sorryAx' not in r.get('stdout','')]
 replay=[r for r in rr if r['mode']=='replay' and r.get('returncode')==0]
 validation.append(dict(module=m,sha256=h,build=build[-1]['record'] if build else None,replay=replay[-1]['record'] if replay else None))
audit=R/'research/MarkovAuditB485.lean'
if audit.exists():
 ar=[r for r in records if r['source']==str(audit.relative_to(R)) and r['sha256']==sha(audit) and r.get('returncode')==0]
else:ar=[]
if ar:
 closures=re.findall(r'depends on axioms: \[([^\]]*)\]',ar[-1]['stdout'])
 used={x.strip() for c in closures for x in c.split(',') if x.strip()}
 assert used <= {'propext','Classical.choice','Quot.sound'},used
 assert 'sorryAx' not in ar[-1]['stdout']
(O/'validation.json').write_text(json.dumps(dict(modules=validation,all_compiled=all(x['build'] for x in validation),all_replayed=all(x['replay'] for x in validation),axiom_audit=ar[-1]['record'] if ar else None,scope='Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit.'),indent=2)+'\n')
rejected=[r for r in records if r.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_builds_and_timeouts=rejected,capability_limits=['Higher-priority policy prohibits .scratch; unique research/evidence files used.','Sage not found on supplied PATH; GAP found but not needed.','Initial combined read was truncated; mission/design and audits reread separately.','Two guessed inherited filenames and a wildcard had no match; corrected using rg.','One cosmetic apply_patch failed to match and had no effect.'],experiment_caps='The family scan tested its 45-second cap after each family member and completed at 51.24 seconds.',foreground='All proof runs are bounded subprocess.run calls. All yielded sessions completed; no background processes or pending supervisor action.'),indent=2)+'\n')
idx=json.loads((R/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in json.loads((R/'evidence/markov-e45ef6ac/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(R/p)) for p,v in idx.items()]
pres=dict(prior_artifacts=checks,inherited=ic,root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=sha(R/'.control/markov/contract.json'),stop_file_present=(R/'.control/markov/STOP.json').exists())
assert all(x['expected']==x['actual'] for x in checks+ic)
assert pres['root_sha256']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
initial=json.loads((O/'reconciliation.json').read_text())
assert pres['contract_sha256']==initial['contract_sha256']
contract=json.loads((R/'.control/markov/contract.json').read_text())
pres['contract_canonical_sha256']=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert pres['contract_canonical_sha256']=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(O/'preservation.json').write_text(json.dumps(pres,indent=2)+'\n')
files=[p for p in O.iterdir() if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
files += [p for p in (R/'research').iterdir() if p.is_file() and ('b485' in p.name.lower())]
hashes={str(p.relative_to(R)):sha(p) for p in sorted(files)}
(O/'artifacts.json').write_text(json.dumps(dict(request_id='b485717c0c2e4ae9b5526ee78a83dc99',hashes=hashes),indent=2)+'\n')
verify=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in hashes.items()]
assert all(x['expected']==x['actual'] for x in verify)
(O/'artifact-verification.json').write_text(json.dumps(dict(checked=len(verify),mismatches=[],checks=verify),indent=2)+'\n')
print(json.dumps(dict(validation=validation,axiom_audit=ar[-1]['record'] if ar else None,artifact_count=len(verify),rejected_records=len(rejected),preservation='all matched')))
