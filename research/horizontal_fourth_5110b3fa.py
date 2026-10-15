"""Machine-authored exact symbolic fourth horizontal moment; experiments, not proofs."""
from fractions import Fraction
from pathlib import Path
from math import gcd,comb
import json,itertools,time
import horizontal_third_13d40bd7 as sp
sp.N=10
P,poly,var=sp.P,sp.poly,sp.var
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5110b3fa'
a,b,q,t,u,v,w,z,x,h=[var(i) for i in range(10)]
def moment(f):
 c=f(0,0,0);p=f(1,0,0)-c;r=f(0,1,0)-c;s=f(0,0,1)-c
 pr=f(1,1,0)-c-p-r;ps=f(1,0,1)-c-p-s;rs=f(0,1,1)-c-r-s
 prs=f(1,1,1)-c-p-r-s-pr-ps-rs
 return b*c+a*(p+r+s)+q*(pr+rs)+t*ps+u*(ps+prs)
dd=[x*h**-2,(2*x+3)*h**-2];d2=[poly(0),h**-2]
cc=[x*h**-2,(x+2)*h**-2];c2=[poly(0),h**-2]
bb=[h**-2,(x+2)*x**-1*h**-2];b2=[poly(0),x**-1*h**-2]
aa=[h**-2,x**-1*h**-2];a2=[poly(0),x**-1*h**-2]
D=moment(lambda p,r,s:dd[p])
K=moment(lambda p,r,s:2*d2[p]-dd[p]**2+2*cc[p]*bb[r])
L=moment(lambda p,r,s:2*dd[p]**3-6*dd[p]*d2[p]+6*(cc[p]*b2[r]+c2[p]*bb[r]-cc[p]*bb[r]*(dd[p]+dd[r])+cc[p]*aa[r]*bb[s]))
def local(p,q,r,s):
 r1=bb[q]
 r2=b2[q]+aa[q]*bb[r]-bb[q]*dd[q]
 r3=aa[q]*(b2[r]+aa[r]*bb[s]-bb[r]*dd[r])+a2[q]*bb[r]-(b2[q]+aa[q]*bb[r])*dd[q]+bb[q]*(dd[q]**2-d2[q]-cc[q]*bb[r])
 g1=dd[p];g2=d2[p]+cc[p]*r1;g3=cc[p]*r2+c2[p]*r1;g4=cc[p]*r3+c2[p]*r2
 return 24*g4-24*g1*g3-12*g2**2+24*g1**2*g2-6*g1**4
loc={bits:local(*bits) for bits in itertools.product(range(2),repeat=4)}
def pot(p,q,r):return loc[p,q,r,0]+loc[q,r,0,0]+loc[r,0,0,0]
def canon(p,q,r,s):return loc[p,q,r,s]-pot(p,q,r)+pot(q,r,s)
def tri(q,r,s):return canon(0,q,r,s)-loc[0,0,0,0]
def quad(p,q,r,s):return canon(p,q,r,s)-canon(0,q,r,s)
M=b*loc[0,0,0,0]+moment(tri)+v*quad(1,0,0,1)+w*(quad(1,1,0,1)+quad(1,0,1,1))+z*quad(1,1,1,1)
Mn=x**3*h**8*M
assert all(min(e)>=0 for e in Mn)
Mn=Mn.subst([a,b,q,t,u,v,w,z,x,1+x])
Q=x**3*h**8*(D**4+6*D**2*K+3*K**2+4*D*L+M-4*h**-1*(D**3+3*D*K+L)+12*h**-2*(D**2+K)-24*h**-3*D+24*h**-4)
assert all(min(e)>=0 for e in Q)
Q=Q.subst([a,b,q,t,u,v,w,z,x,1+x])
cs=[P({tuple(0 if i==8 else z for i,z in enumerate(e)):c for e,c in Q.items() if e[8]==j}) for j in range(8)]
def counts(A,B):
 return [max(2*A-B,0),min(B-A,max(3*A-B,0)),max(3*A-2*B,0),min(B-2*A,max(4*A-B,0)) if 2*A<=B else 0,0 if 2*A<=B else 2*A-B if 3*A<=2*B else B-A,max(4*A-3*B,0)]
def seed(A,B):return [int(c.ev([A,B,*counts(A,B),1,1])) for c in cs]
def terms(p):return [[list(e),int(v) if v.denominator==1 else str(v)] for e,v in sorted(p.items())]
def lean(p,names):
 out=[]
 for e,c in sorted(p.items(),key=lambda ev:ev[0][::-1]):
  assert c.denominator==1
  mon='*'.join(n if k==1 else f'{n}^{k}' for n,k in zip(names,e) if k)
  body=(str(abs(c.numerator))+'*' if abs(c)!=1 and mon else str(abs(c.numerator)) if not mon else '')+mon
  out.append(('+' if c>0 else '-')+body)
 return ''.join(out).lstrip('+') or '0'
if __name__=='__main__':
 start=time.monotonic();fails=[];negative=[];cases=0
 for B in range(9,101):
  for A in range(3,B):
   if gcd(A,B)>1:continue
   c=seed(A,B);cases+=1
   if min(c)<0:negative.append([A,B,c])
   for k in range(6):
    if c[k]*c[k+2]>c[k+1]**2:fails.append([A,B,k,c])
 result=dict(status='Exact symbolic candidate; finite seed tests are not proof',cases=cases,negative=negative[:12],failures=fails[:12],failure_count=len(fails),moment_terms=terms(Mn),seed_terms=terms(Q),seconds=time.monotonic()-start)
 (O/'horizontal-fourth-candidate.json').write_text(json.dumps(result,indent=2)+'\n')
 (O/'horizontal-fourth-formula.txt').write_text('\n'.join(f'c{k} = '+lean(c,['a','b','q','t','u','v','w','z','x','h']) for k,c in enumerate(cs))+'\nMnum = '+lean(Mn,['a','b','q','t','u','v','w','z','x','h'])+'\n')
 print(json.dumps({k:v for k,v in result.items() if k not in ('moment_terms','seed_terms')}))
