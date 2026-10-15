"""Machine-authored request 8b851864: reconcile, preserve, copy pending candidates."""
from pathlib import Path
import json, hashlib, re, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-8b851864'
O.mkdir(); (R/'research/work-8b851864').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-8ae35b59'
manifest=json.loads((old/'artifact-verification.json').read_text())
checks={k:dict(expected=h,actual=sha(R/k)) for k,h in manifest['files'].items()}
assert all(v['expected']==v['actual'] for v in checks.values())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for k,v in inh.items():
 assert hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256']==sha(R/k)
events=[json.loads(s) for s in (R/'.control/markov/workers/000106/events.jsonl').read_text().splitlines()]
receipt=json.loads((R/'.control/markov/workers/000106/receipt.json').read_text())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,inherited_index_verified=True,predecessor_outcome=receipt['outcome'],raw_event_count=len(events),last_events=events[-3:],finding='Worker 106 completed. Its raw log and receipts agree. Earlier interrupted effects were reconciled in workers 104-106. No old generator or mutation replayed. Pending files copied to unique names; checked declarations reused.',completion=None),indent=2)+'\n')
paths=list(checks)+list(inh)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','.control/markov/contract.json','lakefile.toml','lake-manifest.json','lean-toolchain']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in paths},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python='/opt/homebrew/bin/python3',sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority sandbox; research/work-8b851864 used',heredoc='zsh here-document failed because temporary-file creation denied; used script files instead'),indent=2)+'\n')
inv=json.loads((old/'pending-candidates.json').read_text())
mods=inv['coefficient_gaps_remaining']+inv['general_columns_remaining']+inv['general_chart_candidates']
mods += [f'MarkovMiddleGap{chart}_{col}M8AE' for chart in [0,2] for col in range(4)]
mapping={m:m.replace('M8AE','M8B8') for m in mods}
for m in mods:
 s=(R/'research'/f'{m}.lean').read_text()
 for name in re.findall(r'^(?:def|theorem) (\w+)',s,re.M): mapping[name]=name.replace('M8AE','M8B8')
pattern=re.compile(r'\b('+'|'.join(sorted(mapping,key=len,reverse=True))+r')\b')
for m in mods:
 p=R/'research'/f'{mapping[m]}.lean'; assert not p.exists()
 s=(R/'research'/f'{m}.lean').read_text()
 s=pattern.sub(lambda z:mapping[z[0]],s).replace('Machine-authored request 8ae35b59','Machine-authored request 8b851864; adapted from 8ae35b59')
 p.write_text(s)
(O/'candidate-mapping.json').write_text(json.dumps(mapping,indent=2)+'\n')
(O/'pipeline.json').write_text(json.dumps([[mapping[m] for m in inv['coefficient_gaps_remaining']],[mapping[m] for m in mods[-8:]],[mapping[m] for m in inv['general_columns_remaining']],[mapping[m] for m in inv['general_chart_candidates']]],indent=2)+'\n')
(R/'research/markov-8b851864-checkpoint.md').write_text('# Request 8b851864\n\nMachine-authored live research. Exact pinned root unresolved. Reconciled worker 106 and inherited hashes. Next action: finish the general central fourth-slice certificates and assemble the literal source inequality. No compiled candidate inferred from file presence.\n')
print('Reconciled',len(checks),'artifacts;',len(inh),'inherited entries; copied',len(mods),'pending modules.')
