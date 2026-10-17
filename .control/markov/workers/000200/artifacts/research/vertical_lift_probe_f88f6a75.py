"""Machine-authored challenge to an unrestricted vertical lift candidate."""
from pathlib import Path
from math import comb
from functools import lru_cache
import json,time
t0=time.monotonic()
def C(n,k):return comb(n,k) if 0<=k<=n else 0
@lru_cache(None)
def L(d,j,t):return sum(C(d,t-m)*C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5)) for m in range(t+1))
out=dict(checks=0,failures=[],valid_source_wedge_failures=[])
for t in range(41):
 for j in range(31):
  for d in range(41):
   a,b,c=L(d+4,j,t),L(d+2,j+1,t),L(d,j+2,t);out['checks']+=1
   if a*c>b*b:
    v=dict(t=t,j=j,d=d,values=[a,b,c],gap=b*b-a*c)
    if len(out['failures'])<20:out['failures'].append(v)
    if j+2<=d and len(out['valid_source_wedge_failures'])<20:out['valid_source_wedge_failures'].append(v)
out.update(seconds=time.monotonic()-t0,status='Finite exact observations, not a universal sign theorem.')
Path('evidence/markov-f88f6a75/vertical-lift-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
