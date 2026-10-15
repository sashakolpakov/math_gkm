"""Machine-authored exact test of interval-restricted diagonal tail certificates."""
from aligned_probe_6d2c import transfer
from math import gcd
from pathlib import Path
import json,time
O=Path('evidence/markov-7d905904');start=time.monotonic();inputs=[];checks=0;intervals=0;failure=None
for b in range(3,25):
 for a in range(1,b):
  if gcd(a,b)!=1:continue
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,min(6,b-1))
  for s in range(min(6,b-1)+1):
   for j in range(a+s-1):
    pts=[(a+s-j-t,j+t) for t in range(3)]
    if any(i<0 or b*i+a*k<a*b or i+k>a+b-1 for i,k in pts):continue
    layers=[[F.get((s,d,j+t),0) for t in range(3)] for d in range(2*b)]
    active=[d for d,row in enumerate(layers) if any(row)]
    if not active:continue
    for l in range(min(active),max(active)+1):
     gaps=[0]*(4*b)
     for u in range(l,max(active)+1):
      A,B,C=layers[u]
      gaps[2*u]+=B*B-A*C
      for d in range(l,u):
       aa,bb,cc=layers[d];gaps[d+u]+=2*B*bb-A*cc-aa*C
      intervals+=1;tail=0
      for q in range(2*u,2*l-1,-1):
       tail+=gaps[q];checks+=1
       if tail<0:
        failure=dict(a=a,b=b,s=s,j=j,points=pts,degree_interval=[l,u],tail_start=q,tail=tail,gaps=gaps[2*l:2*u+1],layers=layers[l:u+1]);break
      if failure:break
     if failure:break
    if failure:break
   if failure:break
  inputs.append([a,b]);rec=dict(status='finite exact test only',inputs=inputs,intervals=intervals,tail_checks=checks,failure=failure,seconds=time.monotonic()-start)
  (O/'diagonal-tail-intervals.json').write_text(json.dumps(rec,indent=2)+'\n')
  if failure or time.monotonic()-start>40:break
 if failure or time.monotonic()-start>40:break
print(json.dumps(dict(inputs=len(inputs),intervals=intervals,checks=checks,failure=failure,seconds=time.monotonic()-start)))
