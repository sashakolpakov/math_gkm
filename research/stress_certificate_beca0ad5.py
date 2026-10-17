"""Machine-authored fixed-deficiency coefficient stress experiment only."""
from reverse_certificate_beca0ad5 import certificate,O
import json,time,hashlib
from pathlib import Path
start=time.monotonic();out=dict(status='finite polynomial-family experiment; no universal h proof',cases=[])
for h in [13,14,16,18,20]:
 t=time.monotonic();p=certificate(h)
 row=dict(h=h,terms=len(p),negative=sum(v<0 for v in p.values()),minimum=min(p.values()),seconds=time.monotonic()-t)
 out['cases'].append(row);out['seconds']=time.monotonic()-start
 out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'certificate-stress.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(row),flush=True)
