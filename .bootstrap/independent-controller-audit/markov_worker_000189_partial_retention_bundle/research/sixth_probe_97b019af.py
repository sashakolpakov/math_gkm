"""Machine-authored exact symbolic experiment: two-generator sixth-moment route.
This script produces no theorem and never overwrites inherited artifacts.
"""
from pathlib import Path
from fractions import Fraction as F
from math import prod
import json,time
from weighted_beta_symbolic_ca9709f2 import P,var,div_exact
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-97b019af'
def data(p):return [[list(k),str(v)] for k,v in sorted(p.d.items())]
def run():
 start=time.monotonic();a,m,H,k=[var(j) for j in range(4)];l=m-k
 B=(a+k)*(H+k)*l*(H-a-3+l)
 D=k*(H-a-3+k)*(a+l)*(H+l)
 scalar=2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*(k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
 x=k-m*F(1,2)
 L1=-B*((x+1)**2-x*x)-D*((x-1)**2-x*x)
 L2=-B*((x+1)**4-x**4)-D*((x-1)**4-x**4)
 def centered(p):
  p=p.ev([a,m,H,k+m*F(1,2)])
  assert all(e[3]%2==0 for e in p.d)
  return [P({(e[0],e[1],e[2],0):v for e,v in p.d.items() if e[3]==2*j}) for j in range(4)]
 f=centered(scalar);g=centered(L1);h=centered(L2)
 delta=g[1]*h[2]-g[2]*h[1]
 A=-f[1]*h[2]+f[2]*h[1];C=-g[1]*f[2]+g[2]*f[1]
 J=delta*f[0]+A*g[0]+C*h[0];K=C*h[3]
 assert not (delta*f[1]+A*g[1]+C*h[1]).d
 assert not (delta*f[2]+A*g[2]+C*h[2]).d
 # exact sixth beta central moment, from falling factorial moments in k.
 from weighted_beta_symbolic_ca9709f2 import S,muls
 denfall=muls(2*a+j for j in range(6));mom=P()
 for b in range(7):
  from math import comb
  coef=comb(6,b)*(-m*F(1,2))**(6-b)
  for j in range(b+1):
   mom=mom+coef*S(b,j)*muls(a+t for t in range(j))*muls(m-t for t in range(j))*muls(2*a+t for t in range(j,6))
 den6=64*(2*a+1)*(2*a+3)*(2*a+5)
 num6=div_exact(mom*den6,denfall)
 certificate=den6*J+K*num6
 out=dict(status='exact symbolic candidate only; generator attachment and all sign claims unproved',polynomials={n:data(p) for n,p in [('delta',delta),('A',A),('C',C),('J',J),('K',K),('den6',den6),('num6',num6),('certificate',certificate)]},generator_coefficients={'scalar':[data(p) for p in f],'L1':[data(p) for p in g],'L2':[data(p) for p in h]},tests=[])
 for aa in [3,5,10,20,50,100,500]:
  for rr in [5,10,30,100,500]:
   for mm in [rr,3*rr//2,2*rr-2,2*rr]:
    HH=3*aa+rr+4
    vals={n:str(p.ev([aa,mm,HH,0])) for n,p in [('delta',delta),('A',A),('C',C),('K',K),('certificate',certificate)]}
    out['tests'].append(dict(a=aa,r=rr,m=mm,H=HH,values=vals,valid=F(vals['delta'])>0 and F(vals['A'])>=0 and F(vals['C'])>=0 and F(vals['K'])<=0 and F(vals['certificate'])>0,fourth=4*(mm-2)<=(aa-3)**2))
 out['seconds']=time.monotonic()-start
 (O/'sixth-probe.json').write_text(json.dumps(out,indent=2))
 summary=dict(terms={n:len(p.d) for n,p in [('delta',delta),('A',A),('C',C),('J',J),('K',K),('num6',num6),('certificate',certificate)]},tests=len(out['tests']),valid=sum(t['valid'] for t in out['tests']),new=sum(t['valid'] and not t['fourth'] for t in out['tests']),seconds=out['seconds'])
 print(json.dumps(summary))
if __name__=='__main__':run()
