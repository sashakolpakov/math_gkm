"""Machine-authored reconciliation; no controller mutation or action replay."""
from pathlib import Path
import json, hashlib, os
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f52ba141'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
out={'provenance':'Live research request f52ba1417d354fe7831df8391636160f','errors':[]}
inherited=json.loads((R/'.control/markov/inherited.json').read_text())
out['inherited']={k:sha(R/k)==v['sha256'] for k,v in inherited.items()}
for tag in ['10d15751','ae257c53']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 bad=[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]
 out[tag]={'checked':len(m),'mismatches':bad};out['errors']+=bad
for n in ['000121','000126']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 events=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 out[n]={'raw_log_sha256':sha(p),'event_count':len(events),'last_events':events[-3:]}
out['reconciliation']='Latest worker completed. Interrupted worker 121 finalized many artifacts before timeout; surviving manifest checked. No inherited side effects replayed.'
out['capabilities']={'scratch':'Denied by higher-priority policy; not accessed. Unique research/evidence files used.','heredoc':'zsh heredoc failed: cannot create temporary file; use Python scripts or -c.'}
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-10d15751')+':'+json.loads((R/'evidence/markov-10d15751/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
print(json.dumps({'verified':{t:out[t]['checked'] for t in ['10d15751','ae257c53']},'errors':out['errors'],'snapshot_files':len(snapshot),'inherited':out['inherited']}))
