"""Machine-authored live worker 831d426f. Read-only reconciliation and new receipts."""
from pathlib import Path
import hashlib,json,os
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-831d426f'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()}
prev=json.loads((R/'evidence/markov-139fed75/manifest.json').read_text())
checks={p:sha(R/p)==h for p,h in prev.items()}
inputs={}
for base in ['research','evidence','MathGKM']:
 for p in (R/base).rglob('*'):
  if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']:
   inputs[str(p.relative_to(R))]=sha(p)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
root=sha(R/'MathGKM/Markov.lean')
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
out=dict(request_id='831d426f49894488b2803a879f0bf56a',bindings=bindings,
 predecessor_artifacts=len(checks),predecessor_mismatches=[p for p,b in checks.items() if not b],
 root_sha256=root,contract_sha256=ch,input_count=len(inputs),
 reconciliation='Immediate predecessor completed. Its artifacts and final verification retained. Earlier interrupted worker was reconciled by 9647c1ba; no predecessor mutation replayed.',
 capabilities=['Developer denies .scratch; use unique durable research/evidence files.',
 'Shell here-document failed because its temporary-file creation is denied; use file-based scripts or quoted python -c.'],
 stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
old=json.loads((R/'evidence/markov-139fed75/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-139fed75')+':'+old)+'\n')
for a,b in [('validate_139fed75.py','validate_831d426f.py'),('ReplayIsolatedM139.lean','ReplayIsolatedM831.lean')]:
 s=(R/'research'/a).read_text().replace('139fed75','831d426f').replace('M139','M831')
 (R/'research'/b).write_text(s)
print(json.dumps(out))
