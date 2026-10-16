"""Machine-authored live research worker e9cdd527ea604fdcb514caecc8cc9944."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-e9cdd527';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
d={'request_id':'e9cdd527ea604fdcb514caecc8cc9944','inherited':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
m=json.loads((R/'evidence/markov-96ada19b/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
p=R/'.control/markov/workers/000153/events.jsonl'
es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
d['interrupted']={'events_sha256':sha(p),'count':len(es),'last_events':es[-2:],'prior_reconciliation':json.loads((R/'evidence/markov-9e205206/reconciliation.json').read_text())['reconciliation']}
d['reconciliation']='Worker 155 completed. Interrupted 153 already reconciled by 154 and inspected by 155; inspected raw final events again. No predecessor mutation replayed.'
d['capabilities']={'scratch':'Denied by higher-priority policy; not accessed. Unique research/evidence files used.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-96ada19b')+':'+json.loads((R/'evidence/markov-96ada19b/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_96ada19b.py','validate_e9cdd527.py'),('ReplayIsolatedM96A.lean','ReplayIsolatedME9C.lean'),('audit_96ada19b.py','audit_e9cdd527.py'),('finalize_96ada19b.py','finalize_e9cdd527.py')]:
 s=(R/'research'/old).read_text().replace('96ada19b','e9cdd527').replace('M96A','ME9C');(R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in d.items() if k!='interrupted'}))
