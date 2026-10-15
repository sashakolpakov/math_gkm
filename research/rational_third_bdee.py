"""Machine-authored exact symbolic derivation from proved run-jet formulas.
The normalization and coefficient extraction here are Python evidence, not Lean proofs.
"""
from pathlib import Path
from fractions import Fraction as F
from math import comb,gcd
from itertools import product
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bdee9a64'
DIM=8
class P(dict):
 def __add__(a,b):
  b=coerce(b);d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return clean(d)
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-coerce(b)
 def __rsub__(a,b):return coerce(b)+-a
 def __mul__(a,b):
  b=coerce(b);d={}
  for k,v in a.items():
   for l,w in b.items():
    z=tuple(i+j for i,j in zip(k,l));d[z]=d.get(z,0)+v*w
  return clean(d)
 __rmul__=__mul__
 def __pow__(a,n):
  z=coerce(1)
  for _ in range(n):z=z*a
  return z
def clean(p):return P({k:v for k,v in p.items() if v})
def coerce(p):return p if isinstance(p,P) else P({(0,)*DIM:F(p)}) if p else P()
def var(i):return P({tuple(int(i==j) for j in range(DIM)):F(1)})
N,Z,C,Rr,Q,T,U,X=map(var,range(DIM));D=1-X
def divD(p):
 groups={}
 for k,v in p.items():groups.setdefault(k[:-1],{})[k[-1]]=v
 out={}
 for pre,cs in groups.items():
  m=max(cs);last=F(0)
  for i in range(m):
   last=last+cs.get(i,0)
   if last:out[pre+(i,)]=last
  if cs.get(m,0)+last:return None
 return P(out)
class Rat:
 def __init__(self,p=0,d=0):
  self.p=coerce(p);self.d=d
  while self.d and self.p:
   q=divD(self.p)
   if q is None:break
   self.p=q;self.d-=1
  if not self.p:self.d=0
 def __add__(a,b):
  b=b if isinstance(b,Rat) else Rat(b);d=max(a.d,b.d)
  return Rat(a.p*D**(d-a.d)+b.p*D**(d-b.d),d)
 __radd__=__add__
 def __neg__(a):return Rat(-a.p,a.d)
 def __sub__(a,b):return a+-(b if isinstance(b,Rat) else Rat(b))
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,Rat) else Rat(b)
  return Rat(a.p*b.p,a.d+b.d)
 __rmul__=__mul__
 def __pow__(a,n):return Rat(a.p**n,a.d*n)
def exprval(s,n):return eval(s.replace('^','**'),{'__builtins__':{}},{'N':n,'X':X})
form=json.loads((O/'jet-candidates.json').read_text())['formulas']
def jet(e,k,q=0):
 z=form[f'{e}{k}'];return Rat((exprval(z['P'],N+q)+Z*X**q*exprval(z['Q'],N+q))*F(1,6),2*k+1)
def gauge(p,q,k):
 a,b,c,d=[jet(e,k,q) for e in range(4)];hp=jet(2,0,p);hq=jet(2,0,q)
 return (a-hq*b,b,c+hp*a-hq*d-hp*hq*b,d+hp*b)
def local(p,q,r):
 a,b,c,d=gauge(p,q,1);a2,b2,c2,d2=gauge(p,q,2);d3=gauge(p,q,3)[3]
 ka,kb,kc,kd=gauge(q,r,1);kb2=gauge(q,r,2)[1]
 return 2*d**3-6*d*d2+6*d3+6*(c*kb2+c2*kb)-6*c*kb*(d+kd)+6*c*ka
def moment(f):
 a=f[0,0,0];p=f[1,0,0]-a;q=f[0,1,0]-a;r=f[0,0,1]-a
 pq=f[1,1,0]-f[1,0,0]-f[0,1,0]+a
 pr=f[1,0,1]-f[1,0,0]-f[0,0,1]+a
 qr=f[0,1,1]-f[0,1,0]-f[0,0,1]+a
 pqr=f[1,1,1]-f[1,1,0]-f[1,0,1]-f[0,1,1]+f[1,0,0]+f[0,1,0]+f[0,0,1]-a
 return a*C+(p+q+r)*Rr+(pq+qr)*Q+pr*T+(pr+pqr)*U
