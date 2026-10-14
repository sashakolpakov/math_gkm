"""Machine-authored live request 7d80a785cc54418dbc60c87975360f76."""
from pathlib import Path
import json,hashlib,shutil,importlib.util
out=Path('evidence/markov-7d80a785');out.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
old=json.loads(Path('evidence/markov-7955df0c/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
inh=json.loads(Path('.control/markov/inherited.json').read_text())
ic=[dict(path=p,match=sha(p)==v['sha256']) for p,v in inh.items()]
events=[json.loads(x) for x in Path('.control/markov/workers/000056/events.jsonl').read_text().splitlines()]
contract=json.loads(Path('.control/markov/contract.json').read_text())
rec=dict(request_id='7d80a785cc54418dbc60c87975360f76',checks=checks,inherited_checks=ic,event_count=len(events),event_tail=events[-5:],root_sha256=sha('MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),resolution='Final report and artifact manifest exist. Six modules compiled, three separate replays succeeded, three timed out. No mutation replayed; all previous evidence preserved.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(Path('evidence/markov-7955df0c').resolve())+':'+json.loads(Path('evidence/markov-7955df0c/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
Path('research/validate_7d80.py').write_text(Path('research/validate_7955.py').read_text().replace('markov-7955df0c','markov-7d80a785'))
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Higher-priority developer denies .scratch; durable research/evidence used.'),indent=2))
Path('research/markov-7d80a785-checkpoint.md').write_text('Machine-authored 7d80a785. Read MISSION, DESIGN and independent target/residual/mathematical audits. Reconciled interrupted predecessor raw event log and artifacts. Exact root unresolved. Selected next action: prove vertical fourth-to-second upper-layer inequality, first for numerator at least four, retaining actual switch statistic and all raw zero coefficients. No controller changes.\n')
print(json.dumps(dict(checks=len(checks),mismatches=[x for x in checks if not x['match']],inherited=ic,event_tail=events[-2:]),indent=2))
