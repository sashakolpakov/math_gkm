"""Machine-authored exact tests of same-degree cut compatibility."""
from pathlib import Path
from itertools import combinations
from math import gcd
import json,time
from cuts_fe01 import cutterm,value
O=Path('evidence/markov-9c20fccd')
t=time.monotonic();tests=0;words=0;first=None
for b in range(2,19):
 for a in range(1,b):
  if gcd(a,b)!=1:continue
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);words+=1
  for s in range(1,min(6,b)):
   G={}
   for S in combinations(range(len(w)),s):
    p=tuple(cutterm(w,S));G.setdefault(len(p)-1,{}).setdefault(p,S)
   for d,P in G.items():
    P=list(P.items())
    for ip,(p,S) in enumerate(P):
     for q,T in P[ip+1:]:
      for j in range(1,d):
       tests+=1
       gap=2*p[j]*q[j]-p[j-1]*q[j+1]-q[j-1]*p[j+1]
       if gap<0:
        first=dict(a=a,b=b,word=w,s=s,d=d,p=p,q=q,S=S,T=T,j=j,gap=gap);break
      if first:break
     if first:break
    if first:break
   if first:break
  if first:break
 if first:break
rec=dict(status='finite exact experiment, not root proof',words=words,tests=tests,first_failure=first,seconds=time.monotonic()-t)
(O/'same-degree.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
