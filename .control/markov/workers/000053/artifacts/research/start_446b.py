"""Machine-authored live request 446bbcdc58554542b733c6d1dac376bf."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
out=Path('evidence/markov-446bbcdc');out.mkdir(exist_ok=False)
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
old=json.loads(Path('evidence/markov-bf38fa19/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
inherited=json.loads(Path('.control/markov/inherited.json').read_text())
ic=[dict(path=p,match=sha(p)==v['sha256']) for p,v in inherited.items()]
contract=json.loads(Path('.control/markov/contract.json').read_text())
events=Path('.control/markov/workers/000052/events.jsonl')
tail=events.read_text().splitlines()[-8:] if events.exists() else []
rec=dict(request_id='446bbcdc58554542b733c6d1dac376bf',checks=checks,inherited_checks=ic,event_tail=[json.loads(x) for x in tail],root_sha256=sha('MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),resolution='Immediate predecessor completed; all recorded artifacts checked. Earlier interrupted effects were reconciled by predecessor; preserved without replay. New work targets source cyclic adjacency statistics.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(Path('evidence/markov-bf38fa19').resolve())+':'+json.loads(Path('evidence/markov-bf38fa19/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by developer permissions; research/evidence used instead',shell_heredoc='Failed: shell could not create temporary file; use patch and Python -c'),indent=2))
print(dict(checks=len(checks),mismatches=[x for x in checks if not x['match']],inherited_checks=ic,event_tail_count=len(tail)))
