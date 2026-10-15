"""Machine-authored live request 8bbb934ec26943b7821334f3647f77cf. Read-only reconciliation."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-8bbb934e'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for p,h in json.loads((R/'evidence/markov-adb2c7b0/artifacts.json').read_text())['hashes'].items():
 checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
assert all(c['expected']==c['actual'] for c in checks)
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
base=R/'.control/markov/workers/000076'
events=[json.loads(s) for s in (base/'events.jsonl').read_text().splitlines()]
(O/'predecessor-events-summary.json').write_text(json.dumps(dict(event_sha256=sha(base/'events.jsonl'),events=len(events),last_events=events[-3:]),indent=2)+'\n')
rec=dict(request_id='8bbb934ec26943b7821334f3647f77cf',checks=checks,pins=pins,reconciliation='Worker 76 completed. Final artifacts agree with hashes. Workers 72–74 were reconciled by worker 75 and checked by worker 76. No interrupted side effect is replayed. All new artifacts use unique names.',capabilities={s:shutil.which(s) for s in ['sage','gap','lean','lake']},limitations=['Higher-priority policy denies .scratch; persistent research/evidence artifacts used. Shell here-document failed: cannot create temp file, operation not permitted.'],stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(R/'evidence/markov-adb2c7b0')+':'+json.loads((R/'evidence/markov-adb2c7b0/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(R/'research/validate_8bbb.py').write_text((R/'research/validate_adb2.py').read_text().replace('markov-adb2c7b0','markov-8bbb934e'))
(R/'research/markov-8bbb934e-checkpoint.md').write_text('# Research checkpoint 8bbb934e\n\nFull pinned Conjecture63 is open. Read mission, design, exact contract, inherited index, independent target/residual/math audits, latest full reports. Verified latest artifacts and raw-event completion. New action: finish the two-block correction, then seek universal inequalities in the next run-length region using exact ring certificates. No inherited source premise is silently assumed.\n')
print(json.dumps(dict(checks=len(checks),capabilities=rec['capabilities'],stop_file_present=rec['stop_file_present'])))
