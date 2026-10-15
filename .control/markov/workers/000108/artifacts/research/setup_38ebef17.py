"""Machine-authored request 38ebef17: interrupted-run reconciliation, no replay."""
from pathlib import Path
import json,hashlib,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-38ebef17'
O.mkdir(); (R/'research/work-38ebef17').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
w=R/'.control/markov/workers/000107'; receipt=json.loads((w/'receipt.json').read_text())
checks={k:dict(expected=v['after'],actual=sha(R/k)) for k,v in receipt['changes'].items() if v['after'] is not None}
assert all(v['expected']==v['actual'] for v in checks.values())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for k,v in inh.items(): assert sha(R/k)==v['sha256']==hashlib.sha256(v['content'].encode()).hexdigest()
events=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]
started={}; completed={}
for e in events:
 i=e.get('item',{})
 if i.get('type')=='command_execution':
  (completed if e['type']=='item.completed' else started)[i['id']]=i
pending={k:v for k,v in started.items() if k not in completed}
old=R/'evidence/markov-8b851864';runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in old.glob('run-*.json')]
good=[x for x in runs if x.get('returncode')==0 and x.get('mode')=='build' and sha(R/x['source'])==x['sha256']]
unions=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in old.glob('kernel-union-*.json')]
result=dict(predecessor_outcome=receipt['outcome'],checks=checks,inherited_index_verified=True,raw_event_count=len(events),unfinished_commands=pending,last_events=events[-8:],successful_builds=[x['source'] for x in good],union_receipts=unions,finding='Worker 107 timed out after the full n>=4 fourth-slice assembly compiled. Its final inventory and residual-four build did not finish. Preserve completed files; new audit and residual assembly use unique paths. No old generator replayed.',completion=None)
(O/'reconciliation.json').write_text(json.dumps(result,indent=2)+'\n')
paths=set(checks)|set(inh)|set(json.loads((old/'initial-hashes.json').read_text()))|{'MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lakefile.toml','lake-manifest.json','lean-toolchain'}
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in sorted(paths)},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python='/opt/homebrew/bin/python3',sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority sandbox; research/work-38ebef17 used without accessing .scratch'),indent=2)+'\n')
(R/'research/markov-38ebef17-checkpoint.md').write_text('# Request 38ebef17\n\nMachine-authored live research. Exact pinned root unresolved. Reconciled worker 107 timeout against its raw events and all changed artifact hashes. The n>=4 full fourth-slice assembly compiled before timeout; final residual and inventory did not complete. New action: validate preserved effects, then investigate the remaining n=3 slice using exact source windows.\n')
print(json.dumps(dict(verified=len(checks),successful_builds=len(good),unfinished_commands=[v['command'] for v in pending.values()],union_receipts=len(unions))))
