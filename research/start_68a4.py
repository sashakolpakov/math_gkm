"""Machine-authored live request 68a44d341d1c48e791034745c94024de."""
from pathlib import Path
import hashlib,json
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-68a44d34';o.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in json.loads((r/'evidence/markov-6d34d54a/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
events=[json.loads(s) for s in (r/'.control/markov/workers/000062/events.jsonl').read_text().splitlines()]
rec=dict(request_id='68a44d341d1c48e791034745c94024de',artifact_checks=checks,inherited_checks=ic,last_events=events[-3:],reconciliation='Immediate predecessor completed; all its recorded artifacts inspected by hash. Earlier interrupted effects were already reconciled in predecessor chain. No side effect replayed.',root_sha256=sha(r/'MathGKM/Markov.lean'),stop_file_present=(r/'.control/markov/STOP.json').exists(),capability_limits=['.scratch denied by higher-priority filesystem policy; durable research/evidence paths used.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-6d34d54a')+':'+json.loads((r/'evidence/markov-6d34d54a/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-68a44d34-checkpoint.md').write_text('Machine-authored request 68a44d341d1c48e791034745c94024de. Read complete mission/design, exact contract/root, inherited index and independent target/residual/core audits. Latest seven-module result and raw final events reconciled. Full root open. Investigating actual cut multiplicities and comparisons across cut counts; no prior side effect replayed.\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],stop=rec['stop_file_present'],last_event_types=[e.get('type') for e in events[-3:]])))
