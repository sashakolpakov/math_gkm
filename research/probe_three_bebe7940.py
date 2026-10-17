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

def A(e,a,b,J,H):
 return sum((comb(a+l,a)*C(H,b-l)*(e*C(J+a+1,a+l+1)+3*C(J+a+1,a+l+2)) for l in range(b+1)),P())
def SS(H,T,t):return sum((comb(t+l,t)*C(H,t+3-l)*(C(T,t+l)+4*C(T+1,t+l+2)) for l in range(t+4)),P())
out={}
for delta,e in [(1,2),(2,1)]:
 for region in ["lower","upper"]:
  if region=="lower":
   j=3*x+y+8-delta
   ds=[L(y+2*t,j+2-t,t) for t in range(3)]
   es=[4*A(e,t+2,t+1,x+2-t,y+2*t) for t in range(3)]
  else:
   k=3*x+y+8-delta
   ds=[SS(y+4,k+t,t) for t in range(3)]
   es=[4*A(e,t+1,t+2,x,y+4) for t in range(3)]
  for kind,g in [("signed",ds[1]**2-ds[0]*ds[2]+2*ds[1]*es[1]-ds[0]*es[2]-ds[2]*es[0]),("total",(ds[1]+es[1])**2-(ds[0]+es[0])*(ds[2]+es[2]))]:
   out[str((delta,region,kind))]=dict(terms=len(g),negative=[(str(m),str(c)) for m,c in g.items() if c<0])
Path("evidence/markov-bebe7940/column-three-probe.json").write_text(json.dumps(out,indent=2))
print(json.dumps(out))
