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


# Machine-authored request 9c28b628. Exact finite polynomial explorations.
def vparts(c,r,region,t):
 delta=1 if r else 2;e=3-delta
 if region=='low':
  j=3*x+y+c+8-delta
  return L(c+y+4-2*t,j+t,c+1),4*A(e,c+3,c+2,x+t,c+y+4-2*t)
 if region=='upper':
  j=3*x+2*y+c+10-delta;k=3*x+y+c+12-delta
  return SS(c+y+2+2*t,k+c+1-t,c+1),4*A(e,c+2,c+3,x+2-t,c+y+2+2*t)
 if region in ('entry0','entry1'):
  s=region=='entry1';j=x+c+(6-delta if s else 4-delta)
  d=L(x+c+(5 if s else 6)-2*t,j+t,c+1)
  if not s:e0=4*e*C(x+c+2,c+2) if t==2 else P()
  else:e0=4*e*C(x+c+3,c+2) if t==1 else 4*A(e,c+3,c+2,1,x+c+1) if t==2 else P()
  return d,e0
 s=region=='exit1';q=x+c+(6-delta if s else 5-delta)
 d=SS(x+c+(2 if s else 3)+2*t,q+c+(4 if s else 3)-t,c+1)
 if not s:e0=4*e*C(x+c+3,c+3) if t==0 else P()
 else:e0=4*A(e,c+2,c+3,1,x+c+2) if t==0 else 4*e*C(x+c+4,c+3) if t==1 else P()
 return d,e0
if __name__=='__main__':
 out={}
 for c in range(5):
  for r in (False,True):
   for region in ('low','upper','entry0','entry1','exit0','exit1'):
    ds,es=zip(*(vparts(c,r,region,t) for t in range(3)))
    g=(ds[1]+es[1])**2-(ds[0]+es[0])*(ds[2]+es[2])
    out[str((c,r,region))]=dict(terms=len(g),negative_count=sum(v<0 for v in g.values()),negative=[(str(m),str(v)) for m,v in g.items() if v<0][:3])
  Path('evidence/markov-9c28b628/vertical-polynomial-probe.json').write_text(json.dumps(out,indent=2))
  print(c,[v['negative_count'] for k,v in out.items() if k.startswith('('+str(c)+',')],flush=True)
