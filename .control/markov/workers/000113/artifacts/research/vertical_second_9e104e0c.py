"""Machine-authored exact second-vertical residual algebra; candidate source formula.
Symbolic trace-jet derivation is not a Lean proof. No old generator is executed.
"""
from pathlib import Path
from fractions import Fraction
from math import gcd
import json,time
import horizontal_third_13d40bd7 as sp
from experiment_8833 import path_for,add
sp.N=4
P,poly,var=sp.P,sp.poly,sp.var
a,r,s,v=[var(i) for i in range(4)];h=1+v
O=Path('/Users/sasha/math_gkm/evidence/markov-9e104e0c')
def plus(p,q):return [x+y for x,y in zip(p,q)]
def times(p,q):return [sum((p[k]*q[n-k] for k in range(n+1)),poly(0)) for n in range(3)]
def const(p):return [poly(p),poly(0),poly(0)]
def mm(m,n):return tuple(plus(times(m[i],n[j]),times(m[i+1],n[j+2])) for i in [0,2] for j in [0,1])
eye=(const(1),const(0),const(0),const(1))
A=([v,v*h,poly(0)],[poly(2),h,poly(0)],[poly(0),v*h,poly(0)],[poly(1),h,poly(0)])
C=([poly(1),v,poly(0)],[poly(0),poly(1),poly(0)],[poly(0),v,poly(0)],[poly(0),poly(1),poly(0)])
def block(q):
 m=eye
 for _ in range(q):m=mm(m,A)
 return tuple([v**(-q)*z for z in p] for p in mm(m,C))
def seed(q):
 m,n=block(q),block(q+1)
 assert m[0][0]==poly(1) and n[0][0]==poly(1)
 d=(a-r)*m[0][1]+r*n[0][1]
 f,g=m[1][1],n[1][1]
 assert m[2][1]==v*f and n[2][1]==v*g
 assert g-f==2*v**(-q-1)
 k=(a-r)*(2*m[0][2]-m[0][1]**2)+r*(2*n[0][2]-n[0][1]**2)
 k+=2*v*(a*f*f+2*r*f*(g-f)+s*(g-f)**2)
 z=v**(2*q+1)*(d*d+k-2*h*d+2*h*h)
 assert all(min(e)>=0 for e in z),q
 return z
def terms(p):return [[list(e),str(c)] for e,c in sorted(p.items())]
def mulcut(p,q):
 z={}
 for (i,j),x in p.items():
  for (k,l),y in q.items():
   if i+k<=2:z[i+k,j+l]=z.get((i+k,j+l),0)+x*y
 return {e:x for e,x in z.items() if x}
def source2(path):
 S={(0,0):1,(1,0):1,(0,1):1};lo=(0,1,{(0,0):1});m=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
 for bit in path:
  x,z=(hi,lo) if bit else (lo,hi)
  p=add(mulcut(mulcut(S,x[2]),m[2]),{k:-v0 for k,v0 in mulcut({(x[0],x[1]):1},z[2]).items()})
  new=(m[0]+x[0],m[1]+x[1],p)
  if bit:lo,m=m,new
  else:hi,m=m,new
 return m
def divide(c):
 d=[c[0]]
 for z in c[1:-1]:d.append(z-d[-1])
 assert c[-1]==d[-1]
 return d
def evaluate(z,a0,r0):
 cs=[0]*(max(e[3] for e in z)+1)
 for e,c in z.items():cs[e[3]]+=c*a0**e[0]*r0**e[1]*max(2*r0-a0,0)**e[2]
 assert all(x.denominator==1 for x in cs)
 return [int(x) for x in cs]
def main():
 start=time.monotonic();data={};cases=positions=checks=0;fails=[]
 for q in range(1,13):
  z=seed(q);data[str(q)]=terms(z)
  for a0 in range(5,22):
   for r0 in range(1,a0):
    b0=a0*q+r0
    if gcd(a0,b0)>1:continue
    aa,bb,p=source2(path_for(a0,b0));assert (aa,bb)==(a0,b0)
    c=[p.get((2,j),0) for j in range(a0+b0+2)]
    for _ in range(a0-5):c=divide(c)
    expected=evaluate(z,a0,r0);offset=b0-2*q-1
    for j in range(len(c)):
     val=expected[j-offset] if 0<=j-offset<len(expected) else 0
     assert 2*c[j]==val,(a0,b0,j,c[j],val)
     positions+=1
    for j in range(len(expected)-2):
     checks+=1
     if expected[j]*expected[j+2]>expected[j+1]**2:fails.append([a0,b0,j,expected])
    cases+=1
 out=dict(status='Exact symbolic candidate plus finite comparisons, not a Lean source formula or universal LC proof',formula='For q=floor(b/a),r=b-aq,s=max(2r-a,0), a>=5: 2[vresidual at i=2]=v^(b-2q-1)*Q_q(a,r,s,v). Q derives from normalized A^q C trace jets.',fractions=cases,coefficient_checks=positions,lc_checks=checks,failures=fails[:8],failure_count=len(fails),q_seeds=data,seconds=time.monotonic()-start)
 (O/'vertical-second-candidate.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='q_seeds'}))
 q1=seed(1)
 print('q=1 ascending coefficient polynomials:',[terms(P({e:c for e,c in q1.items() if e[3]==i})) for i in range(6)])
if __name__=='__main__':main()
