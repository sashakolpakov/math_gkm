"""Machine-authored e45ef6ac. Tests whether adjacent run lengths alone suffice.
The arbitrary words here are NOT source-family witnesses.
"""
from pathlib import Path
from random import Random
import json,time,itertools
O=Path('evidence/markov-e45ef6ac')
def transfer(w,limit):
 def add(*ps):
  q={}
  for p in ps:
   for k,v in p.items():q[k]=q.get(k,0)+v
  return q
 def sh(p,s=0,j=0):return {(a+s,k+j):v for (a,k),v in p.items() if a+s<=limit}
 def sm(p):return add(p,sh(p,j=1))
 W={(0,0):1};H={(0,0):1,(0,1):1};Z={(0,0):1}
 for r in w:
  if r:
   C=sh(sm(H),s=1)
   W,H,Z=add(W,C),add(sh(H,j=1),sm(Z),sm(C)),add(Z,C)
  else:
   C=sh(H,s=1)
   W,H,Z=add(W,C),add(W,sm(C)),add(W,C)
 return W
def main():
 rng=Random(6945);start=time.monotonic();checks=0;inputs=[];failure=None
 candidates=[]
 for n in range(5):
  for L in [3,5,8,13,21,34,55]:
   for shape in range(12):
    v=tuple(rng.randrange(2) for _ in range(L))
    if shape==0:v=(0,)*(L//2)+(1,)*(L-L//2)
    if shape==1:v=(1,)*(L//2)+(0,)*(L-L//2)
    if shape==2:v=(0,)*(L//2)+(1,)+(0,)*(L//2)
    if shape==3:v=(1,)*(L//2)+(0,)+(1,)*(L//2)
    candidates.append((n,v))
 rng.shuffle(candidates)
 for n,v in candidates:
  w=(1,)*n+(0,)+sum(((1,)*(n+r)+(0,) for r in v),())+(1,)*(n+1)
  F=transfer(w,min(len(w),12));local=0
  for s in range(1,min(len(w),12)+1):
   J=max(j for ss,j in F if ss==s)
   for j in range(J-1):
    vals=[F.get((s,j+k),0) for k in range(3)];checks+=1;local+=1
    if vals[1]**2<vals[0]*vals[2]:
     failure=dict(n=n,interior=v,word=w,s=s,j=j,values=vals,gap=vals[1]**2-vals[0]*vals[2]);break
   if failure:break
  inputs.append(dict(n=n,interior=v,length=len(w),checks=local))
  rec=dict(status='finite exact experiments on arbitrary adjacent-run words; not source witnesses',inputs=inputs,checks=checks,failure=failure,seconds=time.monotonic()-start)
  (O/'run-order.json').write_text(json.dumps(rec,indent=2)+'\n')
  if failure or time.monotonic()-start>100:break
 print(json.dumps(dict(inputs=len(inputs),checks=checks,failure=failure,seconds=rec['seconds'])))
if __name__=='__main__':main()
