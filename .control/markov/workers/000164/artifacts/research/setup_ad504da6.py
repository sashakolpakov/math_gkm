"""Machine-authored ad504da6: reconciliation and immutable research boundary."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ad504da6'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-fee405c8/manifest.json').read_text())
raw=R/'.control/markov/workers/000156/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines()]
rec=dict(request_id='ad504da6c8b84f10b937c15cf985413e',bindings={p:sha(R/p)==v['sha256'] for p,v in idx.items()},predecessor_artifacts=len(man),mismatches=[p for p,h in man.items() if sha(R/p)!=h],root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),stop_file_present=(R/'.control/markov/STOP.json').exists(),interruption=dict(raw_events_sha256=sha(raw),last_events=events[-5:],reconciliation='Worker 156 final input check completed; replay/audit timed out. Subsequent workers revalidated effects. Immediate predecessor 163 completed; its pair positivity attempt timed out and is excluded from accepted modules. No old mutation replayed.'),capabilities=dict(scratch='Denied by managed policy; not accessed',sage=shutil.which('sage'),gap=shutil.which('gap')))
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-fee405c8')+':'+json.loads((R/'evidence/markov-fee405c8/inherited-lean-path.json').read_text())))
for old,new in [('validate_fee405c8.py','validate_ad504da6.py'),('ReplayIsolatedMFEE.lean','ReplayIsolatedMAD5.lean'),('audit_fee405c8.py','audit_ad504da6.py')]:
 (R/'research'/new).write_text((R/'research'/old).read_text().replace('fee405c8','ad504da6').replace('MFEE','MAD5'))
print(json.dumps({k:v for k,v in rec.items() if k!='interruption'}))
print(json.dumps(events[-5:])[-7000:])
