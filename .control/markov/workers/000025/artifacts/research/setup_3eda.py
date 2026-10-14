"""Machine-authored request 3edac4bf: setup and inherited-effect reconciliation."""
import pathlib,json,hashlib,shutil
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-3edac4bf';o.mkdir(exist_ok=True)
(r/'research/markov-3edac4bf-tmp').mkdir(exist_ok=True)
prior=json.loads((r/'evidence/markov-28b112de/validation.json').read_text())
events=r/'.control/markov/workers/000023/events.jsonl'
tail=[json.loads(x) for x in events.read_text().splitlines()[-12:]]
rec=dict(request_id='3edac4bf4f1040d0b967711f6c52c66f',prior_validation=prior,
 interrupted_event_log_sha256=hashlib.sha256(events.read_bytes()).hexdigest(),
 event_tail=[dict(type=x.get('type'),id=x.get('item',{}).get('id'),exit_code=x.get('item',{}).get('exit_code')) for x in tail],
 reconciliation=['Latest worker completed; no new interruption to replay.',
 'Earlier 05ef interruption was reconciled in evidence/markov-28b112de/reconciliation.json; raw event tail inspected again.',
 'Sixth diagonal and structural word results already completed. HorizontalTwo05ef remains rejected duplicate; untouched.'],
 root_sha256=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest(),
 capabilities={s:shutil.which(s) for s in ['sage','gap','lean','lake']},
 limitations=['System denies .scratch reads; use unique research temporary directory instead.',
 'Initial zsh heredoc failed because default temporary location is denied; use Python files or -c.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps({k:v for k,v in rec.items() if k!='prior_validation'}))
