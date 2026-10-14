"""Machine-authored exact symbolic algebra; identities require Lean checking."""
from pathlib import Path
import json
class P(dict):
 def __add__(a,b):
  b=b if isinstance(b,P) else P({(0,0):b}); d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b if isinstance(b,P) else a+(-b)
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,P) else P({(0,0):b});d=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));d[m]=d.get(m,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  b=P({(0,0):1})
  for _ in range(n):b=b*a
  return b
def fmt(p,names=['u','v']):
 return ' + '.join(str(v)+''.join('*'+x+('^'+str(i) if i>1 else '') for x,i in zip(names,k) if i) for k,v in sorted(p.items())) or '0'
u=P({(1,0):1});v=P({(0,1):1})
r=u+1;c=r+v+1
A=(c+r-1)*(c+r-2);B=3*r*(c+r)-8*r+2;C=9*r*r-5*r+2
g1=4*B*B-A*C
r=u+v+2;c=2*u+v+3;q=v+1
B=3*r*(c+r)-8*r+2;C=9*r*r-5*r+2
g2=C*C-16*q*B
rec=dict(provenance='Live 446bbcdc exact symbolic calculation; not theorem',g1_terms=[[list(k),v] for k,v in sorted(g1.items())],g2_terms=[[list(k),v] for k,v in sorted(g2.items())],g1=fmt(g1),g2=fmt(g2),nonnegative=[all(v>=0 for v in p.values()) for p in [g1,g2]])
Path('evidence/markov-446bbcdc/cubic-certificates.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
