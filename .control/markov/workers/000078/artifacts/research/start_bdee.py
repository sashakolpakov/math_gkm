"""Machine-authored live bdee9a64 reconciliation. No controller edits."""
from pathlib import Path
import json,hashlib,shutil
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bdee9a64';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for p,h in json.loads((R/'evidence/markov-8bbb934e/artifacts.json').read_text())['hashes'].items():
 checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
assert all(x['expected']==x['actual'] for x in checks)
base=R/'.control/markov/workers/000077';ev=[json.loads(s) for s in (base/'events.jsonl').read_text().splitlines()]
started={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.started'}
completed={e['item']['id']:e['item'] for e in ev if e.get('type')=='item.completed'}
pending={k:v for k,v in started.items() if k not in completed}
(O/'predecessor-events-summary.json').write_text(json.dumps(dict(sha256=sha(base/'events.jsonl'),events=len(ev),pending=pending,last_events=ev[-4:]),indent=2)+'\n')
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='bdee9a64cacb4562b1d69ef649d7da48',checks=checks,pins=pins,reconciliation='Worker 77 timed out after finalizer completed successfully. Its 14 accepted modules and 66 axiom closures are recorded; all 155 artifact hashes match. Three abstract proof timeouts and a conditional draft are excluded. No side effect replayed. New action: derive universal scalar run-jet rational identities rather than extrapolate interpolation.',limitations=['Higher-priority policy denies .scratch reads; unique persistent research/evidence paths used.'],capabilities={s:shutil.which(s) for s in ['sage','gap','lean','lake']},stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
lp=str(R/'evidence/markov-8bbb934e')+':'+json.loads((R/'evidence/markov-8bbb934e/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(R/'research/validate_bdee.py').write_text((R/'research/validate_8bbb.py').read_text().replace('markov-8bbb934e','markov-bdee9a64'))
(R/'research/markov-bdee9a64-checkpoint.md').write_text('# Live checkpoint bdee9a64\n\nFull pinned root unresolved. Read mission, design, contract, inherited index, independent audits, latest full reports and worker 77 raw event log. Reconciled finalizer completion and excluded timeout drafts. New action: universal run-jet recurrences and denominator-cleared formulas as a route to all-run third-slice inequalities. No source formula inferred from interpolation.\n')
print(json.dumps(dict(checks=len(checks),unmatched_started=list(pending),stop_file_present=(R/'.control/markov/STOP.json').exists())))
