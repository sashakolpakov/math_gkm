"""Machine-authored request 5c90b5063976426b9c5577badcc55c00. Read-only reconciliation."""
import pathlib,json,hashlib,datetime,os,shutil
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-5c90b506';o.mkdir(exist_ok=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=json.loads((r/'.control/markov/workers/000046/receipt.json').read_text())
checks={p:sha(r/p)==v['after'] for p,v in prior['changes'].items() if p.startswith(('research/','evidence/'))}
c=json.loads((r/'.control/markov/contract.json').read_text())
inherited=json.loads((r/'.control/markov/inherited.json').read_text())
ih={k:dict(recorded=v['sha256'],actual=sha(r/k),matches=sha(r/k)==v['sha256']) for k,v in inherited.items()}
rec=dict(request_id='5c90b5063976426b9c5577badcc55c00',time=datetime.datetime.now(datetime.timezone.utc).isoformat(),predecessor_outcome=prior['outcome'],predecessor_files_match=checks,inherited_index_hashes=ih,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest(),reconciliation='Immediate predecessor completed; changed research/evidence files checked against receipt. No interrupted side effect replayed. Earlier timeout was reconciled by completed successors.',capability_notes=['Higher-priority policy denies .scratch reads; durable research/evidence paths used.','Shell here-document failed because its temporary file could not be created. No file side effect occurred.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
v=json.loads((r/'evidence/markov-77c26ca3/validation.json').read_text())
run=json.loads((r/v['modules'][0]['build']).read_text())
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-77c26ca3')+':'+run['lean_path']))
caps={k:shutil.which(k,path='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin') for k in ['sage','gap','lake','lean','python3']}
(o/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps(dict(predecessor_outcome=rec['predecessor_outcome'],checks=len(checks),all_match=all(checks.values()),root=rec['root_sha256'],contract=rec['contract_canonical_sha256'],capabilities=caps)))
