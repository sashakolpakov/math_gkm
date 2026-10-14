"""Machine-authored request 77c26ca3420f4eb0bd2b89f7946d1a23."""
import pathlib,json,hashlib,datetime
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-77c26ca3';o.mkdir(exist_ok=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=json.loads((r/'.control/markov/workers/000045/receipt.json').read_text())
checks={p:sha(r/p)==v['after'] for p,v in prior['changes'].items() if p.startswith(('research/','evidence/'))}
c=json.loads((r/'.control/markov/contract.json').read_text())
rec=dict(request_id='77c26ca3420f4eb0bd2b89f7946d1a23',time=datetime.datetime.now(datetime.timezone.utc).isoformat(),predecessor_outcome=prior['outcome'],predecessor_files_match=checks,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest(),reconciliation='Immediate predecessor completed. Its changed research/evidence files were checked against receipt hashes; no side effects replayed. Earlier interruptions were reconciled by completed successors.',capability_notes=['Higher-priority policy denies .scratch; new research/evidence paths used.','Two guessed inherited module filenames did not exist; located actual names by rg.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
v=json.loads((r/'evidence/markov-be07ef75/validation.json').read_text())
run=json.loads((r/v['modules'][0]['build']).read_text())
(o/'inherited-lean-path.json').write_text(json.dumps(run['lean_path']))
print(json.dumps({k:v for k,v in rec.items() if k!='predecessor_files_match'},indent=2));print('checked predecessor files',len(checks),'all match',all(checks.values()))
