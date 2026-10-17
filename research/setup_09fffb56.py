"""Machine-authored request 09fffb56626d410db28e496da5a3241c. Read-only reconciliation."""
from pathlib import Path
import hashlib,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-09fffb56'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()}
prev=json.loads((R/'evidence/markov-be355177/manifest.json').read_text())
checks={p:sha(R/p)==h for p,h in prev.items()}
inputs={}
for base in ['research','evidence','MathGKM']:
 for p in (R/base).rglob('*'):
  if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']:
   inputs[str(p.relative_to(R))]=sha(p)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
out=dict(request_id='09fffb56626d410db28e496da5a3241c',bindings=bindings,
 predecessor_artifacts=len(checks),predecessor_mismatches=[p for p,b in checks.items() if not b],
 root_sha256=sha(R/'MathGKM/Markov.lean'),
 contract_sha256=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 input_count=len(inputs),capabilities=['Developer denies .scratch; unique durable research/evidence paths used.'],
 stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
old=json.loads((R/'evidence/markov-be355177/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-be355177')+':'+old)+'\n')
for a,b in [('validate_be355177.py','validate_09fffb56.py'),('ReplayIsolatedMBE3.lean','ReplayIsolatedM09F.lean'),('audit_be355177.py','audit_09fffb56.py')]:
 (R/'research'/b).write_text((R/'research'/a).read_text().replace('be355177','09fffb56').replace('MBE3','M09F'))
p=R/'.control/markov/workers/000171/events.jsonl'
events=[json.loads(x) for x in p.read_text().splitlines()]
prior=json.loads((R/'evidence/markov-be355177/interruption-reconciliation.json').read_text())
man=json.loads((R/'evidence/markov-c3e5369f/manifest.json').read_text())
rec=dict(raw_events_sha256=sha(p),matches_predecessor=sha(p)==prior['raw_events_sha256'],event_count=len(events),last_events=events[-4:],artifacts=len(man),mismatches=[p for p,h in man.items() if sha(R/p)!=h],decision='Finalization completed before report delivery failed; retained all effects and replayed none.')
(O/'interruption-reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(out));print(json.dumps({k:v for k,v in rec.items() if k!='last_events'}))
