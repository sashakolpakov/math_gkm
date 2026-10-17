"""Machine-authored live request 139fed75c29240ba95427717b28c29a7."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-139fed75'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
prev=json.loads((R/'evidence/markov-9647c1ba/manifest.json').read_text())
rec={'bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},'predecessor_artifacts':len(prev),'mismatches':[p for p,h in prev.items() if sha(R/p)!=h],
'root_sha256':sha(R/'MathGKM/Markov.lean'),'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
'reconciliation':'Immediate predecessor 172 completed and its artifacts agree. Worker 171 interruption was already reconciled in predecessor reconciliation.json: final validation completed before transport failure. Read that record and retained the effects; no side effect replayed.',
'capabilities':{'scratch':'Developer denies access; unique durable research/evidence paths used instead.','sage':shutil.which('sage'),'gap':shutil.which('gap')},'stop_file_present':(R/'.control/markov/STOP.json').exists()}
assert all(rec['bindings'].values()) and not rec['mismatches']
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file() and '139fed75' not in p.name:before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-9647c1ba')+':'+json.loads((R/'evidence/markov-9647c1ba/inherited-lean-path.json').read_text())))
for old,new in [('validate_9647c1ba.py','validate_139fed75.py'),('ReplayIsolatedM964.lean','ReplayIsolatedM139.lean'),('audit_9647c1ba.py','audit_139fed75.py'),('finalize_9647c1ba.py','finalize_139fed75.py')]:
 s=(R/'research'/old).read_text().replace('9647c1ba01484705bdaa6edb4d3c7d32','139fed75c29240ba95427717b28c29a7').replace('9647c1ba','139fed75').replace('M964','M139')
 if old.startswith('finalize'):s=s.replace('markov-c3e5369f','markov-9647c1ba')
 (R/'research'/new).write_text(s)
print(json.dumps(rec,indent=2))
