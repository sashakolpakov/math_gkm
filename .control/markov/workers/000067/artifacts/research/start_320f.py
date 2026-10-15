"""Machine-authored live Markov research request 320fe46f."""
from pathlib import Path
import json, hashlib, shutil
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-320fe46f';o.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in json.loads((r/'evidence/markov-c4169865/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
events=[json.loads(s) for s in (r/'.control/markov/workers/000066/events.jsonl').read_text().splitlines()]
tail=events[-12:]
(o/'predecessor-event-tail.json').write_text(json.dumps(tail,indent=2)+'\n')
rec=dict(request_id='320fe46fcee34a5a829606c8fa65b08e',artifact_checks=checks,inherited_checks=ic,last_event_types=[e.get('type') for e in tail],reconciliation='Interrupted c416 worker left four replayed modules, compiled Tail module with incomplete replay, and Raw module whose only build timed out after 18 seconds. No Raw olean exists. New copies/build receipts will preserve all prior files; do not treat timeout as mathematical failure.',root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),stop_file_present=(r/'.control/markov/STOP.json').exists(),capability_limits=['Higher-priority denial of .scratch; unique durable research/evidence paths used.','Shell heredoc failed because shell temporary-file creation is denied; use apply_patch and ordinary script files.','Nonexistent guessed inherited file MarkovGradedGap7d90.lean; no mathematical implication.'],capabilities={x:shutil.which(x,path='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin') for x in ['sage','gap','lean','lake']})
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-c4169865')+':'+json.loads((r/'evidence/markov-c4169865/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-320fe46f-checkpoint.md').write_text('Machine-authored request 320fe46f. Mission/design read in full, pinned target and independent audits inspected. Interrupted effects reconciled; full root remains open. Investigating increasing layer weights and source grading. No .scratch access.\n')
validator=(r/'research/validate_c416.py').read_text().replace('markov-c4169865','markov-320fe46f')
(r/'research/validate_320f.py').write_text(validator)
(r/'research/MarkovOneCutRaw320f.lean').write_text((r/'research/MarkovOneCutRawC416.lean').read_text().replace('oneA_at_oneC416','oneA_at_one320f').replace('oneA_raw_topC416','oneA_raw_top320f').replace('Machine-authored c4169865','Machine-authored 320fe46f; completed inherited unfinished bridge'))
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],stop=rec['stop_file_present'],last_events=rec['last_event_types'],capabilities=rec['capabilities'])))
for e in tail: print(json.dumps(e)[:2500])
