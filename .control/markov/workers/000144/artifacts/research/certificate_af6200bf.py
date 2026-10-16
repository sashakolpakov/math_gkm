"""Machine-authored exact scalar expansions. Lean must independently check identities."""
from pathlib import Path
import json
class P(dict):
 def __add__(a,b):
  if isinstance(b,int): b=P({(0,0,0,0):b})
  z=P(a)
  for k,v in b.items(): z[k]=z.get(k,0)+v
  return P({k:v for k,v in z.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  if isinstance(b,int): b=P({(0,0,0,0):b})
  z=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l)); z[m]=z.get(m,0)+v*w
  return P({k:v for k,v in z.items() if v})
 __rmul__=__mul__
k,p,r,t=[P({tuple(int(i==j) for i in range(4)):1}) for j in range(4)]
def hn(j,i,h):return (j+i+1)*(j-i+h+2)*(2*i-1-h)
def hd(i,h):return (i+1)*(i-1-h)*(2*i+1-h)
def dn(j,i,h):return (j+i+1)*(2*i-1-h)*(2*j+4+h)
def dd(j,i,h):return (i+1)*(2*i-h)*(2*j+3+h)
def hgap(j,i,h,k):return hn(j,i,h)*hd(i+1,k)-hn(j,i+1,k)*hd(i,h)
def dgap(j,i,h,k):return dn(j,i,h)*dd(j,i+1,k)-dn(j,i+1,k)*dd(j,i,h)
def lean(poly):
 return '+'.join(str(v)+''.join('*'+x+('^'+str(e) if e>1 else '') for x,e in zip(['k','p','r','t'],key) if e) for key,v in sorted(poly.items())) or '0'
cases={'horizontal':hgap(r+p+2+t,r+k+p+2,k+p,k),
       'diagonal_far':dgap(p+r+t,k+p+r+2,k,k+p+1)}
out={key:dict(terms=[[ *k,v] for k,v in sorted(q.items())],positive=all(v>=0 for v in q.values()),lean=lean(q)) for key,q in cases.items()}
Path('evidence/markov-af6200bf/scalar-certificates.json').write_text(json.dumps(out,indent=2)+'\n')
print({k:(v['positive'],len(v['terms'])) for k,v in out.items()})
