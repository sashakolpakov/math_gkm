"""Machine-authored research reconciliation, request 6905e489. No controller edits."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-6905e489'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
for p,h in json.loads((R/'evidence/markov-75ad68f9/artifacts.json').read_text())['hashes'].items():
 checks.append(dict(path=p,expected=h,actual=sha(R/p)))
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 checks.append(dict(path=p,expected=v['sha256'],actual=sha(R/p)))
events=[]
for n in [72,73,74]:
 base=R/f'.control/markov/workers/{n:06d}'
 receipt=json.loads((base/'receipt.json').read_text())
 for p,v in receipt.get('changes',{}).items():
  if v['after'] is not None: checks.append(dict(path=p,expected=v['after'],actual=sha(R/p)))
 ev=[json.loads(s) for s in (base/'events.jsonl').read_text().splitlines()]
 events.append(dict(worker=n,receipt=receipt,event_sha256=sha(base/'events.jsonl'),events=ev))
assert all(c['expected']==c['actual'] for c in checks)
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
rec=dict(request_id='6905e489e1b94101b2cfdfbd54247a99',checks=checks,pins=pins,
 reconciliation='72 left four failed builds and an unaccepted pattern proof; no successful olean or replay. 73 and 74 failed routing before action. Preserved all artifacts; repair will be a new module. No completed side effects replayed.',
 capabilities={s:shutil.which(s) for s in ['sage','gap','lean','lake']},
 limitations=['Higher-priority sandbox denies .scratch; unique research/evidence paths used.', 'zsh heredoc failed to create a temporary file; use Python scripts and -c.'],
 stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(O/'predecessor-events.json').write_text(json.dumps(events,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text((R/'evidence/markov-5fcfae06/inherited-lean-path.json').read_text())
(R/'research/validate_6905.py').write_text((R/'research/validate_5fcf.py').read_text().replace('markov-5fcfae06','markov-6905e489'))
s=(R/'research/MarkovTriplePatterns5fcf.lean').read_text().replace('request 5fcfae06','request 6905e489, repairing the preserved 5fcfae06 attempt')
s=s.replace('   simp only [lowerSub487] at ih\n   cases p', '   simp only [lowerSub487, lowerRun487, Nat.zero_add] at ih\n   cases p')
(R/'research/MarkovTriplePatterns6905.lean').write_text(s)
(R/'research/markov-6905e489-checkpoint.md').write_text('# Live checkpoint 6905e489\n\nMachine-authored. Pinned full Conjecture63 remains open. Reconciled requests 72–74 and preserved prior artifacts. Repairing the source cyclic 111/101 counts in a new module, then investigating a universal cubic trace extraction. No source coefficient formula is assumed.\n')
print(json.dumps(dict(checks=len(checks),pins=pins,capabilities=rec['capabilities'])))
