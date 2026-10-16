"""Machine-authored exact symbolic experiment; candidate algebra, not proof."""
from pathlib import Path
from collections import defaultdict
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-fee405c8')
D=4
def c(n):return {(0,)*D:n} if n else {}
def var(i):return {tuple(int(k==i) for k in range(D)):1}
def add(*ps):
 z=defaultdict(int)
 for p in ps:
  for k,v in p.items():z[k]+=v
 return {k:v for k,v in z.items() if v}
def neg(p):return {k:-v for k,v in p.items()}
def mul(*ps):
 z=c(1)
 for p in ps:
  q=defaultdict(int)
  for a,u in z.items():
   for b,v in p.items():q[tuple(x+y for x,y in zip(a,b))]+=u*v
  z={k:v for k,v in q.items() if v}
 return z
def sub(p,q):return add(p,neg(q))
def main():
 start=time.monotonic()
 # n=x, m=x+g+2, j=m+z, t=T+1. Compare outer (m,n) with inner (m-1,n+1).
 x,g,z,T=[var(i) for i in range(D)];t=add(T,c(1));n=x;m=add(x,g,c(2));j=add(m,z)
 def W(v):return add(mul(add(t,v,c(4)),add(t,v,c(5))),mul(c(4),sub(j,v),add(t,j,c(4))))
 def A(v):return (mul(v,add(t,v,c(4)),add(t,v,c(5)),add(W(v),c(-2))),mul(add(sub(j,v),c(1)),add(t,v,c(2)),add(t,v,c(3)),W(v)))
 def B(v):return (mul(sub(j,v),add(t,v,c(4)),add(t,v,c(5)),add(W(v),c(2))),mul(add(v,c(1)),add(t,v,c(6)),add(t,v,c(7)),W(v)))
 points=[m,n,add(m,c(-1)),add(n,c(1))]
 # Four rational products; cancel common W denominators by constructing a common product explicitly.
 aa=[A(v) for v in points];bb=[B(v) for v in points]
 # Naive common denominators could be enormous; first just record exact bounded specializations.
 from fractions import Fraction
 from math import comb
 def kval(j,t,m):return comb(t+m+3,m)*(comb(t+j+3,t+m+3) if m<=j else 0)+4*comb(t+m+3,m)*(comb(t+j+4,t+m+5) if m+2<=j else 0)
 def rat(j,t,m):
  k=kval(j,t,m)
  return Fraction(kval(j,t-1,m-1),k) if m else Fraction(0),Fraction(kval(j,t+1,m+1),k) if m<j else Fraction(0)
 out={'status':'exact finite rational comparison only; no universal proof','comparisons':0,'failures':[]}
 for j0 in range(2,51):
  for t0 in [1,2,3,5,10,25,50,100,250]:
   rr=[rat(j0,t0,m0) for m0 in range(j0+1)]
   for m0 in range(2,j0+1):
    for n0 in range(m0-1):
     a,b=rr[m0];aa0,bb0=rr[n0];ai,bi=rr[m0-1];aj,bj=rr[n0+1]
     gap=a*bb0+aa0*b-ai*bj-aj*bi
     out['comparisons']+=1
     if gap<0:out['failures'].append([j0,t0,m0,n0,str(gap)])
 out['seconds']=time.monotonic()-start
 (O/'pair-extension.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
