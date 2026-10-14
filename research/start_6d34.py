"""Machine-authored request 6d34: reconciliation and immutable-input checks."""
from pathlib import Path
import json,hashlib
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-6d34d54a';o.mkdir(exist_ok=True)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
h=json.loads((r/'evidence/markov-9c20fccd/artifacts.json').read_text())['hashes']
checks=[dict(path=p,expected=s,actual=sha(r/p)) for p,s in h.items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
ev=[json.loads(s) for s in (r/'.control/markov/workers/000061/events.jsonl').read_text().splitlines()]
rec=dict(request_id='6d34d54ad28c46a8a04b48ac176196b1',checks=checks,inherited=ic,last_events=ev[-6:],root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),reconciliation='Latest predecessor completed; inspecting final events and artifact hashes. Interrupted generation60 effects were reconciled by generation61 in tail-reconciliation.json. No previous mutation replayed.',capability_limits=['Higher-priority filesystem restriction denies .scratch; durable research/evidence paths used.'],stop=(r/'.control/markov/STOP.json').exists())
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-9c20fccd')+':'+json.loads((r/'evidence/markov-9c20fccd/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-6d34d54a-checkpoint.md').write_text('Machine-authored request 6d34d54ad28c46a8a04b48ac176196b1. Read mission/design, exact protected root/contract, inherited index, independent target/residual/core audits and latest mathematics reports. Full root unresolved. New action: investigate exact source degree aggregation and stronger layer obstructions. No prior effects replayed. .scratch denied by higher-priority policy.\n')
print(json.dumps(dict(checks=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],root=rec['root_sha256'],stop=rec['stop'],events=ev[-2:])))
