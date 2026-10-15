"""Machine-authored exact source tests of increasing LC degree weights."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd,comb
from random import Random
import json,time
O=Path('evidence/markov-c4169865');start=time.monotonic();rng=Random(416987)
pairs=[(a,b) for b in range(3,45) for a in range(1,b) if gcd(a,b)==1];rng.shuffle(pairs)
inputs=[];checks=0;fail=None
for a,b in pairs:
 w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,min(b-1,7))
 for s in range(min(b-1,7)+1):
  ds=sorted({d for ss,d,j in F if ss==s})
  if not ds:continue
  for _ in range(12):
   l=rng.choice(ds);u=rng.choice([d for d in ds if d>=l]);m=u-l
   shapes=[('uniform',[1]*(m+1)),('linear',[r+1 for r in range(m+1)]),
     ('binomial_rising',[comb(2*m+3,r+1) for r in range(m+1)]),
     ('negative_binomial',[comb(r+3,3) for r in range(m+1)]),
     ('geometric',[3**r for r in range(m+1)])]
   for name,wt in shapes:
    assert all(wt[t]<=wt[t+1] for t in range(m))
    assert all(wt[t+1]**2>=wt[t]*wt[t+2] for t in range(m-1))
    vals=[sum(wt[d-l]*F.get((s,d,j),0) for d in range(l,u+1)) for j in range(a+s+1)]
    for j in range(a+s-1):
     pts=[(a+s-j-t,j+t) for t in range(3)]
     if any(i<0 or b*i+a*k<a*b or i+k>a+b-1 for i,k in pts):continue
     checks+=1;gap=vals[j+1]**2-vals[j]*vals[j+2]
     if gap<0:
      fail=dict(a=a,b=b,s=s,j=j,points=pts,interval=[l,u],weights=wt,shape=name,values=vals[j:j+3],gap=gap,layers={d:[F.get((s,d,j+t),0) for t in range(3)] for d in ds});break
    if fail:break
   if fail:break
  if fail:break
 inputs.append([a,b]);rec=dict(status='finite exact experiment only',inputs=inputs,checks=checks,failure=fail,seconds=time.monotonic()-start)
 (O/'increasing-weights.json').write_text(json.dumps(rec,indent=2)+'\n')
 if fail or time.monotonic()-start>60:break
print(json.dumps(dict(sources=len(inputs),checks=checks,failure=fail,seconds=time.monotonic()-start)),flush=True)
