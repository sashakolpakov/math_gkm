"""Machine-authored request 0d052acbcc6844ae8cbc5f5d5f8e5a55; reconciliation only."""
from pathlib import Path
import json,hashlib,shutil,importlib.util
out=Path('evidence/markov-0d052acb');out.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
old=json.loads(Path('evidence/markov-e27336bc/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
inh=json.loads(Path('.control/markov/inherited.json').read_text())
ic=[dict(path=p,match=sha(p)==v['sha256']) for p,v in inh.items()]
ev=Path('.control/markov/workers/000054/events.jsonl')
events=[json.loads(x) for x in ev.read_text().splitlines()]
contract=json.loads(Path('.control/markov/contract.json').read_text())
rec=dict(request_id='0d052acbcc6844ae8cbc5f5d5f8e5a55',checks=checks,inherited_checks=ic,event_count=len(events),event_tail=events[-8:],root_sha256=sha('MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),resolution='Predecessor transport timed out after its finalizer and hash verification completed. Nine modules compiled; six direct replay successes, three replay timeouts. No unfinished mutation found in event tail. Existing artifacts preserved; no side effect replayed.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(Path('evidence/markov-e27336bc').resolve())+':'+json.loads(Path('evidence/markov-e27336bc/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Developer denies reads; use research/evidence for auditable working artifacts.'),indent=2))
Path('research/validate_0d052.py').write_text(Path('research/validate_e273.py').read_text().replace('markov-e27336bc','markov-0d052acb'))
Path('research/markov-0d052acb-checkpoint.md').write_text('Machine-authored live request 0d052acbcc6844ae8cbc5f5d5f8e5a55. Read MISSION and DESIGN completely, inherited index, pinned root, target and residual audits and independent mathematical review. Reconciled interrupted predecessor via full raw event parsing and artifact hashes. Next action: certify transition inequalities directly from checked sparse coefficient formula. Root unresolved. No protected inputs changed.\n')
print(dict(checks=len(checks),mismatches=[x for x in checks if not x['match']],inherited=ic))
