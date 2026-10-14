"""Machine-authored live research, request e27336bcd7374c768840a75b2276fcb8."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
out=Path('evidence/markov-e27336bc');out.mkdir(exist_ok=False)
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
old=json.loads(Path('evidence/markov-446bbcdc/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
inherited=json.loads(Path('.control/markov/inherited.json').read_text())
ic=[dict(path=p,match=sha(p)==v['sha256']) for p,v in inherited.items()]
events=Path('.control/markov/workers/000053/events.jsonl')
tail=[json.loads(x) for x in events.read_text().splitlines()[-8:]]
contract=json.loads(Path('.control/markov/contract.json').read_text())
rec=dict(request_id='e27336bcd7374c768840a75b2276fcb8',checks=checks,inherited_checks=ic,event_tail=tail,root_sha256=sha('MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),resolution='Immediate predecessor completed. Its raw event tail ends with artifact verification and final report. Earlier interrupted effects were reconciled by predecessors; no side effect replayed. All predecessor artifacts preserved.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(Path('evidence/markov-446bbcdc').resolve())+':'+json.loads(Path('evidence/markov-446bbcdc/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by developer permissions; research/evidence used instead',shell_heredoc='Failed to create temporary file; use apply_patch and Python -c'),indent=2))
v=Path('research/validate_446b.py').read_text().replace('markov-446bbcdc','markov-e27336bc')
Path('research/validate_e273.py').write_text(v)
Path('research/markov-e27336bc-checkpoint.md').write_text('Machine-authored request e27336bcd7374c768840a75b2276fcb8.\nRead MISSION and DESIGN completely, pinned root, inherited index, target and residual audits, full mathematical audit, latest report and artifacts. Root unresolved. Next: derive cleared rational kernels for arbitrary-run second-slice coefficients, while seeking fully bridged source inequalities. No controller edits or new axioms.\n')
print(dict(checks=len(checks),mismatches=[x for x in checks if not x['match']],inherited=ic))
