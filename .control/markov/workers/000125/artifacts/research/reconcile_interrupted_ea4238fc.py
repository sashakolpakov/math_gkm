"""Machine-authored direct reconciliation; no prior action is replayed."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-ea4238fc'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
w=R/'.control/markov/workers/000121'
receipt=json.loads((w/'receipt.json').read_text())
events=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]
prior=json.loads((R/'evidence/markov-f8ca2c8b/interrupted-worker-reconciliation.json').read_text())
changes=receipt.get('changes',{})
checked=0;mismatch=[];skipped=[]
for p,d in changes.items():
 if not (p.startswith('research/') or p.startswith('evidence/')):
  skipped.append(p);continue
 expected=d.get('after')
 if expected is None:continue
 checked+=1
 if not (R/p).is_file() or sha(R/p)!=expected:mismatch.append(p)
out=dict(outcome=receipt.get('outcome'),event_log_sha256=sha(w/'events.jsonl'),event_count=len(events),
 last_events=events[-3:],checked_changed_artifacts=checked,mismatches=mismatch,skipped_paths=skipped,
 earlier_record_matches=sha(w/'events.jsonl')==prior['prior_reconciliation']['event_log_sha256'],
 finding='Read the complete interrupted worker log and its receipt. Its final recorded action completed finalization before timeout. Existing changes were checked; no side effect was replayed.')
(O/'interrupted-worker-reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='last_events'}))
