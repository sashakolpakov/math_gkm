"""Machine-authored exact symbolic exploration. No interpolation or theorem admission."""
from fractions import Fraction
from math import comb,gcd
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-13d40bd7'
N=7
class P(dict):
 def __add__(self,b):
  b=poly(b);r=P(self)
  for e,v in b.items():r[e]=r.get(e,0)+v
  return P({e:v for e,v in r.items() if v})
 __radd__=__add__
 def __neg__(self):return P({e:-v for e,v in self.items()})
 def __sub__(self,b):return self+-poly(b)
 def __rsub__(self,b):return poly(b)+-self
 def __mul__(self,b):
  b=poly(b);r=P()
  for e,v in self.items():
   for f,w in b.items():
    z=tuple(a+b for a,b in zip(e,f));r[z]=r.get(z,0)+v*w
  return P({e:v for e,v in r.items() if v})
 __rmul__=__mul__
 def __pow__(self,n):
  if n<0:
   assert len(self)==1
   e,v=next(iter(self.items()));return P({tuple(k*n for k in e):v**n})
  r=poly(1)
  for _ in range(n):r=r*self
  return r
 def subst(self,vs):
  r=poly(0)
  for e,v in self.items():
   t=poly(v)
   for k,z in zip(e,vs):t=t*z**k
   r=r+t
  return r
 def ev(self,vs):return sum(v*__import__('functools').reduce(lambda a,b:a*b,(Fraction(z)**k for z,k in zip(vs,e)),Fraction(1)) for e,v in self.items())
def poly(v):return v if isinstance(v,P) else P({(0,)*N:Fraction(v)}) if v else P()
def var(k):return P({tuple(int(i==k) for i in range(N)):Fraction(1)})
a,b,q,t,u,x,h=[var(k) for k in range(N)]
def moment(f):
 z=f(0,0,0);p=f(1,0,0)-z;r=f(0,1,0)-z;s=f(0,0,1)-z
 pr=f(1,1,0)-z-p-r;ps=f(1,0,1)-z-p-s;rs=f(0,1,1)-z-r-s
 prs=f(1,1,1)-z-p-r-s-pr-ps-rs
 return b*z+a*(p+r+s)+q*(pr+rs)+t*ps+u*(ps+prs)
d=[x*h**-2,(2*x+3)*h**-2];d2=[poly(0),h**-2]
c=[x*h**-2,(x+2)*h**-2];c2=[poly(0),h**-2]
bb=[h**-2,(x+2)*x**-1*h**-2];bb2=[poly(0),x**-1*h**-2]
aa=[h**-2,x**-1*h**-2]
D=moment(lambda p,r,s:d[p])
K=moment(lambda p,r,s:2*d2[p]-d[p]**2+2*c[p]*bb[r])
L=moment(lambda p,r,s:2*d[p]**3-6*d[p]*d2[p]+6*(c[p]*bb2[r]+c2[p]*bb[r]-c[p]*bb[r]*(d[p]+d[r])+c[p]*aa[r]*bb[s]))
Q=(x**2*h**6*(D**3+3*D*K+L-3*h**-1*(D**2+K)+6*D*h**-2-6*h**-3))
assert all(min(e)>=0 for e in Q)
Q=Q.subst([a,b,q,t,u,x,1+x])
def rowseed(A,B):
 vals=[A,B,max(2*A-B,0),min(B-A,max(3*A-B,0)),max(3*A-2*B,0)]
 out=[]
 for j in range(6):out.append(int(P({e:v for e,v in Q.items() if e[5]==j}).ev(vals+[1,1])))
 return out
def terms(p):return [[list(e),int(v) if v.denominator==1 else str(v)] for e,v in sorted(p.items())]
if __name__=='__main__':
 fails=[];cases=0;negative=[]
 for B in range(7,151):
  for A in range(2,B):
   if gcd(A,B)>1:continue
   cs=rowseed(A,B);cases+=1
   if min(cs)<0:negative.append([A,B,cs])
   for j in range(4):
    if cs[j]*cs[j+2]>cs[j+1]**2:fails.append([A,B,j,cs])
 result=dict(status='Exact symbolic candidate and finite tests only; source identity not yet formalized',cases=cases,negative=negative[:8],failures=fails[:12],failure_count=len(fails),seed_terms=terms(Q))
 (O/'horizontal-third-candidate.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({k:v for k,v in result.items() if k!='seed_terms'}))