def serialize(p):return [[list(k),str(v)] for k,v in sorted(p.items())]
def evalpoly(p,values):return sum(v*prod(z**a for z,a in zip(values,k)) for k,v in p.items())
def prod(zs):
 r=1
 for z in zs:r*=z
 return r
def coefficient(p,n,c,r,q,t,u,j):
 ans=F(0)
 for ks,v in p.items():
  nn,zz,cc,rr,qq,tt,uu,xx=ks;shift=zz*n+xx
  if j>=shift:ans+=v*n**nn*c**cc*r**rr*q**qq*t**tt*u**uu*comb(j-shift+5,5)
 return ans
def main():
 start=time.monotonic()
 h0=jet(3,1)+jet(2,0);h1=jet(3,1,1)+jet(2,0,1)
 k0=jet(3,2)+jet(2,1);k1=jet(3,2,1)+jet(2,1,1)
 b=jet(2,0);d=Rat(2*Z*X)
 f=h0*(C-Rr)+h1*Rr-(1+X)
 second=2*(k0*(C-Rr)+k1*Rr)+(h0*(C-Rr)+h1*Rr)**2-(h0**2*(C-Rr)+h1**2*Rr)+2*((b*C+d*Rr)*(X-1)+(b**2*C+2*b*d*Rr+d**2*Q)*X)-2*(h0*(C-Rr)+h1*Rr-1-X)*(1+X)
 loc={a:local(*a) for a in product((0,1),repeat=3)}
 third=3*f*second-2*f**3-2*(1+X)**3+moment(loc)
 assert third.d==6,third.d
 low=P({k:v for k,v in third.p.items() if k[1]==0})
 assert all(k[4:7]==(0,0,0) for k in low)
 assert max(k[-1] for k in low)==9
 # Derive the interior polynomial directly from the denominator inverse.
 J=Q;shape=P()
 for ks,v in low.items():
  nn,zz,cc,rr,qq,tt,uu,xx=ks
  binom=coerce(F(1,120))
  for a in range(5):binom=binom*(J+5-xx-a)
  shape=shape+15*v*N**nn*C**cc*Rr**rr*binom
 old=json.loads((R/'evidence/markov-8bbb934e/uniform-shape.json').read_text())
 target=P({(a,0,b,c,d,0,0,0):F(v) for (a,b,c,d),v in old['coefficient_terms']})
 assert shape==target
 symbolic_checks=0
 import uniform_probe_8bbb as prior
 for n in range(0,16):
  for c,r in [(4,1),(5,2),(5,3),(7,5),(8,7)]:
   q=max(2*r-c,0);t=min(c-r,max(3*r-c,0));u=max(3*r-2*c,0)
   arr=prior.base.candidate(n,c,r,q,t,u)
   for j in range(3*n+12):
    assert coefficient(third.p,n,c,r,q,t,u,j)==(arr[j] if j<len(arr) else 0),(n,c,r,j)
    symbolic_checks+=1
 out=dict(status='Exact Python symbolic normalization of proved component formulas; composite normalization and coefficient extraction not yet Lean-certified',variables=['n','z=X^n','c','r','q','t','u','X'],denominator_power=third.d,numerator=serialize(third.p),low_numerator=serialize(low),low_shape=serialize(shape),low_shape_matches_inherited=True,jet_checks=512,coefficient_checks=symbolic_checks,local_denominators={str(k):v.d for k,v in loc.items()},numerator_terms=len(third.p),z_degrees=sorted({k[1] for k in third.p}),low_terms=len(low),low_X_degree=9,seconds=time.monotonic()-start)
 (O/'rational-normalization.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['numerator','low_numerator','low_shape']}),flush=True)
if __name__=='__main__':main()
