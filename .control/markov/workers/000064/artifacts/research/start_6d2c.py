"""Machine-authored live request 6d2c5a67e4e14b3993f3b98af6bf0e61."""
from pathlib import Path
import hashlib,json
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-6d2c5a67';o.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in json.loads((r/'evidence/markov-68a44d34/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
events=[json.loads(s) for s in (r/'.control/markov/workers/000063/events.jsonl').read_text().splitlines()]
rec=dict(request_id='6d2c5a67e4e14b3993f3b98af6bf0e61',artifact_checks=checks,inherited_checks=ic,last_events=events[-3:],reconciliation='Immediate predecessor completed; recorded artifacts checked by hash. Earlier interrupted effects reconciled by completed predecessor chain. No side effects replayed.',root_sha256=sha(r/'MathGKM/Markov.lean'),stop_file_present=(r/'.control/markov/STOP.json').exists(),capability_limits=['.scratch denied by higher-priority filesystem policy; durable research/evidence paths used.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-68a44d34')+':'+json.loads((r/'evidence/markov-68a44d34/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-6d2c5a67-checkpoint.md').write_text('Machine-authored live request 6d2c5a67. Read complete mission/design, contract/root, inherited index, independent target/residual/core audits, latest mathematics. Root unresolved. Investigating degree-minus-cut alignment on full layers and source aggregation. Higher-priority policy denies .scratch; no access attempted.\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],stop=rec['stop_file_present'],last_events=events[-1:])))
