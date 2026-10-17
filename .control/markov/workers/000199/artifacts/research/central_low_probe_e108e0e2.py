"""Machine-authored exact polynomial probe for the remaining low columns; not proof."""
from fractions import Fraction as F
from math import comb,factorial,lcm
from pathlib import Path
import json,time
def add(*ps):
 q=[F(0)]*max(map(len,ps),default=1)
 for p in ps:
  for i,v in enumerate(p):q[i]+=v
 while len(q)>1 and not q[-1]:q.pop()
 return q
def mul(*ps):
 q=[F(1)]
 for p in ps:
  z=[F(0)]*(len(q)+len(p)-1)
  for i,v in enumerate(q):
   for j,w in enumerate(p):z[i+j]+=v*w
  q=z
 return q
def scale(p,n):return [v*n for v in p]
def cp(a,b,n):return scale(mul(*[[F(b-j),F(a)] for j in range(n)]),F(1,factorial(n)))
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def kernel(D,k0,a,b):return add(*[scale(cp(1,k0,a+l+2),C(a+l,a)*C(D+a,b-l)) for l in range(b+1)])
def raw(h,k0,c,r):
 eps=int(r);T0=3*k0+h+eps
 top=add(*[scale(add(cp(3,T0,c+l),scale(cp(3,T0+1,c+l+2),4)),C(c+l,c)*C(h+2*c+4,c+3-l)) for l in range(c+4)])
 e=h+eps
 H=lambda D,a,b:kernel(D,k0,a,b)
 corr=add(H(e+c+2,c,c+1),scale(H(e+c+3,c+1,c+2),2),H(e+c+2,c+1,c+2),H(e+c+2,c,c+2),H(e+c+3,c,c+2)) if r else add(scale(H(e+c+3,c+1,c+2),2),H(e+c+3,c,c+1),H(e+c+4,c+1,c+2),H(e+c+3,c,c+2))
 return add(top,scale(corr,4))
def run():
 t=time.monotonic();out=[]
 for c in range(10):
  for h in range(4):
   for r in [False,True]:
    k0=max(0,3-h,(c+4-h-int(r))//3)
    a,b,z=[raw(h,k0,c+j,r) for j in range(3)]
    gap=add(mul(b,b),scale(mul(a,z),-1))
    neg=[i for i,v in enumerate(gap) if v<0]
    out.append(dict(c=c,h=h,r=r,k0=k0,degree=len(gap)-1,negative=neg,coefficients=[str(v) for v in gap]))
 result=dict(cases=out,all_nonnegative=all(not v['negative'] for v in out),seconds=time.monotonic()-t,status='Exact finite symbolic coefficient observations; no Lean certificate or source inequality inference.')
 Path('evidence/markov-e108e0e2/central-low-probe.json').write_text(json.dumps(result,indent=2))
 print(json.dumps(dict(cases=len(out),all_nonnegative=result['all_nonnegative'],failures=[{k:v for k,v in z.items() if k!='coefficients'} for z in out if z['negative']],seconds=result['seconds'])))
if __name__=='__main__':run()
