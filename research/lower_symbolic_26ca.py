"""Exact rational sparse-polynomial discovery; experiments, not proofs."""
from fractions import Fraction as F
from math import comb,factorial
import json,pathlib
def const(n):return {(0,0):F(n)} if n else {}
def add(a,b):
 c=a.copy()
 for k,v in b.items():c[k]=c.get(k,0)+v
 return {k:v for k,v in c.items() if v}
def scale(a,n):return {k:v*n for k,v in a.items() if v*n}
def mul(a,b):
 c={}
 for (i,j),v in a.items():
  for (k,l),w in b.items():c[i+k,j+l]=c.get((i+k,j+l),0)+v*w
 return {k:v for k,v in c.items() if v}
def power(a,n):
 p=const(1)
 for _ in range(n):p=mul(p,a)
 return p
X={(1,0):F(1)};Y={(0,1):F(1)}
def shift(a,i,j):
 c={}
 for (k,l),v in a.items():c=add(c,scale(mul(power(add(X,const(i)),k),power(add(Y,const(j)),l)),v))
 return c
def choose(a,k):
 p=const(F(1,factorial(k)))
 for z in range(k):p=mul(p,add(a,const(-z)))
 return p
def formula(s):
 p={}
 for k in range(2*s+1):
  p=add(p,scale(mul(choose(add(X,const(k-s)),s),choose(add(Y,const(s-1-k)),s-1)),comb(2*s,k)))
 return p
def lean(p):
 return ' + '.join(f'({v.numerator} : ℚ)' + (f' / {v.denominator}' if v.denominator!=1 else '') + (f'*x^{i}' if i else '')+(f'*y^{j}' if j else '') for (i,j),v in sorted(p.items(),reverse=True)) or '0'
if __name__=='__main__':
 ps=[formula(s) for s in [1,2,3]]
 gaps={}
 for name,di,dj,loi,loj in [('horizontal',1,0,1,6),('vertical',0,1,3,4)]:
  g=add(power(shift(ps[1],di,dj),2),scale(mul(ps[0],shift(ps[2],2*di,2*dj)),-1))
  gaps[name]=dict(gap=lean(g),shifted=lean(shift(g,loi,loj)),nonnegative=all(v>=0 for v in shift(g,loi,loj).values()))
 out=dict(status='exact symbolic experiment only',formulas=[lean(p) for p in ps],gaps=gaps)
 pathlib.Path('evidence/markov-26ca8e85/lower-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out,indent=2))
