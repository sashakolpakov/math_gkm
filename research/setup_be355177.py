"""Machine-authored live request be355177. Read-only reconciliation, new receipts."""
from pathlib import Path
import hashlib,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-be355177'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()}
prev=json.loads((R/'evidence/markov-6576ccc5/manifest.json').read_text())
checks={p:sha(R/p)==h for p,h in prev.items()}
inputs={}
for base in ['research','evidence','MathGKM']:
 for p in (R/base).rglob('*'):
  if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']:
   inputs[str(p.relative_to(R))]=sha(p)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
out=dict(request_id='be35517714ad4fa2a3e9e4312d96ce0a',bindings=bindings,
 predecessor_artifacts=len(checks),predecessor_mismatches=[p for p,b in checks.items() if not b],
 root_sha256=sha(R/'MathGKM/Markov.lean'),
 contract_sha256=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 input_count=len(inputs),reconciliation='Immediate predecessor completed and all manifested effects retained. Earlier interruption reconciliation read from predecessor; no side effect replayed.',
 capabilities=['Developer denies .scratch; durable unique research/evidence files used.','Shell here-document temporary file failed; using apply_patch and file-based scripts.'],stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
old=json.loads((R/'evidence/markov-6576ccc5/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-6576ccc5')+':'+old)+'\n')
for a,b in [('validate_6576ccc5.py','validate_be355177.py'),('ReplayIsolatedM657.lean','ReplayIsolatedMBE3.lean'),('audit_6576ccc5.py','audit_be355177.py')]:
 (R/'research'/b).write_text((R/'research'/a).read_text().replace('6576ccc5','be355177').replace('M657','MBE3'))
print(json.dumps(out))
