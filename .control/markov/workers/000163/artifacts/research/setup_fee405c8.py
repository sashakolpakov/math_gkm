"""Machine-authored request fee405c8897249a786084298201a14aa bookkeeping."""
from pathlib import Path
import json,hashlib,shutil
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fee405c8';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text()); manifest=json.loads((R/'evidence/markov-7e2e958e/manifest.json').read_text())
raw=R/'.control/markov/workers/000156/events.jsonl'; events=[json.loads(x) for x in raw.read_text().splitlines()]
rec={'request_id':'fee405c8897249a786084298201a14aa','bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},'predecessor_artifacts':len(manifest),'mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],'root_sha256':sha(R/'MathGKM/Markov.lean'),'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),'stop_file_present':(R/'.control/markov/STOP.json').exists(),'capabilities':{'scratch':'Denied by managed policy; not accessed','sage':shutil.which('sage'),'gap':shutil.which('gap')},'interruption':{'raw_events_sha256':sha(raw),'last_events':events[-5:],'reconciliation':'Worker 156 final input check completed; replay/audit timed out. Worker 157 revalidated affected twelve modules. Worker 162 completed and its manifest verified here. No side effect replayed; pursue new weighting transfer.'},'failures':['Initial zsh heredoc could not create its temporary file; no requested script was created. Used apply_patch instead.']}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-7e2e958e')+':'+json.loads((R/'evidence/markov-7e2e958e/inherited-lean-path.json').read_text())))
for old,new in [('validate_7e2e958e.py','validate_fee405c8.py'),('ReplayIsolatedM7E2.lean','ReplayIsolatedMFEE.lean'),('audit_7e2e958e.py','audit_fee405c8.py')]:
 (R/'research'/new).write_text((R/'research'/old).read_text().replace('7e2e958e','fee405c8').replace('M7E2','MFEE'))
print(json.dumps({k:v for k,v in rec.items() if k!='interruption'}))
for p,v in idx.items():
 if p in ['requests/markov-next.json','evidence/markov/research-run/state.json']:print(p,v['content'])
print('Interrupted final events:',json.dumps(events[-5:])[-6000:])
