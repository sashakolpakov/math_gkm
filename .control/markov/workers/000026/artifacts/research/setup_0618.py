"""Machine-authored request 061840e8; evidence setup, no controller mutations."""
import pathlib,json,hashlib,shutil
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-061840e8';o.mkdir(exist_ok=True)
(r/'research/markov-061840e8-tmp').mkdir(exist_ok=True)
prior=json.loads((r/'evidence/markov-3edac4bf/validation.json').read_text())
checks=[]
for m in prior['modules']:
 p=r/m['source'];checks.append(dict(source=m['source'],hash_matches=hashlib.sha256(p.read_bytes()).hexdigest()==m['sha256'],status=m['status']))
events=r/'.control/markov/workers/000023/events.jsonl'
tail=[json.loads(x) for x in events.read_text().splitlines()[-12:]]
record=dict(request_id='061840e8bcb9466891906a9db3f46cc3',prior_modules=checks,
 interrupted_log_sha256=hashlib.sha256(events.read_bytes()).hexdigest(),
 event_tail=[dict(type=x['type'],id=x.get('item',{}).get('id'),exit_code=x.get('item',{}).get('exit_code')) for x in tail],
 reconciliation=['Latest worker completed; all seven source hashes checked against its manifest.',
 'Earlier interrupted 05ef effects were reconciled by 28b1 and 3eda. Raw event tail re-read. No side effect replayed.',
 'Sixth diagonal completed; rejected duplicate HorizontalTwo05ef left untouched.'],
 root_sha256=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest(),
 capabilities={x:shutil.which(x) for x in ['sage','gap','lean','lake']},
 limitations=['System denies .scratch access; use unique research temporary directory.',
 'Initial shell heredoc failed creating a temporary file; use explicit Python files.',
 'Hosted arXiv HTML version 2212.04561v3 retrieval returned Internal Error.'])
(o/'reconciliation.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
