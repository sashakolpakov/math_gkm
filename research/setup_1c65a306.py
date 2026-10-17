"""Machine-authored request 1c65a30634f843b1b22e83fb453dc26d; reconciliation only."""
from pathlib import Path
import hashlib,json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-1c65a306'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
prev=json.loads((R/'evidence/markov-beca0ad5/manifest.json').read_text())
inputs={}
for base in ['research','evidence','MathGKM']:
 for p in (R/base).rglob('*'):
  if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']:
   inputs[str(p.relative_to(R))]=sha(p)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
out=dict(request_id='1c65a30634f843b1b22e83fb453dc26d',bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()},
 predecessor_artifacts=len(prev),predecessor_mismatches=[p for p,h in prev.items() if sha(R/p)!=h],
 root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 input_count=len(inputs),stop_file_present=(R/'.control/markov/STOP.json').exists(),
 capabilities=['Developer forbids .scratch reads; unique durable research/evidence files used.','No AGENTS.md at root/research/evidence.'])
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
p=R/'.control/markov/workers/000171/events.jsonl'
events=[json.loads(x) for x in p.read_text().splitlines()]
prior=json.loads((R/'evidence/markov-beca0ad5/interruption-reconciliation.json').read_text())
man=json.loads((R/'evidence/markov-c3e5369f/manifest.json').read_text())
rec=dict(raw_events_sha256=sha(p),matches_predecessor=sha(p)==prior['raw_events_sha256'],event_count=len(events),last_events=events[-4:],artifacts=len(man),mismatches=[p for p,h in man.items() if sha(R/p)!=h],decision='Inspected raw final events: finalization completed before report transport failure. Preserve all artifacts; replay no interrupted mutation.')
(O/'interruption-reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
old=json.loads((R/'evidence/markov-beca0ad5/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-beca0ad5')+':'+old)+'\n')
for a,b in [('validate_beca0ad5.py','validate_1c65a306.py'),('audit_beca0ad5.py','audit_1c65a306.py'),('ReplayIsolatedMBEC.lean','ReplayIsolatedM1C6.lean')]:
 (R/'research'/b).write_text((R/'research'/a).read_text().replace('beca0ad5','1c65a306').replace('MBEC','M1C6'))
print(json.dumps(out));print(json.dumps({k:v for k,v in rec.items() if k!='last_events'}))
print(json.dumps(events[-2:],indent=2)[-4500:])
