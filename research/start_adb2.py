"""Machine-authored reconciliation for live research request adb2c7b044ee463584f90512a565fe95."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-adb2c7b0'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for p,h in json.loads((R/'evidence/markov-6905e489/artifacts.json').read_text())['hashes'].items():
 checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
assert all(c['expected']==c['actual'] for c in checks)
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
base=R/'.control/markov/workers/000075'
events=[json.loads(s) for s in (base/'events.jsonl').read_text().splitlines()]
(O/'predecessor-events-summary.json').write_text(json.dumps(dict(event_sha256=sha(base/'events.jsonl'),events=len(events),last_events=events[-3:]),indent=2)+'\n')
rec=dict(request_id='adb2c7b044ee463584f90512a565fe95',checks=checks,pins=pins,reconciliation='Latest worker 75 completed; its validation and artifact hashes agree. Its report explicitly reconciles interrupted workers 72–74. No partial side effect will be replayed; all new modules have unique names.',capabilities={s:shutil.which(s) for s in ['sage','gap','lean','lake']},limitations=['Active policy denies .scratch; research and evidence paths used.'],stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
lp=str(R/'evidence/markov-6905e489')+':'+json.loads((R/'evidence/markov-6905e489/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(R/'research/validate_adb2.py').write_text((R/'research/validate_6905.py').read_text().replace('markov-6905e489','markov-adb2c7b0'))
(R/'research/markov-adb2c7b0-checkpoint.md').write_text('# Research checkpoint adb2c7b0\n\nFull pinned Conjecture63 remains open. Reconciled latest completed worker and verified inherited artifacts. Investigating a direct telescoping local-moment bridge, avoiding permutation-index bookkeeping. No cubic source identity is assumed.\n')
print(json.dumps(dict(checks=len(checks),capabilities=rec['capabilities'],stop_file_present=rec['stop_file_present'])))
