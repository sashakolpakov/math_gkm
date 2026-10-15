"""Exact finite site-activity experiments. No universal inference."""
from pathlib import Path
from itertools import product
from math import gcd
from random import Random
import json,time
O=Path('evidence/markov-b485717c')
def transfer(w,weights):
 def add(*ps):
  q={}
  for p in ps:
   for k,v in p.items():q[k]=q.get(k,0)+v
  return q
 def sh(p,s=0,j=0,c=1):return {(a+s,k+j):c*v for (a,k),v in p.items()}
 def sm(p):return add(p,sh(p,j=1))
 W={(0,0):1};H={(0,0):1,(0,1):1};Z={(0,0):1}
 for r,t in zip(w,weights):
  if r:
   C=sh(sm(H),s=1,c=t)
   W,H,Z=add(W,C),add(sh(H,j=1),sm(Z),sm(C)),add(Z,C)
  else:
   C=sh(H,s=1,c=t)
   W,H,Z=add(W,C),add(W,sm(C)),add(W,C)
 return W
def main():
 start=time.monotonic();rng=Random(485);inputs=[];checks=0;failures={}
 for b in range(3,45):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);N=len(w)
   candidates=[(1,)*N]
   candidates += [tuple(100 if k==l else 1 for k in range(N)) for l in range(N)]
   candidates += [tuple(rng.choice([1,2,10,100]) for k in range(N)) for _ in range(20)]
   for weights in candidates:
    F=transfer(w,weights);local=0
    for j in range(a+b):
     for s in range(N-1):
      v=[F.get((s+k,j),0) for k in range(3)]
      raw=v[1]**2-v[0]*v[2];ambient=(s+1)*(N-s-1)*v[1]**2-(s+2)*(N-s)*v[0]*v[2]
      local+=1;checks+=1
      for name,gap in [('raw',raw),('ambient',ambient)]:
       if gap<0 and name not in failures:
        failures[name]=dict(a=a,b=b,word=w,weights=weights,s=s,j=j,values=v,gap=gap,unweighted=[transfer(w,(1,)*N).get((s+k,j),0) for k in range(3)])
    inputs.append(dict(a=a,b=b,weights=weights,checks=local))
    if len(failures)==2 or time.monotonic()-start>70:break
   if len(failures)==2 or time.monotonic()-start>70:break
  if len(failures)==2 or time.monotonic()-start>70:break
 rec=dict(status='finite exact experiment only; modified site activities are not raw source coefficients',inputs=inputs,checks=checks,failures=failures,seconds=time.monotonic()-start)
 (O/'activity.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}),flush=True)
if __name__=='__main__':main()
