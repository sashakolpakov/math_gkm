"""Machine-authored reconciliation for request be07ef751cf4477697c81b1e02c1e531."""
import pathlib,json,hashlib,datetime,os
r=pathlib.Path('/Users/sasha/math_gkm'); out=r/'evidence/markov-be07ef75'; out.mkdir(exist_ok=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=json.loads((r/'.control/markov/workers/000044/receipt.json').read_text())
checks={p:sha(r/p)==v['after'] for p,v in prior['changes'].items() if p.startswith(('research/','evidence/'))}
contract=json.loads((r/'.control/markov/contract.json').read_text())
record=dict(request_id='be07ef751cf4477697c81b1e02c1e531',time=datetime.datetime.now(datetime.timezone.utc).isoformat(),
 predecessor_outcome=prior['outcome'],predecessor_files_match=checks,
 root_sha256=sha(r/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 reconciliation='Immediate predecessor completed with all final receipts. Earlier interrupted generations were reconciled in its ancestry; no side effects replayed.',
 operational=['Shell heredoc failed before execution because shell temporary directory is denied. Python files and -c used instead.','.scratch denied by higher-priority permission policy; no access attempted. New research/evidence paths used.','No applicable AGENTS.md found in non-protected project search.'])
(out/'reconciliation.json').write_text(json.dumps(record,indent=2)+'\n')
prior_run=json.loads((r/'evidence/markov-863a7482/run-1791998843265031000.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(prior_run['lean_path']))
print(json.dumps(record,indent=2))
