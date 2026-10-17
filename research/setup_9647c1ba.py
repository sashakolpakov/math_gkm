"""Machine-authored live request 9647c1ba01484705bdaa6edb4d3c7d32."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-9647c1ba'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-c3e5369f/manifest.json').read_text())
ev=R/'.control/markov/workers/000171/events.jsonl'
events=[json.loads(s) for s in ev.read_text().splitlines()]
receipt=json.loads((ev.parent/'receipt.json').read_text())
rec={'bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},'predecessor_artifacts':len(man),'mismatches':[p for p,h in man.items() if sha(R/p)!=h],
'root_sha256':sha(R/'MathGKM/Markov.lean'),'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
'predecessor_events_sha256':sha(ev),'predecessor_event_count':len(events),'predecessor_final_events':events[-4:],
'predecessor_returncode':receipt.get('returncode'),'predecessor_outcome':receipt.get('outcome'),
'reconciliation':'Worker 171 returned 1 with missing_or_malformed_report. Inspected raw final events and filesystem effects. Final manifest, preservation receipt, 14-module joint replay and 90 permitted axiom closures already exist and their hashes agree. No mathematical build or experiment is pending; no completed side effect replayed. Retain the validated second-row theorem and third-row identity, despite missing transport report.',
'capabilities':{'scratch':'Denied by developer; not accessed. Durable unique research/evidence paths used.','sage':shutil.which('sage'),'gap':shutil.which('gap'),'heredoc':'zsh here-document failed creating a temporary file; empty setup file only, replaced using apply_patch.'},'stop_file_present':(R/'.control/markov/STOP.json').exists()}
assert all(rec['bindings'].values()) and not rec['mismatches']
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file() and '9647c1ba' not in p.name:before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-c3e5369f')+':'+json.loads((R/'evidence/markov-c3e5369f/inherited-lean-path.json').read_text())))
for old,new in [('validate_c3e5369f.py','validate_9647c1ba.py'),('ReplayIsolatedMC3E.lean','ReplayIsolatedM964.lean'),('audit_c3e5369f.py','audit_9647c1ba.py'),('finalize_c3e5369f.py','finalize_9647c1ba.py')]:
 s=(R/'research'/old).read_text().replace('c3e5369fa14d43dbbe480d50598f6f6a','9647c1ba01484705bdaa6edb4d3c7d32').replace('c3e5369f','9647c1ba').replace('MC3E','M964')
 if old.startswith('finalize'):s=s.replace('markov-a646848d','markov-c3e5369f')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in rec.items() if k!='predecessor_final_events'},indent=2))
print('Final event types:',[e.get('type') for e in events[-8:]])
print('Last event:',str(events[-1])[-3000:])
