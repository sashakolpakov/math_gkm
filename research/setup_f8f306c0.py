"""Machine-authored live worker f8f306c0: read-only reconciliation and local setup."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f8f306c0'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-418bcc64/manifest.json').read_text())
ev=R/'.control/markov/workers/000168/events.jsonl'
events=[json.loads(s) for s in ev.read_text().splitlines()]
rec={'bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},
 'predecessor_artifacts':len(man),'mismatches':[p for p,h in man.items() if sha(R/p)!=h],
 'root_sha256':sha(R/'MathGKM/Markov.lean'),
 'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),
 'predecessor_events_sha256':sha(ev),'predecessor_final_events':events[-3:],
 'reconciliation':'Worker 168 completed. Its 180s and 150s certificate timeouts and generated uncompiled source bridge were inspected. They are not admitted results. No interrupted action is replayed; smaller new certificates will use new names. Older interruption reconciliation is inherited unchanged.',
 'capabilities':{'scratch':'Denied by developer policy; not accessed. Unique durable research/evidence files used.', 'sage':shutil.which('sage'),'gap':shutil.which('gap')}}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file() and 'f8f306c0' not in p.name: before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-418bcc64')+':'+json.loads((R/'evidence/markov-418bcc64/inherited-lean-path.json').read_text())))
for old,new in [('validate_418bcc64.py','validate_f8f306c0.py'),('ReplayIsolatedM418.lean','ReplayIsolatedMF8F.lean'),('audit_418bcc64.py','audit_f8f306c0.py')]:
 (R/'research'/new).write_text((R/'research'/old).read_text().replace('418bcc64','f8f306c0').replace('M418','MF8F'))
print(json.dumps({k:v for k,v in rec.items() if k!='predecessor_final_events'},indent=2))
