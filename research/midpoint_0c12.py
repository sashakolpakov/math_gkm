"""Exact finite diagnostic for a proposed discrete midpoint route."""
from math import comb
import json,pathlib,time
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q):return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q) if s>0 else 0
start=time.monotonic();count=0;fails=[]
for a in range(3,31):
 for j in range(2*a+1):
  for s in range(2,a):
   lo=[H(a,j,s-1,q) for q in range(a+1)]
   hi=[H(a,j,s+1,q) for q in range(a+1)]
   mid=[H(a,j,s,q) for q in range(a+1)]
   for q,x in enumerate(lo):
    if not x:continue
    for t,y in enumerate(hi):
     if not y:continue
     count+=1;k=q+t
     if x*y>mid[k//2]*mid[(k+1)//2]:
      fails.append(dict(a=a,j=j,s=s,q=q,t=t,ends=x*y,middle=mid[k//2]*mid[(k+1)//2]))
      break
    if fails:break
   if fails:break
  if fails:break
 if fails:break
out=dict(status='finite experiment, not proof',comparisons=count,failures=fails,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-0c12f51d/midpoint.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
