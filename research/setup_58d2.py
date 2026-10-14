"""Machine-authored request 58d2f4111d4e480ca66e64acbf12e225."""
import pathlib,json,hashlib,datetime,shutil
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-58d2f411';o.mkdir(exist_ok=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=json.loads((r/'.control/markov/workers/000047/receipt.json').read_text())
checks={p:sha(r/p)==v['after'] for p,v in prior['changes'].items() if p.startswith(('research/','evidence/'))}
inh=json.loads((r/'.control/markov/inherited.json').read_text())
c=json.loads((r/'.control/markov/contract.json').read_text())
rec=dict(request_id='58d2f4111d4e480ca66e64acbf12e225',time=datetime.datetime.now(datetime.timezone.utc).isoformat(),predecessor_outcome=prior['outcome'],predecessor_hash_checks=checks,inherited_checks={k:sha(r/k)==v['sha256'] for k,v in inh.items()},root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest(),reconciliation='Immediate predecessor completed. No side effect replayed. Earlier timeout reconciled by completed successors.',capability_notes=['Higher-priority policy prohibits .scratch access; new durable research/evidence paths used.','Initial reads of guessed predecessor script names failed; located actual scripts with rg.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
v=json.loads((r/'evidence/markov-5c90b506/validation.json').read_text());run=json.loads((r/v['modules'][0]['build']).read_text())
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-5c90b506')+':'+run['lean_path']))
src=(r/'research/validate_5c90.py').read_text().replace('markov-5c90b506','markov-58d2f411')
(r/'research/validate_58d2.py').write_text(src)
(o/'capabilities.json').write_text(json.dumps({k:shutil.which(k,path='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin') for k in ['sage','gap','lake','lean','python3']},indent=2)+'\n')
print(json.dumps(dict(outcome=rec['predecessor_outcome'],checks=len(checks),all_match=all(checks.values()),root=rec['root_sha256'])))
