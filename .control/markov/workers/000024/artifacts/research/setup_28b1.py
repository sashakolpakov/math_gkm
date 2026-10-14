"""Machine-authored reconciliation and evidence setup; no controller mutation."""
import pathlib,json,hashlib,time
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-28b112de';o.mkdir(exist_ok=True)
(r/'research/markov-28b112de-tmp').mkdir(exist_ok=True)
old=r/'evidence/markov-05ef7fab'
manifest=json.loads((old/'validation.json').read_text()); records=[]
for item in manifest['modules']:
 p=r/item['source']; sha=hashlib.sha256(p.read_bytes()).hexdigest()
 runs=[]
 for q in sorted(old.glob('run-*.json')):
  j=json.loads(q.read_text())
  if j['source']==item['source'] and j['sha256']==sha:
   runs.append(dict(path=str(q.relative_to(r)),returncode=j.get('returncode'),timeout=j.get('timeout',False),command=j['command']))
 records.append(dict(module=item['module'],source=item['source'],sha256=sha,manifest_hash_matches=sha==item['sha256'],manifest_status=item['status'],matching_runs=runs))
events=r/'.control/markov/workers/000023/events.jsonl'
tail=[json.loads(x) for x in events.read_text().splitlines()[-12:]]
rec=dict(request_id='28b112de527c4d3ea1fa665cec2dc394',previous_worker='05ef7fab4f78419f9b5c3aa251540484',modules=records,
 raw_event_log=str(events.relative_to(r)),raw_event_log_sha256=hashlib.sha256(events.read_bytes()).hexdigest(),
 tail=[dict(type=x['type'],id=x.get('item',{}).get('id'),command=x.get('item',{}).get('command'),exit_code=x.get('item',{}).get('exit_code')) for x in tail],
 reconciliation=['Sixth diagonal modules built and replayed; do not repeat their already completed finite proof.',
 'HorizontalSource05ef kernel replay completed after manifest generation; manifest compiled-only status is stale.',
 'HorizontalTwo05ef was rejected; no accepted theorem from this draft.',
 'Entire second horizontal result already exists in MarkovSecondHorizontal8934; new 05ef jet duplicated earlier work. Abandon duplicate repair.',
 'No side effects replayed and no earlier artifacts edited.'],
 root_sha256=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest())
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(root=rec['root_sha256'],records=len(records))))
