"""Machine-authored live request 7d905904dcbe45a89408ca2cea9065c6."""
from pathlib import Path
import hashlib,json
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-7d905904';o.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in json.loads((r/'evidence/markov-6d2c5a67/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
events=[json.loads(s) for s in (r/'.control/markov/workers/000064/events.jsonl').read_text().splitlines()]
rec=dict(request_id='7d905904dcbe45a89408ca2cea9065c6',artifact_checks=checks,inherited_checks=ic,last_events=events[-3:],reconciliation='Immediate predecessor completed. Earlier interrupted effects reconciled by completed predecessor chain. Four separate replays timed out; do not infer successful replay from compilation. No side effects replayed.',root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),stop_file_present=(r/'.control/markov/STOP.json').exists(),capability_limits=['.scratch denied by higher-priority filesystem policy; durable research/evidence paths used.','Initial shell heredoc failed to create temporary file. No denied file read attempted.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-6d2c5a67')+':'+json.loads((r/'evidence/markov-6d2c5a67/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-7d905904-checkpoint.md').write_text('Machine-authored live request 7d905904. Read complete mission/design, contract/root, inherited index, independent target/residual/core audits, latest mathematics. Full root unresolved. Investigating aligned interval structure, retaining signed grades. No inherited failed computation is blindly repeated.\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],stop=rec['stop_file_present'],last_event=events[-1].get('type'))))
