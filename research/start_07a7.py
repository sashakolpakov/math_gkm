"""Machine-authored request 07a7e5b7: read-only reconciliation, fresh evidence."""
from pathlib import Path
import json, hashlib, shutil
r=Path('/Users/sasha/math_gkm'); o=r/'evidence/markov-07a7e5b7'; o.mkdir(exist_ok=True)
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
h=json.loads((r/'evidence/markov-fe01d46b/artifacts.json').read_text())['hashes']
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=s,actual=sha(r/p)) for p,s in h.items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
ev=[json.loads(s) for s in (r/'.control/markov/workers/000059/events.jsonl').read_text().splitlines()]
rec=dict(request_id='07a7e5b715cd4825bb464f056e32ebfa',checks=checks,inherited=ic,last_events=ev[-5:],root_sha256=sha(r/'MathGKM/Markov.lean'),contract_file_sha256=sha(r/'.control/markov/contract.json'),reconciliation='Latest worker completed; its reconciliation of earlier timeout effects and final raw events inspected. No inherited mutation replayed.',capability_failures=['Higher-priority policy denies .scratch; use durable research/evidence files. Initial guessed cut_experiment_fe01.py path absent; actual file cuts_fe01.py located.'],tools={x:shutil.which(x) for x in ['sage','gap','lean','lake']})
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-fe01d46b')+':'+json.loads((r/'evidence/markov-fe01d46b/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-07a7e5b7-checkpoint.md').write_text('Machine-authored request 07a7e5b7. Mission/design, exact root, inherited index and independent target/residual audits read. Latest worker effects reconciled; no inherited side effect replayed. Root remains unresolved. Investigating order-sensitive cut aggregation. .scratch is denied by higher-priority policy.\n')
print(json.dumps(dict(checked=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['actual']!=x['expected']],root=rec['root_sha256'],tools=rec['tools'],last_events=ev[-2:],stop=(r/'.control/markov/STOP.json').exists())))
