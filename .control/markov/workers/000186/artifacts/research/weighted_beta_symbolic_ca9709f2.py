"""Machine-authored exact symbolic probe of the weighted beta mean.
No symbolic library, approximation, or external theorem is used.
"""
from pathlib import Path
from functools import lru_cache
from math import prod
from fractions import Fraction
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ca9709f2')
N=4
class P:
 def __init__(self,x=0):self.d=x if isinstance(x,dict) else ({(0,)*N:Fraction(x)} if x else {})
 def __add__(self,b):
  b=b if isinstance(b,P) else P(b);d=self.d.copy()
  for k,v in b.d.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(self):return P({k:-v for k,v in self.d.items()})
 def __sub__(self,b):return self+-co(b)
 def __rsub__(self,b):return co(b)+-self
 def __mul__(self,b):
  b=co(b);d={}
  for k,v in self.d.items():
   for l,w in b.d.items():
    z=tuple(x+y for x,y in zip(k,l));d[z]=d.get(z,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(self,n):
  p=P(1)
  for _ in range(n):p=p*self
  return p
 def ev(self,args):return sum(v*prod(args[j]**k[j] for j in range(N)) for k,v in self.d.items())
def co(x):return x if isinstance(x,P) else P(x)
def var(j):return P({tuple(int(k==j) for k in range(N)):Fraction(1)})
def muls(xs):
 p=P(1)
 for x in xs:p=p*x
 return p
@lru_cache(None)
def S(n,k):
 if n==0:return int(k==0)
 if k==0:return 0
 return S(n-1,k-1)+k*S(n-1,k)
def div_exact(f,g):
 out=P();rem=f;kg=max(g.d);vg=g.d[kg]
 while rem.d:
  k=max(rem.d);v=rem.d[k];z=tuple(x-y for x,y in zip(k,kg))
  assert min(z)>=0,(k,kg)
  q=P({z:v/vg});out=out+q;rem=rem-q*g
 return out
def klmul(f,g):
 out={}
 for (k,l),v in f.items():
  for (x,y),w in g.items():out[k+x,l+y]=out.get((k+x,l+y),P())+v*w
 return {k:v for k,v in out.items() if v.d}
def kladd(*fs):
 out={}
 for f in fs:
  for k,v in f.items():out[k]=out.get(k,P())+v
 return {k:v for k,v in out.items() if v.d}
def klscale(f,c):return {k:v*c for k,v in f.items() if (v*c).d}
def expr(p,vs):
 terms=[]
 for k,v in sorted(p.d.items()):
  assert v.denominator==1
  term=str(abs(int(v)))+''.join('*'+x+(f'^{e}' if e>1 else '') for x,e in zip(vs,k) if e)
  terms.append(('+' if v>0 else '-')+term)
 return '\n  '.join(terms).lstrip('+') or '0'
def run():
 t0=time.monotonic();a,m,r,H=[var(j) for j in range(4)]
 ak={(2,0):P(1),(1,0):H};al={(0,2):P(1),(0,1):H}
 ck={(4,0):P(1),(3,0):2*H,(2,0):H*H-H-1,(1,0):-H*(H+1)}
 cl={(l,k):v for (k,l),v in ck.items()}
 scalar=kladd(klscale(klmul(ak,al),2*(a+1)*(a+4)),klscale(kladd(ck,cl),-a*(a+3)))
 weight={(0,0):r*r,(1,0):-r,(0,1):-r,(1,1):P(1)}
 raw=klmul(weight,scalar);fall={}
 for (u,v),p in raw.items():
  for x in range(u+1):
   for y in range(v+1):
    q=S(u,x)*S(v,y)
    if q:fall[x,y]=fall.get((x,y),P())+p*q
 fall={k:v for k,v in fall.items() if v.d}
 mean=P()
 for (u,v),p in fall.items():
  mean=mean+p*muls(m-j for j in range(u+v))*muls(a+j for j in range(u))*muls(a+j for j in range(v))*muls(2*a+j for j in range(u+v,6))
 factor=2*a*a*(a+1)*m*(m-1)
 reduced=div_exact(mean,factor)
 x,y,s,z=[var(j) for j in range(4)];aa=x+1;mm=y+2;rr=mm+s+1;HH=3*aa+rr+4+z
 shifted=reduced.ev([aa,mm,rr,HH])
 shifted_boundary=reduced.ev([aa,mm,mm,3*aa+mm+4+z])
 neg=[(k,str(v)) for k,v in shifted.d.items() if v<0]
 out=dict(raw_terms=len(raw),falling_terms=len(fall),mean_terms=len(mean.d),reduced_terms=len(reduced.d),shifted_terms=len(shifted.d),negative=neg,boundary_negative=[(k,str(v)) for k,v in shifted_boundary.d.items() if v<0],reduced=[[list(k),str(v)] for k,v in sorted(reduced.d.items())],shifted=[[list(k),str(v)] for k,v in sorted(shifted.d.items())],falling={str(k):[[list(j),str(v)] for j,v in sorted(p.d.items())] for k,p in sorted(fall.items())},seconds=time.monotonic()-t0,status='exact symbolic experiment; no universal theorem until Lean validation')
 (O/'weighted-beta-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
 (O/'weighted-beta-expressions.txt').write_text('REDUCED\n'+expr(reduced,['a','m','r','H'])+'\nSHIFTED\n'+expr(shifted,['x','y','s','z'])+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['reduced','shifted','falling']}),flush=True)
 return fall,reduced,shifted
if __name__=='__main__':run()
