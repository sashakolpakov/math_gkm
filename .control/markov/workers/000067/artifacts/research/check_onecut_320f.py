"""Machine-authored exact checks of derived one-cut formula and concavity."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd
from random import Random
import json,time
O=Path('evidence/markov-320fe46f');rng=Random(3206);start=time.monotonic()
def add(*ps):
 q=[0]*max(map(len,ps),default=0)
 for p in ps:
  for i,v in enumerate(p):q[i]+=v
 return q
def scale(p,c):return [c*x for x in p]
def smooth(p):return add(p,[0]+p)
def R(n):return [1]+[2]*n
def P(n):return R(n)+[1]
def J(n,w):return add(*[scale(smooth(R(k)),w[k+1]) for k in range(n)],scale(R(n),w[n]))
def H(n,w):return add(*[scale(smooth(P(k)),w[k+2]) for k in range(n)],scale(P(n),w[n+1]),*[scale(smooth(R(k)),w[k+1]) for k in range(n+1)])
checks={'identities':0,'concavity':0,'logconcavity':0};fails=[];inputs=[]
for b in range(3,61):
 for a in range(1,b-1):
  if gcd(a,b)!=1:continue
  word=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
  n=next((k for k,x in enumerate(word) if x==0),len(word))
  c=b-a;r=a-c*n
  assert 0<r<c
  F=transfer(word,1)
  for _ in range(8):
   w=[rng.randrange(3)]
   for d in range(n+1):w.append(w[-1]+rng.randrange(15))
   q=add(H(n,w),scale(J(n,w),c-r-1),scale(J(n+1,w),r-1))
   vals=[sum(w[d]*v for (s,d,jj),v in F.items() if s==1 and jj==j) for j in range(n+3)]
   q+= [0]*(len(vals)-len(q))
   checks['identities']+=len(vals)
   if vals!=q:fails.append(dict(a=a,b=b,n=n,c=c,r=r,weights=w,vals=vals,formula=q))
   for j in range(n):
    checks['concavity']+=1;checks['logconcavity']+=1
    if vals[j]-2*vals[j+1]+vals[j+2]>0 or vals[j+1]**2<vals[j]*vals[j+2]:fails.append(dict(a=a,b=b,n=n,j=j,weights=w,values=vals))
  inputs.append([a,b,n,c,r])
rec=dict(status='finite exact experiment only',checks=checks,failures=fails,inputs=inputs,seconds=time.monotonic()-start)
(O/'onecut-formula.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(sources=len(inputs),checks=checks,failures=fails,seconds=rec['seconds'])))
