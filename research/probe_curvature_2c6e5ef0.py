"""Machine-authored finite exact curvature probes. No proof claim."""
from math import comb
from fractions import Fraction
from random import Random
from pathlib import Path
import json,time,hashlib
O=Path('evidence/markov-2c6e5ef0')
def D(t,j,k):
 return sum((1 if s==0 else 4*s)*comb(j-s+t+3,t+3)*comb(k-s+t,t) for s in range(min(j,k)+1))
rng=Random(260617)
samples=[(rng.randrange(250),rng.randrange(250),rng.randrange(250)) for _ in range(4000)]
samples += [(t,j,k) for t in [0,1,2,5,20,100,1000] for j in [0,1,2,10,100,1000] for k in [0,1,2,10,100,1000]]
out=dict(status='finite exact computation only',checks=0,failures=[],strong_failures=[],ratio_min=None)
start=time.monotonic()
for t,j,k in samples:
 a,b,c=D(t,j+2,k),D(t+1,j+1,k),D(t+2,j,k)
 out['checks']+=1
 if (t+5)*a*c>(t+4)*b*b:out['failures'].append([t,j,k,a,b,c])
 if (t+4)*a*c>(t+3)*b*b:out['strong_failures'].append([t,j,k,a,b,c])
 margin=Fraction((t+4)*b*b,(t+5)*a*c)
 if out['ratio_min'] is None or margin < Fraction(out['ratio_min']):
  out['ratio_min']=str(margin);out['ratio_min_at']=[t,j,k]
out['seconds']=time.monotonic()-start
out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
(O/'curvature-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ['failures','strong_failures']}),flush=True)
print('failures',len(out['failures']),'strong failures',len(out['strong_failures']),flush=True)
