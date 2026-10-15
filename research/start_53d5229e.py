"""Machine-authored research reconciliation for request 53d5229e; no control writes."""
from pathlib import Path
import json, hashlib, re, shutil, importlib.util, sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-53d5229e'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for prev in ['8bbb934e','bdee9a64']:
 for p,h in json.loads((R/f'evidence/markov-{prev}/artifacts.json').read_text())['hashes'].items():
  checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
assert all(d['expected']==d['actual'] for d in checks)
events=[]
for n in ['000077','000078','000079','000080']:
 p=R/'.control/markov/workers'/n/'events.jsonl'
 ev=[json.loads(l) for l in p.read_text().splitlines()]
 starts={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.started'}
 ends={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.completed'}
 events.append(dict(worker=n,sha256=sha(p),events=len(ev),pending={k:v for k,v in starts.items() if k not in ends},last_events=ev[-4:]))
(O/'predecessor-events.json').write_text(json.dumps(events,indent=2)+'\n')
P=R/'evidence/markov-07f1d410'; runs=[]
for p in sorted(P.glob('run-*.json')):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));runs.append(d)
inv=json.loads((P/'audit-inventory.json').read_text()); accepted=[]
for m in inv['modules']:
 p=R/'research'/f'{m}.lean';h=sha(p)
 ds=[d for d in runs if d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h and d.get('returncode')==0 and d.get('mode')=='build']
 assert ds,m
 accepted.append(dict(module=m,source=str(p.relative_to(R)),sha256=h,build=ds[-1]['receipt']))
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
inherited={str(p.relative_to(R)):sha(p) for p in list(P.glob('*'))+list((R/'research').glob('*07F1*'))+list((R/'research').glob('*07f1*')) if p.is_file()}
rec=dict(request_id='53d5229e9f134234a21bc350e491d476',checks=checks,pins=pins,inherited=inherited,accepted_builds=accepted,stop_file_present=(R/'.control/markov/STOP.json').exists(),reconciliation='Worker 80 completed repaired two-band source build; final audit/replay/manifest unfinished. No predecessor finalizer rerun. Worker 79 diagnostic-only finalizer failure reconciled in inherited-fdda-validation.json.',limits='Receipt reconciliation is not a fresh rebuild or independent audit.')
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(P)+':'+json.loads((P/'inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(R/'research/validate_53d5229e.py').write_text((R/'research/validate_07f1.py').read_text().replace('markov-07f1d410','markov-53d5229e'))
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,python=sys.version,limitations=['Scratch path denied by higher-priority sandbox; unique research/evidence files used.','No shell networking; hosted source access succeeded.']),indent=2)+'\n')
(R/'research/markov-53d5229e-checkpoint.md').write_text('# Live checkpoint 53d5229e\n\nRead full mission/design, exact root, inherited index, independent audits and interrupted worker reports/logs. Worker 80 completed its repaired two-band source build but not final audit/replay. Prior files are preserved; no finalizer is replayed. New research: seek a uniform third-band coefficient formula and test its gap certificates, retaining all small-cycle corrections. Full Conjecture63 remains open.\n')
print(json.dumps(dict(checks=len(checks),inherited_modules=len(accepted),events=[dict(worker=d['worker'],pending=list(d['pending'])) for d in events])))
