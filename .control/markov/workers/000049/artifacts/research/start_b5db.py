"""Machine-authored interruption reconciliation for b5dbe087."""
import json,pathlib,hashlib,shutil,importlib.util
o=pathlib.Path('evidence/markov-b5dbe087');o.mkdir(exist_ok=False)
v=json.loads(pathlib.Path('evidence/markov-58d2f411/validation.json').read_text());rows=[]
for m in v['modules']:
 for p,h in [(m['source'],m['sha256']),('evidence/markov-58d2f411/'+m['module']+'.olean',m['olean_sha256'])]:
  actual=hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest();rows.append(dict(path=p,expected=h,actual=actual,match=h==actual))
 for mode in ['build','replay']:
  z=json.loads(pathlib.Path(m[mode]).read_text());assert z['returncode']==0
raw=pathlib.Path('.control/markov/workers/000048/events.jsonl');events=[json.loads(l) for l in raw.read_text().splitlines()]
started={e['item']['id'] for e in events if e['type']=='item.started'};ended={e['item']['id'] for e in events if e['type']=='item.completed'}
r=dict(request_id='b5dbe087bddc41aaa420318d5cb776a1',predecessor='58d2f4111d4e480ca66e64acbf12e225',hash_checks=rows,raw_event_hash=hashlib.sha256(raw.read_bytes()).hexdigest(),unfinished_event_ids=sorted(started-ended),resolution='Predecessor timed out after saving final report and all five successful kernel replay receipts. No predecessor side effects replayed.',root_sha256=hashlib.sha256(pathlib.Path('MathGKM/Markov.lean').read_bytes()).hexdigest(),inherited_sha256=hashlib.sha256(pathlib.Path('.control/markov/inherited.json').read_bytes()).hexdigest())
(o/'reconciliation.json').write_text(json.dumps(r,indent=2)+'\n')
x=json.loads(pathlib.Path('.control/markov/inherited.json').read_text());print('Inherited keys',list(x));print('STOP',pathlib.Path('.control/markov/STOP.json').exists());print('Hash matches',all(x['match'] for x in rows),'unfinished',r['unfinished_event_ids'])
print('Inherited index',json.dumps({k:v for k,v in x.items() if k!='files'},indent=2)[:5000])
(o/'capabilities.json').write_text(json.dumps({**{k:shutil.which(k) for k in ['sage','gap','lake','lean','python3']},'sympy':importlib.util.find_spec('sympy') is not None,'heredoc_failure':'zsh cannot create temporary here-document file under permissions; no file created; switched to apply_patch','scratch':'Denied by higher-priority permissions; using durable unique evidence paths'},indent=2)+'\n')
pathlib.Path('research/markov-b5dbe087-checkpoint.md').write_text('# Research checkpoint\n\nMachine-authored request b5dbe087bddc41aaa420318d5cb776a1.\nRead mission, design, pinned root, inherited index and independent target/scope/math audits. Reconciled interrupted predecessor final sources and replay receipts without replaying side effects. Full root remains unresolved.\nNext: investigate vertical top-crossing raw inequality via exact source three-layer formulas, then consider a global transfer invariant. No stronger vertical normalization is presumed. Higher-priority permissions deny .scratch; use unique durable research/evidence files.\n')
old=json.loads(pathlib.Path('evidence/markov-58d2f411/inherited-lean-path.json').read_text())
(o/'inherited-lean-path.json').write_text(json.dumps(str(pathlib.Path('evidence/markov-58d2f411').resolve())+':'+old))
src=pathlib.Path('research/validate_58d2.py').read_text().replace('markov-58d2f411','markov-b5dbe087')
pathlib.Path('research/validate_b5db.py').write_text(src)
