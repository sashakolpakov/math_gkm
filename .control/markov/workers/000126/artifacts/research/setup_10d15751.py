"""Machine-authored research setup; no controller mutation or action replay."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-10d15751'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-ea4238fc'
manifest=json.loads((old/'manifest.json').read_text())
errors=[p for p,h in manifest.items() if not (R/p).is_file() or sha(R/p)!=h]
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={p:sha(R/p)==d['sha256'] and (R/p).read_text()==d['content'] for p,d in inh.items()}
w=R/'.control/markov/workers/000125'
receipt=json.loads((w/'receipt.json').read_text())
events=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]
iw=R/'.control/markov/workers/000121'
ir=json.loads((iw/'receipt.json').read_text())
ie=[json.loads(s) for s in (iw/'events.jsonl').read_text().splitlines()]
changed={p:d for p,d in ir.get('changes',{}).items() if p.startswith(('research/','evidence/')) and d.get('after')}
im=[p for p,d in changed.items() if not (R/p).is_file() or sha(R/p)!=d['after']]
out=dict(verified_latest_artifacts=len(manifest),errors=errors,inherited=checks,
 latest_outcome=receipt.get('outcome'),latest_event_hash=sha(w/'events.jsonl'),latest_event_count=len(events),
 interrupted_outcome=ir.get('outcome'),interrupted_event_hash=sha(iw/'events.jsonl'),interrupted_event_count=len(ie),
 interrupted_checked=len(changed),interrupted_mismatches=im,interrupted_last_events=ie[-3:],
 finding='Latest worker completed. Read interrupted worker 121 raw event log and checked its surviving effects. No previous side effect replayed.')
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
assert not errors and all(checks.values()) and not im
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']
files += [p for p in (R/'research').iterdir() if p.is_file() and p.suffix in ('.lean','.md','.py')]
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by developer policy; not accessed. New research files used.',hosted_web='Publisher retrieved live; shell networking unused.'),indent=2)+'\n')
for kind in ('validate','audit','validate_selected'):
 s=(R/f'research/{kind}_ea4238fc.py').read_text().replace('ea4238fc','10d15751').replace('MEA423','M10D')
 (R/f'research/{kind}_10d15751.py').write_text(s)
(R/'research/ReplayIsolatedM10D.lean').write_text((R/'research/ReplayIsolatedMEA423.lean').read_text().replace('MEA423','M10D'))
print(json.dumps({k:v for k,v in out.items() if k!='interrupted_last_events'}))
