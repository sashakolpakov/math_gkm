"""Machine-authored exact finite checks of the small third-column quotient adapters."""
from small_blocks_ae257c53 import blocks,divplus,source3,path_for
from math import gcd,comb
from pathlib import Path
import json,time,hashlib
O=Path('/Users/sasha/math_gkm/evidence/markov-762ebbae')
start=time.monotonic();records=[];ids=adj=zeros=0
for a in range(4,7):
 for r in range(1,a):
  if gcd(a,r)!=1:continue
  bs=blocks(a,r)
  for _ in range(7-a):bs=[divplus(d) for d in bs]
  for q in [2,4,7,19,61,103]:
   b=a*q+r;aa,bb,p=source3(path_for(a,b));assert (aa,bb)==(a,b)
   raw=[p.get((3,j),0) for j in range(a+b+5)]
   numerator={}
   for band,d in enumerate(bs):
    for (i,j),v in d.items():numerator[band*q+j]=numerator.get(band*q+j,0)+v*q**i
   off=b-3*q-3
   assert off>=0
   pred=[sum(v*comb(k-off-j+5,5) for j,v in numerator.items() if j<=k-off) for k in range(len(raw))]
   assert pred==[6*v for v in raw]
   ids+=len(raw);zeros+=raw.count(0)
   for j in range(len(raw)-2):
    assert raw[j]*raw[j+2]<=raw[j+1]**2
    adj+=1
   records.append(dict(a=a,b=b,q=q,r=r,raw_sha256=hashlib.sha256(str(raw).encode()).hexdigest()))
out=dict(status='Exact finite experiment only, not a universal proof',fractions=len(records),coefficient_comparisons=ids,adjacent_checks=adj,zeros=zeros,failures=[],records=records,seconds=time.monotonic()-start)
(O/'small-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='records'}))
