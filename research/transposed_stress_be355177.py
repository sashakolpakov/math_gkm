"""Machine-authored be355177. Exact integer-scaled tail-cut stress test.
No symbolic or finite experiment is a proof of the full root.
"""
from math import comb
from pathlib import Path
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-be355177')
C=lambda n,k:comb(n,k) if 0<=k<=n else 0
def kernel(d,k,r,s):
 j=d+3*k+(3 if r else 2);a=2 if r else 1
 def E(t,m):return 4*C(t+m+1,m)*(a*C(k+t+3,t+m+3)+(3-a)*C(k+t+2,t+m+3))
 out=[]
 for h in range(s+1):
  m=s-h
  v=(s+1)*(C(s+m+3,m)*(C(j+s+3,s+m+3)+4*C(j+s+4,s+m+5))+E(s+1,m+1))
  if h==s:v+=E(s+1,0)*max(d-s,0)
  out.append(v)
 return out
def conv(a,b):
 out=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):out[i+j]+=x*y
 return out
def run():
 start=time.monotonic(); rng=random.Random(355177)
 cases=[(d,k,r,s) for s in range(3,31) for d in [0,1,s-1,s,s+1,s+2,2*s,5*s] for k in [0,1,2,3,s//2,s,s+1,2*s,5*s] for r in [False,True]]
 cases += [(rng.randrange(201),rng.randrange(201),bool(rng.randrange(2)),rng.randrange(31,101)) for _ in range(600)]
 out=dict(status='finite exact experiment only',seed=355177,triplets=0,coefficient_checks=0,negative=[],first_failure=None)
 for d,k,r,s in cases:
  A,B,D=[kernel(d,k,r,s+t)+[0]*(2-t) for t in range(3)]
  bb=conv(B,B);ac=conv(A,D);u=(s+1)*(s+3);v=(s+2)**2
  gap=[u*x-v*y for x,y in zip(bb,ac)]
  for h in range(s+4):
   for n,z in enumerate(gap):
    out['coefficient_checks']+=1
    if z<0:
     item=dict(d=d,k=k,r=r,s=s,cut=h,degree=n,scaled_gap=z,scale=(s+1)*(s+2)**2*(s+3))
     if out['first_failure'] is None:out['first_failure']=item
     if len(out['negative'])<20:out['negative'].append(item)
   if h<s+3:
    for j in range(h,s+3):
     if j==h:gap[2*h]-=u*B[h]**2-v*A[h]*D[h]
     else:gap[h+j]-=2*u*B[h]*B[j]-v*(A[h]*D[j]+A[j]*D[h])
  out['triplets']+=1
  if out['triplets']%100==0:
   out['seconds']=time.monotonic()-start
   (O/'transposed-stress-progress.json').write_text(json.dumps(out,indent=2)+'\n')
  if out['first_failure'] is not None:break
 out['planned_cases']=len(cases);out['seconds']=time.monotonic()-start
 (O/'transposed-stress.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
