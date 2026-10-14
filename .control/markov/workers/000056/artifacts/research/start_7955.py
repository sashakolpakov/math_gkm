"""Machine-authored live request 7955df0c4dc1407e99579ba90e1017ab."""
from pathlib import Path
import json,hashlib,shutil,importlib.util
out=Path('evidence/markov-7955df0c');out.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
old=json.loads(Path('evidence/markov-0d052acb/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
inh=json.loads(Path('.control/markov/inherited.json').read_text())
ic=[dict(path=p,match=sha(p)==v['sha256']) for p,v in inh.items()]
events=[json.loads(x) for x in Path('.control/markov/workers/000055/events.jsonl').read_text().splitlines()]
contract=json.loads(Path('.control/markov/contract.json').read_text())
rec=dict(request_id='7955df0c4dc1407e99579ba90e1017ab',checks=checks,inherited_checks=ic,event_count=len(events),event_tail=events[-6:],root_sha256=sha('MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),resolution='Predecessor finalization completed before transport timeout. Seven modules compiled; six direct replays succeeded; residual equivalence direct replay timed out. All final records preserved; no predecessor mutation replayed.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(Path('evidence/markov-0d052acb').resolve())+':'+json.loads(Path('evidence/markov-0d052acb/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Developer denies access; durable research and evidence artifacts used.',heredoc='Initial shell heredoc creation failed: cannot create temp file; switched to apply_patch.'),indent=2))
Path('research/validate_7955.py').write_text(Path('research/validate_0d052.py').read_text().replace('markov-0d052acb','markov-7955df0c'))
Path('research/markov-7955df0c-checkpoint.md').write_text('Machine-authored request 7955df0c4dc1407e99579ba90e1017ab. MISSION, DESIGN, independent target/residual/mathematical audits read fully. Interrupted predecessor reconciled via all artifact hashes and raw event log. The full pinned root remains unresolved. New action: investigate ambient horizontal weighted inequality and source-preserved invariants; do not redo completed second-slice proof. Developer forbids .scratch access; durable files live in research and evidence.\n')
print(json.dumps(dict(checks=len(checks),mismatches=[x for x in checks if not x['match']],inherited=ic,event_tail=events[-2:]),indent=2))
