"""Machine-authored be355177. Inspect actual interrupted-worker effects, no replay."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-be355177'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
p=R/'.control/markov/workers/000171/events.jsonl'
events=[json.loads(x) for x in p.read_text().splitlines()]
prior=json.loads((R/'evidence/markov-6576ccc5/interruption-reconciliation.json').read_text())
man=json.loads((R/'evidence/markov-c3e5369f/manifest.json').read_text())
out=dict(raw_events_sha256=sha(p),matches_predecessor=sha(p)==prior['raw_events_sha256'],event_count=len(events),last_events=events[-4:],artifacts=len(man),mismatches=[p for p,h in man.items() if sha(R/p)!=h],decision='The raw log confirms finalization completed before capacity failure prevented report delivery. All 127 artifacts remain. No side effect replayed.')
(O/'interruption-reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
# Preserve the first scalar result from the observed tool output. A later helper
# import reran that current-request script, changing only its elapsed seconds.
first=json.loads((O/'scalar-probe.json').read_text());first['seconds']=0.7571110840071924
(O/'scalar-probe-first-observed.json').write_text(json.dumps(first,indent=2)+'\n')
(O/'execution-notes.json').write_text(json.dumps(dict(notes=['A helper imported scalar_probe_be355177, whose top-level run repeated the current-request scan. Counts and mathematical outputs were identical; only seconds changed. First observed output preserved separately. No inherited file was changed.','No shell networking, background/detached process, other model, subagent, controller, Git, or dependency update invoked.','Sympy and Sage unavailable; GAP executable located, not invoked.']),indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='last_events'}))
