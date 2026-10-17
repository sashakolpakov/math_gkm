"""Machine-authored exact polynomial exploration; experimental, not Lean proof."""
from fractions import Fraction as F
from math import comb
from pathlib import Path
import json
class P(dict):
 def __add__(a,b):
  if not isinstance(b,P):b=P({(0,0):F(b)})
  z=P(a)
  for m,c in b.items():z[m]=z.get(m,0)+c
  return P({m:c for m,c in z.items() if c})
 __radd__=__add__
 def __neg__(a):return P({m:-c for m,c in a.items()})
 def __sub__(a,b):return a+-b
 def __mul__(a,b):
  if not isinstance(b,P):b=P({(0,0):F(b)})
  z=P()
  for (i,j),c in a.items():
   for (k,l),d in b.items():z[i+k,j+l]=z.get((i+k,j+l),0)+c*d
  return P({m:c for m,c in z.items() if c})
 __rmul__=__mul__
 def __truediv__(a,b):return a*F(1,b)
 def __pow__(a,n):
  z=P({(0,0):F(1)})
  for _ in range(n):z=z*a
  return z
x=P({(1,0):F(1)});y=P({(0,1):F(1)})
def C(p,n):
 z=P({(0,0):F(1)})
 for k in range(n):z=z*(p-k)/(k+1)
 return z
def L(d,j,t):return sum((C(d,t-m)*comb(t+m+3,m)*(C(j+t+3,t+m+3)+4*C(j+t+4,t+m+5)) for m in range(t+1)),P())
def S(H,T,t):return sum((comb(t+l,t)*comb(H,t+3-l)*(C(T,t+l)+4*C(T+1,t+l+2)) for l in range(t+4)),P())
out={}
gap=L(y+2,x+1,1)**2-L(y,x+2,0)*L(y+4,x,2)
out['lower']={'terms':len(gap),'negative':[(str(m),str(c)) for m,c in gap.items() if c<0]}
for h in (4,5,6,7):
 # k=j+5-H, use j=x+max(H-5,0), k=x+max(5-H,0)
 k=x+max(5-h,0)
 g=S(h,k+1,1)**2-S(h,k,0)*S(h,k+2,2)
 out[str(h)]={'terms':len(g),'negative':[(str(m),str(c)) for m,c in g.items() if c<0]}
out['status']='Symbolic exact rational expansions; kernel certification pending'
Path('evidence/markov-bebe7940/base-polynomial-probe.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out))
