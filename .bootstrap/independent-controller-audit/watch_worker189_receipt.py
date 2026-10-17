"""Exact receipt-only static polling; never reads active sources or events."""
from pathlib import Path
from datetime import datetime,timezone
import time,json,hashlib
T=Path('/private/tmp/math_gkm_godel_20261013');p=Path('/Users/sasha/math_gkm/.control/markov/workers/000189/receipt.json');out=T/'markov_worker_000189_receipt_watch.json';now=time.time()
x=json.loads(out.read_text());assert x['request']=='97b019af81a143628246a03e1f19b898'
if x['observations'] and now-x['observations'][-1]['observed_epoch']<60:
 print(json.dumps({'read_skipped':True,'remaining_seconds':60-(now-x['observations'][-1]['observed_epoch'])}));raise SystemExit
z=dict(observed_epoch=now,observed_utc=datetime.fromtimestamp(now,timezone.utc).isoformat(),path=str(p),present=p.exists())
if z['present']:
 b=p.read_bytes();r=json.loads(b);z.update(bytes=len(b),sha256=hashlib.sha256(b).hexdigest(),receipt=r)
print(json.dumps(z,indent=2),flush=True)
x['observations'].append(z);out.write_text(json.dumps(x,indent=2)+'\n')
