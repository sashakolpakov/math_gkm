"""Finite exact tests with log-concave activities along cut positions."""
from activity_b485 import transfer
from pathlib import Path
from math import gcd,comb
from random import Random
import json,time
O=Path('evidence/markov-b485717c');rng=Random(48570)
start=time.monotonic();checks=0;inputs=[];failure=None
for b in range(3,50):
 for a in range(1,b):
  if gcd(a,b)!=1:continue
  N=b-1;w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
  weights_list=[(1,)*N,tuple(2**k for k in range(N)),tuple(2**(N-1-k) for k in range(N)),tuple(comb(N-1,k) for k in range(N)),tuple(min(k+1,N-k) for k in range(N))]
  for _ in range(5):
   lo=rng.randrange(N);hi=rng.randrange(lo,N)
   weights_list.append(tuple(2**min(k,lo,N-1-k+lo-hi) for k in range(N))) if N-1+lo-hi>=N-1 else None
   # A discrete concave tent exponent, translated to remain nonnegative.
   e=[-abs(k-lo)-abs(k-hi) for k in range(N)];m=min(e)
   weights_list.append(tuple(2**(x-m) for x in e))
  for weights in weights_list:
   assert all(weights[k+1]**2>=weights[k]*weights[k+2] for k in range(N-2))
   F=transfer(w,weights);local=0
   for j in range(a+b):
    for s in range(N-1):
     vals=[F.get((s+k,j),0) for k in range(3)];local+=1;checks+=1
     gap=vals[1]**2-vals[0]*vals[2]
     if gap<0:
      failure=dict(a=a,b=b,word=w,weights=weights,s=s,j=j,values=vals,gap=gap);break
    if failure:break
   inputs.append(dict(a=a,b=b,weights=weights,checks=local))
   if failure or time.monotonic()-start>60:break
  if failure or time.monotonic()-start>60:break
 if failure or time.monotonic()-start>60:break
rec=dict(status='finite exact experiment only',inputs=inputs,checks=checks,failure=failure,seconds=time.monotonic()-start)
(O/'activity-shape.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
