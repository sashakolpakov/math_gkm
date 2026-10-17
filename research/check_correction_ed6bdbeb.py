"""Machine-authored exact finite checks; these are not universal proofs."""
from pathlib import Path
from math import comb
from functools import lru_cache
import json,time,hashlib
from gf_identity_13e37040 import u,v,t
from three_probe_9e205206 import frame,add,mul,neg
O=Path('evidence/markov-ed6bdbeb'); start=time.monotonic()
def expand(num,den,N):
 def unpack(p):
  out=[{} for _ in range(max((k for i,j,k in p),default=0)+1)]
  for (i,j,k),c in p.items():out[k][i,j]=c
  return out
 num,den=unpack(num),unpack(den);assert den[0]=={(0,0):1}
 out=[]
 for n in range(N+1):
  a=num[n].copy() if n<len(num) else {}
  for k in range(1,min(n,len(den)-1)+1):a=add(a,neg(mul(den[k],out[n-k])))
  out.append(a)
 return out
@lru_cache(None)
def D(i,j,k):
 if k<0:return 0
 return sum((1 if s==0 else 4*s)*comb(j-s+i,i)*comb(k-s+i-3,i-3) for s in range(min(j,k)+1))
@lru_cache(None)
def E(q,r,i,j):
 B=3*q+(1 if r else 2); J=j-q-1;K=B-q-i-j
 if min(J,K)<0:return 0
 return 4*sum((3*s+(2 if r else 1))*comb(J-s+i-1,i-1)*comb(K-s+i-2,i-2) for s in range(min(J,K)+1))
counts=dict(correction_coefficients=0,correction_zeros=0,source_coefficients=0,source_zeros=0,triples=[0,0,0],negative_mixed=[0,0],excess_vertical=0)
bad=[]; examples=[]
for r in (False,True):
 num=4*u**3*v**(4 if r else 3)*t**(3 if r else 2)*((2+v**3*t**2) if r else (1+2*v**3*t**2))
 den=(1-v**3*t**2)**2*(1-v*t)*(1-v**2*t)**2*((1-v*t)*(1-v**2*t)-u*v*t)
 corr=expand(num,den,30)
 for q,p in enumerate(corr):
  for i in range(3,3*q+9):
   for j in range(3*q+9-i):
    a=p.get((i,j),0);b=E(q,r,i,j)
    counts['correction_coefficients']+=1;counts['correction_zeros']+=int(a==0)
    if a!=b:bad.append(['correction',q,r,i,j,a,b])
 for q in range(1,31):
  a,b,p=frame([False]*(q-1)+[True,r]);assert a==3
  for i in range(3,b+6):
   for j in range(b+6-i):
    raw=p.get((i,j),0); expected=D(i,j,b+2-i-j)+E(q,r,i,j)
    counts['source_coefficients']+=1; counts['source_zeros']+=int(raw==0)
    if raw!=expected:bad.append(['source',q,r,i,j,raw,expected])
    ee=[E(q,r,i,j+k) for k in range(3)];counts['excess_vertical']+=1
    if ee[1]**2<ee[0]*ee[2]:bad.append(['excess',q,r,i,j,ee])
  inside=lambda i,j:3*b<=b*i+3*j and i+j<=b+2
  for i in range(b+3):
   for j in range(b+3-i):
    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      counts['triples'][direction]+=1;x,y,z=[p.get(pt,0) for pt in pts]
      if x*z>y*y:bad.append(['LC',q,r,pts,[x,y,z]])
      if direction>0 and i>=3:
       dd=[D(ii,jj,b+2-ii-jj) for ii,jj in pts];ee=[E(q,r,ii,jj) for ii,jj in pts]
       mixed=2*dd[1]*ee[1]-dd[0]*ee[2]-dd[2]*ee[0]
       if mixed<0:
        counts['negative_mixed'][direction-1]+=1
        if len(examples)<10:examples.append(dict(q=q,r=r,direction=direction,points=pts,base=dd,correction=ee,mixed=mixed,total_gap=y*y-x*z))
out=dict(counts=counts,failures=bad,negative_examples=examples,q_range=[0,30],source_q_range=[1,30],seconds=time.monotonic()-start,status='Finite exact experiments only; no root closure.',script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(O/'correction-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
