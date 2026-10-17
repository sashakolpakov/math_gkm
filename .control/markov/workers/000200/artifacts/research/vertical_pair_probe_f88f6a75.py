"""Machine-authored challenge to pairwise lower-vertical summation closure."""
from math import comb
from pathlib import Path
import json,time
t0=time.monotonic()
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def F(n,t,j,r):return C(n-j-r-1,t)*C(j-r+t+3,t+3) if r<=j else 0
out=dict(checks=0,failures=[],source_wedge_failures=[])
for n in range(8,55):
 for t in range(min(16,n)):
  for j in range((n-1)//2):
   for r in range(j+3):
    for s in range(r,j+3):
     gap=2*F(n,t,j+1,r)*F(n,t,j+1,s)-F(n,t,j,r)*F(n,t,j+2,s)-F(n,t,j,s)*F(n,t,j+2,r)
     out['checks']+=1
     if gap<0:
      v=dict(n=n,t=t,j=j,r=r,s=s,gap=gap,triples=[[F(n,t,j+l,z) for l in range(3)] for z in [r,s]])
      if len(out['failures'])<5:out['failures'].append(v)
      if 3*(j+2)+1<=n and len(out['source_wedge_failures'])<5:out['source_wedge_failures'].append(v)
 if out['source_wedge_failures']:break
out.update(seconds=time.monotonic()-t0,status='Finite auxiliary pairing experiment. Negative pairs do not refute the total gap or root.')
Path('evidence/markov-f88f6a75/vertical-pair-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
