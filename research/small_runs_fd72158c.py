"""Machine-authored exact symbolic experiment; certificates are not proofs until Lean checked."""
from pathlib import Path
from fractions import Fraction
import json
from rational_third_bdee import P,coerce,var,divD
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fd72158c'
N,Z,C,Rr,Q,T,U,X=map(var,range(8))
def subst(p,vs):
 out=coerce(0)
 for ks,a in p.items():
  t=coerce(a)
  for v,k in zip(vs,ks):t=t*v**k
  out=out+t
 return out
def fmt(p,names=['n','z','c','r','q','t','u','x']):
 return ' + '.join('*'.join([str(v.numerator) if v.denominator==1 else f'({v.numerator}/{v.denominator})']+[s if k==1 else f'{s}^{k}' for s,k in zip(names,ks) if k]) for ks,v in sorted(p.items())) or '0'
def serialize(p):return [[list(k),str(v)] for k,v in sorted(p.items())]
num=P({tuple(k):Fraction(v) for k,v in json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())['numerator']})
def small(n):
 p=subst(num,[coerce(n),X**n,C,Rr,Q,T,U,X])
 for _ in range(6):
  p=divD(p)
  assert p is not None
 return p
def coeffs(p):
 return [P({k[:-1]+(0,):v for k,v in p.items() if k[-1]==j}) for j in range(max(k[-1] for k in p)+1)]
def chambers():
 u,v=N,Z
 return [
 ('A1',3+v+1,coerce(1),coerce(0),coerce(0),coerce(0)),
 ('A2',3*(u+2)+v,u+2,coerce(0),coerce(0),coerce(0)),
 *[(f'B{a}{b}',3*(u+a)+2*(v+b),u+a+v+b,coerce(0),v+b,coerce(0)) for a,b in [(2,0),(1,1),(0,2)]],
 *[(f'C{a}{b}',3*(u+a)+2*(v+b),2*(u+a)+v+b,u+a,u+a+v+b,coerce(0)) for a,b in [(2,0),(1,1),(0,2)]],
 ('D1',3+v+1,2+v+1,v+1,coerce(1),v+1),
 ('D2',3*(u+2)+v,2*(u+2)+v,u+2+v,u+2,v)]
# D q=2r-c=s+t, including the s=1 branch.
chs=chambers();chs[-2]=(chs[-2][0],chs[-2][1],chs[-2][2],Z+2,coerce(1),Z+1)
polys={n:small(n) for n in [2,3]}
fail=[];checks=[]
for n,p in polys.items():
 cs=coeffs(p)
 for name,c,r,q,t,u in chs:
  arr=[subst(z,[0,0,c,r,q,t,u,0]) for z in cs]
  for j in range(len(cs)-2):
   gap=arr[j+1]**2-arr[j]*arr[j+2]
   neg=[(k,str(v)) for k,v in gap.items() if v<0]
   checks.append(dict(n=n,chamber=name,j=j,terms=len(gap),negative=len(neg)))
   if neg:fail.append(dict(n=n,chamber=name,j=j,negative=neg))
data=dict(status='Exact symbolic experiments, not universal proof',polynomials={str(n):serialize(p) for n,p in polys.items()},checks=checks,failures=fail)
(O/'small-run-symbolic.json').write_text(json.dumps(data,indent=2)+'\n')
print(json.dumps(dict(degrees={n:len(coeffs(p))-1 for n,p in polys.items()},checks=len(checks),failures=fail)))
