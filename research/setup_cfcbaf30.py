"""Machine-authored live research, request cfcbaf3000504d5c976b56c4302db280."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-cfcbaf30'; O.mkdir()
(R/'research/work-cfcbaf30').mkdir()
sha=lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
w=R/'.control/markov/workers/000109'; rec=json.loads((w/'receipt.json').read_text())
checks={k:dict(expected=v['after'],actual=sha(R/k)) for k,v in rec['changes'].items() if v['after'] is not None}
assert all(v['expected']==v['actual'] for v in checks.values())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for k,v in inh.items(): assert sha(R/k)==v['sha256']==hashlib.sha256(v['content'].encode()).hexdigest()
ev=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]
started={}; done={}
for e in ev:
 i=e.get('item',{})
 if i.get('type')=='command_execution': (done if e['type']=='item.completed' else started)[i['id']]=i
pending={k:v for k,v in started.items() if k not in done}
(O/'reconciliation.json').write_text(json.dumps(dict(predecessor_outcome=rec['outcome'],checks=checks,inherited_verified=True,raw_event_count=len(ev),unfinished_commands=pending,last_events=ev[-3:],finding='Worker 109 completed. Its reconciliation of interrupted worker 108 and all current changed bytes checked. No inherited generator or side effect replayed.',completion=None),indent=2)+'\n')
paths=set(checks)|set(inh)|set(json.loads((R/'evidence/markov-0a5fcabe/initial-hashes.json').read_text()))|{'MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lakefile.toml','lake-manifest.json','lean-toolchain'}
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in sorted(paths)},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-0a5fcabe')+':'+json.loads((R/'evidence/markov-0a5fcabe/inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python='/opt/homebrew/bin/python3',sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Higher-priority denied path; never accessed; work under research/work-cfcbaf30.',source='Hosted retrieval succeeded for published source on 2026-10-15.'),indent=2)+'\n')
(R/'research/markov-cfcbaf30-checkpoint.md').write_text('# Request cfcbaf30\n\nMachine-authored live experimental research. Full pinned root unresolved. Read mission/design and independent audits. Reconciled worker 109 preserved effects against receipt and raw events; inherited index verified. New action: investigate exact small-cycle fourth-slice inequalities. No controller changes.\n')
print(json.dumps(dict(verified=len(checks),events=len(ev),unfinished=list(pending),outcome=rec['outcome'])))
