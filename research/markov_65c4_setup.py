"""Machine-authored research checkpoint; no controller mutations."""
import json, hashlib, pathlib, shutil, time
R=pathlib.Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-65c4dfb8'
O.mkdir(exist_ok=True)
state=json.loads((R/'.control/markov/engine/state.json').read_text())
last=state['events'][-1]['result']
events=[json.loads(x) for x in (R/'.control/markov/workers/000035/events.jsonl').read_text().splitlines()]
changes=last['changes']; checked=[]
for p,h in changes.items():
 if p.startswith('research/'):
  checked.append(dict(path=p,matches=hashlib.sha256((R/p).read_bytes()).hexdigest()==h['after']))
rec=dict(predecessor=last['request_id'],outcome=last['outcome'],last_events=[x.get('type') for x in events[-3:]],
         source_hash_checks=checked,root_sha256=hashlib.sha256((R/'MathGKM/Markov.lean').read_bytes()).hexdigest(),
         decision='Retain completed predecessor artifacts. Its reconciliation covers earlier interruption. No finalizer replay.',
         capabilities={x:shutil.which(x) for x in ['sage','gap','lean','lake']},
         failures=['zsh heredoc cannot create temporary file','Policy denies .scratch; use research/evidence persistent files','Guessed research/markov-9a72a605-mathematics.md absent; actual suffix is 9a720f77'])
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec,indent=2))
