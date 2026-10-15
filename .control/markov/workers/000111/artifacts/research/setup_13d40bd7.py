"""Machine-authored request 13d40bd7: read-only reconciliation, new evidence only."""
from pathlib import Path
import json, hashlib, os, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-13d40bd7'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=R/'.control/markov/workers/000110'
receipt=json.loads((prior/'receipt.json').read_text())
checks={k:dict(expected=v['after'],actual=sha(R/k) if (R/k).is_file() else None) for k,v in receipt['changes'].items()}
assert all(v['expected']==v['actual'] for v in checks.values())
events=[json.loads(s) for s in (prior/'events.jsonl').read_text().splitlines()]
started={e['item']['id']:e['item'] for e in events if e.get('type')=='item.started'}
ended={e['item']['id']:e['item'] for e in events if e.get('type')=='item.completed'}
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
assert all(v['expected']==v['actual'] for v in ic.values())
reconciliation=dict(request_id='13d40bd782864d0cb2e83d9cc50be607',prior_worker=110,changes=checks,inherited=ic,event_count=len(events),unfinished=[v for k,v in started.items() if k not in ended],failed_commands=[v for v in ended.values() if v.get('type')=='command_execution' and v.get('exit_code') not in (0,None)],finding='Prior final inventory is stale: later successful compilation/audit/replay receipts exist. Second union replay was interrupted; no successful outcome is inferred. Existing generators and finalizer are not replayed.',raw_log_sha256=sha(prior/'events.jsonl'))
(O/'reconciliation.json').write_text(json.dumps(reconciliation,indent=2)+'\n')
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']+list((R/'research').glob('*.lean'))+list((R/'research').glob('*.md'))
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
lp=str(R/'evidence/markov-cfcbaf30')+':'+json.loads((R/'evidence/markov-cfcbaf30/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=shutil.which('python3'),sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by higher-priority policy; not accessed. Persistent attempt files go in evidence and research.',heredoc='zsh heredoc failed attempting a forbidden temporary file; switched to file-edit tool.'),indent=2)+'\n')
print(json.dumps(dict(changes=len(checks),events=len(events),unfinished=len(reconciliation['unfinished']),inputs=len(files))))
