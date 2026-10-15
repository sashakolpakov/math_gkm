"""Machine-authored request e2cd486cc57d40438212692fe73d38ca; reconciliation."""
from pathlib import Path
import json,hashlib,os,shutil,importlib.util,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-e2cd486c';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for p,h in json.loads((R/'evidence/markov-53d5229e/artifacts.json').read_text())['hashes'].items():checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
assert all(d['expected']==d['actual'] for d in checks)
events=[]
for n in ['000077','000078','000079','000080','000081']:
 p=R/'.control/markov/workers'/n/'events.jsonl';ev=[json.loads(l) for l in p.read_text().splitlines()]
 starts={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.started'};ends={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.completed'}
 events.append(dict(worker=n,sha256=sha(p),events=len(ev),pending={k:v for k,v in starts.items() if k not in ends},last_events=ev[-4:]))
(O/'predecessor-events.json').write_text(json.dumps(events,indent=2)+'\n')
P=R/'evidence/markov-53d5229e'
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
old={str(p.relative_to(R)):sha(p) for p in list(P.glob('*'))+list((R/'research').glob('*53D*'))+list((R/'research').glob('*53d522*')) if p.is_file()}
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,pins=pins,inherited=old,stop_file_present=(R/'.control/markov/STOP.json').exists(),reconciliation='Worker 81 audit replay and finalizer completed in raw events; its timeout did not erase completed outputs. Existing artifacts verified without replaying side effects. Workers 77–80 retained in prior reconciliation; raw last events and pending operations examined.'),indent=2)+'\n')
lp=str(P)+':'+json.loads((P/'inherited-lean-path.json').read_text());(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(R/'research/validate_e2cd486c.py').write_text((R/'research/validate_53d5229e.py').read_text().replace('markov-53d5229e','markov-e2cd486c'))
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,python=sys.version,limitations=['Scratch path denied; unique persistent research/evidence used.','Shell heredoc failed because its implicit temporary-file creation is denied. apply_patch used.','Shell networking disabled; hosted web source succeeded.']),indent=2)+'\n')
(R/'research/markov-e2cd486c-checkpoint.md').write_text('# Live checkpoint e2cd486c\n\nMachine-authored. Read full mission/design, pinned root/contract, inherited index, independent target/residual/mathematical audits and latest worker reports/logs. Worker 81 completed final audit replay and finalizer. Prior artifacts verified; no predecessor action blindly replayed. Research: close fourth-band terminal triples with polygon guards, then reassess small-run/small-cycle residuals. Full Conjecture63 remains open.\n')
print(json.dumps(dict(checks=len(checks),events=[dict(worker=d['worker'],pending=list(d['pending'])) for d in events])))
