"""Machine-authored live fddabb33 reconciliation; read-only predecessor inspection."""
from pathlib import Path
import json,hashlib,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-fddabb33'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for prev in ['8bbb934e','bdee9a64']:
 for p,h in json.loads((R/f'evidence/markov-{prev}/artifacts.json').read_text())['hashes'].items():
  checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
assert all(x['expected']==x['actual'] for x in checks)
events=[]
for n in ['000077','000078']:
 base=R/'.control/markov/workers'/n
 ev=[json.loads(s) for s in (base/'events.jsonl').read_text().splitlines()]
 started={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.started'}
 completed={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.completed'}
 pending={k:v for k,v in started.items() if k not in completed}
 events.append(dict(worker=n,sha256=sha(base/'events.jsonl'),events=len(ev),pending=pending,last_events=ev[-4:]))
(O/'predecessor-events-summary.json').write_text(json.dumps(events,indent=2)+'\n')
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='fddabb33d2704cfe80b4fa474cf8edc1',checks=checks,pins=pins,reconciliation='Both timed-out workers completed finalization before timeout. Saved validations and hashes retained; no prior side effects replayed. New action: formally bridge denominator-cleared rational formulas and coefficient extraction.',limitations=['Active higher-priority policy denies .scratch; persistent uniquely named research/evidence files used.','A shell here-document failed because its temporary file was denied; Python scripts replace shell here-documents.'],stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
lp=str(R/'evidence/markov-bdee9a64')+':'+json.loads((R/'evidence/markov-bdee9a64/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(R/'research/validate_fdda.py').write_text((R/'research/validate_bdee.py').read_text().replace('markov-bdee9a64','markov-fddabb33'))
(R/'research/markov-fddabb33-checkpoint.md').write_text('# Live checkpoint fddabb33\n\nMission/design, exact root, audits and latest mathematical reports read. Both interrupted workers completed their finalizers; all predecessor artifact hashes checked. No root closure. New action: exact normalization and coefficient extraction from the all-run third-slice expression.\n')
print(json.dumps(dict(checks=len(checks),events=[dict(worker=x['worker'],events=x['events'],pending=list(x['pending'])) for x in events],stop_file_present=(R/'.control/markov/STOP.json').exists())))
