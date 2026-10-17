"""Machine-authored exact cleared Stein certificate exploration."""
from weighted_beta_symbolic_ca9709f2 import P,var,muls,div_exact,expr
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ca9709f2')
def add(*fs):
 out={}
 for f in fs:
  for k,v in f.items():out[k]=out.get(k,P())+v
 return {k:v for k,v in out.items() if v.d}
def sc(f,p):return {k:v*p for k,v in f.items() if (v*p).d}
def mul(*fs):
 out={0:P(1)}
 for f in fs:
  q={}
  for k,v in out.items():
   for l,w in f.items():q[k+l]=q.get(k+l,P())+v*w
  out={k:v for k,v in q.items() if v.d}
 return out
def ev(f,x):return sum((v*x**k for k,v in f.items()),P())
def run():
 t=time.monotonic();a,m,r,H=[var(j) for j in range(4)]
 k={1:P(1)};l={0:m,1:P(-1)}
 Ak=mul(k,add({0:H},k));Al=mul(l,add({0:H},l))
 ff=add(sc(mul(Ak,Al),2*(a+1)*(a+4)),sc(add(mul(Ak,add(k,{0:P(-1)}),add(k,{0:H+1})),mul(Al,add(l,{0:P(-1)}),add(l,{0:H+1}))),-a*(a+3)))
 g=mul({0:r,1:P(-1)},{0:r-m,1:P(1)},ff)
 D=muls(2*a+j for j in range(6));rem=sc(g,D);T={}
 for j in reversed(range(6)):
  Dj=add(mul({0:a,1:P(1)},{0:m,1:P(-1)},{k:P(comb(j,k)) for k in range(j+1)}),sc(mul({1:P(1)},{0:a+m,1:P(-1)},{j:P(1)}),-1))
  assert Dj[j+1].d==(-(2*a+j)).d
  cj=div_exact(rem.get(j+1,P()),-(2*a+j));T[j]=cj;rem=add(rem,sc(Dj,-cj))
 assert set(rem)<= {0}
 C=rem.get(0,P())
 # Independent exact agreement with the already formalized weighted mean.
 old=json.loads((O/'weighted-beta-symbolic.json').read_text())
 from fractions import Fraction
 R=P({tuple(k):Fraction(v) for k,v in old['reduced']})
 assert C.d==(2*a*a*(a+1)*m*(m-1)*R).d
 n=m-r;L=2*r-m
 B=2*C*(L+1)+L*D*ev(ff,n)-4*n*(a+r)*ev(T,n)
 x,y,s,z=[var(j) for j in range(4)]
 aa=x+2;nn=y;LL=s+1;rr=nn+LL;mm=2*nn+LL;HH=3*aa+rr+4+z
 BS=B.ev([aa,mm,rr,HH]);CS=C.ev([aa,mm,rr,HH])
 out=dict(cleared_mean_terms=len(C.d),antiderivative_terms={str(k):len(v.d) for k,v in T.items()},bound_terms=len(B.d),shifted_bound_terms=len(BS.d),negative_bound=[(list(k),str(v)) for k,v in BS.d.items() if v<0],negative_mean=[(list(k),str(v)) for k,v in CS.d.items() if v<0],bound=[[list(k),str(v)] for k,v in sorted(B.d.items())],shifted_bound=[[list(k),str(v)] for k,v in sorted(BS.d.items())],shifted_mean=[[list(k),str(v)] for k,v in sorted(CS.d.items())],mean=[[list(k),str(v)] for k,v in sorted(C.d.items())],antiderivative={str(k):[[list(j),str(v)] for j,v in sorted(p.d.items())] for k,p in T.items()},seconds=time.monotonic()-t,status='exact symbolic candidate; universal telescoping and positivity not Lean-proved')
 (O/'stein-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['bound','shifted_bound','shifted_mean','mean','antiderivative']}),flush=True)
if __name__=='__main__':run()
