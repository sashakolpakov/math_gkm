"""Machine-authored 418bcc64: reconciliation and unique local evidence setup."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-418bcc64'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-7a344181/manifest.json').read_text())
ev=R/'.control/markov/workers/000167/events.jsonl'
events=[json.loads(s) for s in ev.read_text().splitlines()]
rec={'bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},'predecessor_artifacts':len(man),
 'mismatches':[p for p,h in man.items() if sha(R/p)!=h], 'root_sha256':sha(R/'MathGKM/Markov.lean'),
 'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),
 'predecessor_events_sha256':sha(ev),'predecessor_final_events':events[-3:],
 'reconciliation':'Worker 167 completed; current worker is 168. Its successful final validation, earlier failed attempts and raw final events were inspected. No interrupted side effect to replay. Older interruption reconciliation is retained from predecessor.',
 'capabilities':{'scratch':'Denied by developer policy; not accessed. Durable unique files used.','heredoc':'zsh heredoc failed to create temporary file; use Python scripts and apply_patch.', 'sage':shutil.which('sage'),'gap':shutil.which('gap'),'Singular':shutil.which('Singular')}}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-7a344181')+':'+json.loads((R/'evidence/markov-7a344181/inherited-lean-path.json').read_text())))
for old,new in [('validate_7a344181.py','validate_418bcc64.py'),('ReplayIsolatedM7A3.lean','ReplayIsolatedM418.lean'),('audit_7a344181.py','audit_418bcc64.py')]:
 (R/'research'/new).write_text((R/'research'/old).read_text().replace('7a344181','418bcc64').replace('M7A3','M418'))
print(json.dumps({k:v for k,v in rec.items() if k!='predecessor_final_events'},indent=2))
