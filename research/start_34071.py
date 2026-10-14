"""Machine-authored reconciliation, live request 34071a88; read-only prior work."""
from pathlib import Path
import json, hashlib, os
r=Path('/Users/sasha/math_gkm'); out=r/'evidence/markov-34071a88'
out.mkdir(exist_ok=True)
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
prior=json.loads((r/'evidence/markov-7d80a785/artifacts.json').read_text())['hashes']
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in prior.items()]
idx=json.loads((r/'.control/markov/inherited.json').read_text())
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
events=[json.loads(s) for s in (r/'.control/markov/workers/000057/events.jsonl').read_text().splitlines()]
last=[x for x in events if x.get('item',{}).get('id') in ['item_107','item_120','item_129','item_130','item_131']]
rec=dict(request_id='34071a88f5e74d9bb6a7e4fa9173f2ff',checks=checks,inherited=ic,latest_events=last,
 reconciliation='Last worker timed out after completing its finalizer and successful source and residual kernel replays. No mutation is replayed. Earlier interruptions were reconciled by that worker.',
 root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),
 capability_failures=['Shell here-document failed because its temporary location is denied. No file was created. Higher-priority policy denies .scratch; durable research/evidence files used.'])
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(r/'evidence/markov-7d80a785')+':'+json.loads((r/'evidence/markov-7d80a785/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(r/'research/markov-34071a88-checkpoint.md').write_text('Machine-authored live request 34071a88. Read mission/design, pinned root, inherited index and independent target/residual audits. Reconciled interrupted worker through its raw final events; no side effects replayed. New direction: investigate a global coefficient inequality using the positive ambient transfer. Full root unresolved. .scratch is denied by higher-priority policy, so all durable work is under research/ and evidence/.\n')
print(json.dumps(dict(prior=len(checks),mismatches=[x for x in checks+ic if x['actual']!=x['expected']],root=rec['root_sha256'],stop=(r/'.control/markov/STOP.json').exists())))
