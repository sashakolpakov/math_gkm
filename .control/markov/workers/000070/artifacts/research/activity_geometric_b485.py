"""Exact geometric-activity probe, bounded and independently recorded."""
from activity_b485 import transfer
from pathlib import Path
from math import gcd
import json,time
start=time.monotonic();inputs=[];checks=0;failure=None
for b in range(3,65):
 for a in range(1,b):
  if gcd(a,b)!=1:continue
  N=b-1;w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
  for q in [2,10]:
   for reverse in [False,True]:
    weights=tuple(q**(N-1-k if reverse else k) for k in range(N));F=transfer(w,weights)
    for j in range(a+b):
     for s in range(N-1):
      vals=[F.get((s+k,j),0) for k in range(3)];checks+=1
      if vals[1]**2<vals[0]*vals[2]:failure=dict(a=a,b=b,word=w,q=q,reverse=reverse,s=s,j=j,values=vals,gap=vals[1]**2-vals[0]*vals[2]);break
     if failure:break
    inputs.append(dict(a=a,b=b,q=q,reverse=reverse))
    if failure or time.monotonic()-start>60:break
   if failure or time.monotonic()-start>60:break
  if failure or time.monotonic()-start>60:break
 if failure or time.monotonic()-start>60:break
rec=dict(status='finite exact experiments only',inputs=inputs,checks=checks,failure=failure,seconds=time.monotonic()-start)
Path('evidence/markov-b485717c/activity-geometric.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
