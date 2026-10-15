"""Machine-authored live research: reconcile preserved worker 108 effects."""
from pathlib import Path
import json,hashlib,shutil,importlib.util
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0a5fcabe';O.mkdir();(R/'research/work-0a5fcabe').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
w=R/'.control/markov/workers/000108'; rec=json.loads((w/'receipt.json').read_text())
checks={k:dict(expected=v['after'],actual=sha(R/k)) for k,v in rec['changes'].items() if v['after'] is not None}
assert all(v['actual']==v['expected'] for v in checks.values())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for k,v in inh.items():assert sha(R/k)==v['sha256']==hashlib.sha256(v['content'].encode()).hexdigest()
ev=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]; started={};done={}
for e in ev:
 i=e.get('item',{})
 if i.get('type')=='command_execution':(done if e['type']=='item.completed' else started)[i['id']]=i
pending={k:v for k,v in started.items() if k not in done}
old=R/'evidence/markov-38ebef17'
result=dict(predecessor_outcome=rec['outcome'],checks=checks,inherited_index_verified=True,raw_event_count=len(ev),unfinished_commands=pending,last_events=ev[-8:],finding='Preserved worker 108 artifacts checked before reuse. Numeric residual timed out and remains unaccepted. All-run fourth-slice and five-family classification have recorded replay receipts. New action will simplify numeric residual proof and investigate actual small-cycle source corrections.',completion=None)
(O/'reconciliation.json').write_text(json.dumps(result,indent=2)+'\n')
paths=set(checks)|set(inh)|set(json.loads((old/'initial-hashes.json').read_text()))|{'MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lakefile.toml','lake-manifest.json','lean-toolchain'}
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in sorted(paths)},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python='/opt/homebrew/bin/python3',sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Higher-priority policy denies .scratch; using research/work-0a5fcabe without accessing it.',heredoc='zsh heredoc failed to create temporary file; switched to apply_patch'),indent=2)+'\n')
(R/'research/markov-0a5fcabe-checkpoint.md').write_text('# Request 0a5fcabe\n\nMachine-authored live research. Root unresolved. Reconciled all worker 108 changed artifact hashes and raw events. Preserving prior effects; no old generators replayed. New action: close numeric residual assembly, then investigate the small predecessor cycles using exact source recurrence.\n')
print(json.dumps(dict(verified=len(checks),events=len(ev),unfinished=[v['command'] for v in pending.values()],last_events=ev[-3:]),indent=2))
