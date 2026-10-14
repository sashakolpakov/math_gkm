"""Machine-authored exact sparse-polynomial certificate exploration."""
from fractions import Fraction as Q
import pathlib,json,itertools,time
D=4
class P(dict):
 def __add__(a,b):
  b=poly(b);c=P(a)
  for k,v in b.items():c[k]=c.get(k,0)+v
  return P({k:v for k,v in c.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-poly(b)
 def __rsub__(a,b):return poly(b)+-a
 def __mul__(a,b):
  b=poly(b);c=P()
  for e,v in a.items():
   for f,w in b.items():
    k=tuple(x+y for x,y in zip(e,f));c[k]=c.get(k,0)+v*w
  return P({k:v for k,v in c.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  c=poly(1)
  for _ in range(n):c=c*a
  return c
 def sub(a,vs):
  powers=[[v**k for k in range(max(e[i] for e in a)+1)] for i,v in enumerate(vs)]
  c=P()
  for e,v in a.items():
   t=poly(v)
   for i,k in enumerate(e):t=t*powers[i][k]
   c=c+t
  return c
def poly(x):return x if isinstance(x,P) else P({(0,)*D:Q(x)})
vs=[P({tuple(int(i==j) for i in range(D)):Q(1)}) for j in range(D)]
s,r,m,t=vs
def norm(k,N,m,t):
 n=N-1
 A=4*t;B=9*m*m+13*m+6;C=6*m*m+6*m*n+8*m+6*n+6;E=(m+n+2)*(m+n+1)
 return k*(A*(N-k)*(N-k-1)*(N-k-2)+B*(k-1)*(N-k)*(N-k-1)+C*(k-1)*(k-2)*(N-k)+E*(k-1)*(k-2)*(k-3))
N=s+r+2
raw=norm(s+1,N,m,t)**2-norm(s,N,m,t)*norm(s+2,N,m,t)
def rat_sub(p,i,num,den):
 k=max(e[i] for e in p);z=P()
 for e,c in p.items():
  ee=list(e);ee[i]=0
  z=z+P({tuple(ee):c})*num**e[i]*den**(k-e[i])
 return z
def rec(p):return dict(terms=len(p),negative_terms=sum(c<0 for c in p.values()),coefficients=[[list(e),str(c)] for e,c in sorted(p.items())])
if __name__=='__main__':
 start=time.monotonic();out={}
 # t=(2m-1)w/(1+w), followed by m=(1+(n-1)z)/(1+z).
 p=rat_sub(raw,3,(2*m-1)*t,1+t)
 p=rat_sub(p,2,1+(s+r)*m,1+m)
 for name,sub in [('s1',[1,r+1,m,t]),('s2',[2,r,m,t]),('s3',[s+3,r,m,t])]:
  z=p.sub(sub);out[name]=rec(z);print(name,len(z),out[name]['negative_terms'],flush=True)
 pathlib.Path('evidence/markov-a27f6d42/second-symbolic.json').write_text(json.dumps(dict(seconds=time.monotonic()-start,cases=out),indent=2)+'\n')
