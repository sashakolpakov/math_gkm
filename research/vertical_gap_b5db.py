"""Machine-authored exact symbolic certificates for top crossing gaps."""
from fractions import Fraction as Q
import json,pathlib
class P(dict):
 def __add__(a,b):
  if not isinstance(b,P):b=P({(0,0,0):Q(b)})
  c=P(a)
  for k,v in b.items():c[k]=c.get(k,0)+v
  return P({k:v for k,v in c.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-coerce(b)
 def __rsub__(a,b):return coerce(b)+-a
 def __mul__(a,b):
  b=coerce(b);c=P()
  for k,v in a.items():
   for l,w in b.items():
    e=tuple(x+y for x,y in zip(k,l));c[e]=c.get(e,0)+v*w
  return P({k:v for k,v in c.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  c=coerce(1)
  for _ in range(n):c=c*a
  return c
 def sub(a,vs):
  c=P()
  for e,v in a.items():
   t=coerce(v)
   for z,n in zip(vs,e):t=t*z**n
   c=c+t
  return c
def coerce(x):return x if isinstance(x,P) else P({(0,0,0):Q(x)})
i=P({(1,0,0):Q(1)});j=P({(0,1,0):Q(1)});b=P({(0,0,1):Q(1)})
D=i+j;N=D+1-b;C=b*N+N-3*b-1
T=N*(N-1)*i*(i-1)+2*C*i*j+b*(b-1)*j*(j-1)
raw=2*D*(D-1)*(j+2)*(b*(j+1)+N*i)**2-(j+1)*(D+2)*(D+1)*T
ambient=(N-1)*D*(D-1)*(i+2)*(N*(i+1)+b*j)**2-N*(i+1)*(D+2)*(D+1)*T
def interval(p):
 # b=(i+j+1)*z/(2*(1+z)), clear 2^k(1+z)^k.
 k=max(e[2] for e in p);z=b;c=P()
 for (u,v,w),q in p.items():c=c+q*2**(k-w)*i**u*j**v*(i+j)**w*z**w*(1+z)**(k-w)
 return c
def record(p):return dict(terms=len(p),negative_terms=[[list(k),str(v)] for k,v in p.items() if v<0],coefficients=[[list(k),str(v)] for k,v in sorted(p.items())])
