"""Machine-authored live request 9c20fccd: read-only reconciliation."""
from pathlib import Path
import json,hashlib
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-9c20fccd';o.mkdir(exist_ok=True)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
h=json.loads((r/'evidence/markov-07a7e5b7/artifacts.json').read_text())['hashes']
checks=[dict(path=p,expected=s,actual=sha(r/p)) for p,s in h.items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
ev=[json.loads(s) for s in (r/'.control/markov/workers/000060/events.jsonl').read_text().splitlines()]
runs=[]
for p in sorted((r/'evidence/markov-07a7e5b7').glob('run-*.json')):
 d=json.loads(p.read_text());runs.append(dict(path=str(p.relative_to(r)),returncode=d.get('returncode'),timeout=d.get('timeout'),sha256=d.get('sha256')))
rec=dict(request_id='9c20fccd3a9f4f1c9c9c9f443ef6f04b',checks=checks,inherited=ic,last_events=ev[-8:],runs=runs,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),reconciliation='Predecessor timed out after saving report; validation summary is stale: raw receipts also show DegreeBridge and DegreeObstruction replay success. Prefix final replay has no completed receipt. No previous side effect replayed.',capability_limits=['Higher-priority filesystem policy denies .scratch; use durable research/evidence artifacts.','Shell here-document failed because its temporary file is denied; switched to apply_patch for durable scripts.'],stop=(r/'.control/markov/STOP.json').exists())
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-07a7e5b7')+':'+json.loads((r/'evidence/markov-07a7e5b7/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-9c20fccd-checkpoint.md').write_text('Machine-authored request 9c20fccd. Read mission/design, pinned root/contract, inherited index and independent target/residual/core audits. Reconciled interrupted predecessor effects; summary was stale for two replay successes. No mutation replayed. Full root remains unresolved. Investigating degree-group aggregation and alternatives. .scratch denied by higher-priority policy.\n')
print(json.dumps(dict(checks=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],root=rec['root_sha256'],stop=rec['stop'],runs=runs)))
