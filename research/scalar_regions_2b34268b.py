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
def lean(poly):
 return '+'.join(str(v)+''.join('*'+x+('^'+str(e) if e>1 else '') for x,e in zip(['k','p','r','t'],key) if e) for key,v in sorted(poly.items())) or '0'

def hn(N,i,h):return (N+i-h+1)*(N-i+2)*(2*i-1-h)
def hd(i,h):return (i-h+1)*(i-1)*(2*i+1-h)
def dn(N,i,h):return (N-i+2)*(2*i-1-h)*(2*N+2-h)
def dd(N,i,h):return (i-1)*(2*i-h)*(2*N+3-h)
def hg(N,i,h,k):return hn(N,i,h)*hd(i+1,k)-hn(N,i+1,k)*hd(i,h)
def dg(N,i,h,k):return dn(N,i,h)*dd(N,i+1,k)-dn(N,i+1,k)*dd(N,i,h)

cases={}
regions=[(k+2,p,r),(1,p+1,r),(1,0,r+1),(0,p+2,r),(0,1,r+1),(0,0,r+2)]
for n,(a,b,c) in enumerate(regions):
 cases['horizontal'+str(n)]=hg(a+b+c+t,a+b+c,a+b,a)
 cases['diagonal'+str(n)]=dg(a+b+c+t,a+b+c,a,a+b+1)
for n,(a,c) in enumerate([(k+2,r),(1,r+1),(0,r+2)]):
 cases['local'+str(n)]=hn(a+c+t,a+c,a)*dd(a+c+t,a+c+1,a)-dn(a+c+t,a+c+1,a)*hd(a+c,a)
out={key:dict(terms=[[ *k,v] for k,v in sorted(q.items())],positive=all(v>=0 for v in q.values()),lean=lean(q)) for key,q in cases.items()}
Path('evidence/markov-2b34268b/scalar-regions.json').write_text(json.dumps(out,indent=2)+'\n')
print({k:(v['positive'],len(v['terms'])) for k,v in out.items()})
