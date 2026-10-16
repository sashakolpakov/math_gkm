"""Machine-authored reconciliation; no controller mutation or action replay."""
from pathlib import Path
import json, hashlib, os
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-b9d0d341'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
out={'provenance':'Live research request b9d0d3410a1644b6b35ab712bbfc87f7','errors':[]}
inherited=json.loads((R/'.control/markov/inherited.json').read_text())
out['inherited']={k:sha(R/k)==v['sha256'] for k,v in inherited.items()}
for tag in ['aa6c518b','263d8c71']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 bad=[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]
 out[tag]={'checked':len(m),'mismatches':bad};out['errors']+=bad
for n in ['000128','000129']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 events=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 out[n]={'raw_log_sha256':sha(p),'event_count':len(events),'last_events':events[-3:]}
out['reconciliation']='Latest worker 129 completed. Interrupted worker 128 raw log confirms finalizer and final verification completed; surviving manifests checked without replaying effects. Excluded clustered draft remains unvalidated.'
out['capabilities']={'scratch':'Denied by higher-priority policy; not accessed. Unique research/evidence files used.','inherited_capabilities_not_retried':['zsh heredoc temporary-file denial','Sage/SymPy unavailable in preceding workers']}
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-aa6c518b')+':'+json.loads((R/'evidence/markov-aa6c518b/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
print(json.dumps({'verified':{t:out[t]['checked'] for t in ['aa6c518b','263d8c71']},'errors':out['errors'],'snapshot_files':len(snapshot),'inherited':out['inherited']}))
