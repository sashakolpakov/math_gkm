"""Machine-authored exact polynomial algebra for the actual q-tilted base."""
from stein_probe_ca9709f2 import add,mul,scale,ev,scalar
from fractions import Fraction as F
from pathlib import Path
import json,math
O=Path('/Users/sasha/math_gkm/evidence/markov-20825094')
def calc(a,m,H):
 Q=H-a-2;k=[0,1];l=[m,-1];p=mul(k,l)
 B=mul([a,1],[H,1],l,[Q+m-1,-1]);D=mul(k,[Q-1,1],[a+m,-1],[H+m,-1])
 Lp=add(mul(B,[m-1,-2]),mul(D,[-m-1,2]))
 ff=scalar(a,H,k,l)
 c=F(ff[-1],Lp[-1]);rem=add(ff,scale(Lp,-c))
 assert len(rem)<=3
 cp=-rem[2];c0=rem[0]
 assert rem==add([c0],scale(p,cp))
 return c,c0,cp
def mean(a,r,m):
 H=3*a+r+4;Q=H-a-2;c=m//2;v=1.;mass=0.;tot=[]
 for k in range(c,-1,-1):
  f=1 if 2*k==m else 2
  mass+=f*v;tot.append(f*v*ev(scalar(a,H,[k],[m-k]),0))
  if k:
   l=m-k;v*=k/(a+k-1)*(a+l)/(l+1)*(Q+k-1)/(H+k-1)*(H+l)/(Q+l)
 return math.fsum(tot)/mass/(a*a*r*r*H*H)
rows=[]
for a in [2,3,10,100,1000]:
 for r in [5,50,500,5000]:
  for m in [r,3*r//2,2*r]:
   c,c0,cp=calc(a,m,3*a+r+4)
   rows.append(dict(a=a,r=r,m=m,c=str(c),c0=str(c0),cp=str(cp),center=str(c0+cp*F(m*m,4)),mean=mean(a,r,m)))
(O/'actual-stein-probe.json').write_text(json.dumps(rows,indent=2))
print(json.dumps(dict(failures=[r for r in rows if r['mean']<=0],examples=rows[-6:])))
