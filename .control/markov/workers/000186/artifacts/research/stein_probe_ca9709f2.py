"""Machine-authored exact telescoping representation probe, not a proof."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ca9709f2')
def add(*ps):
 z=[F(0)]*max(map(len,ps))
 for p in ps:
  for j,v in enumerate(p):z[j]+=v
 while len(z)>1 and not z[-1]:z.pop()
 return z
def scale(p,c):return [v*c for v in p]
def mul(*ps):
 z=[F(1)]
 for p in ps:
  q=[F(0)]*(len(z)+len(p)-1)
  for j,v in enumerate(z):
   for k,w in enumerate(p):q[j+k]+=v*w
  z=q
 return z
def ev(p,x):return sum(v*x**j for j,v in enumerate(p))
def scalar(a,H,k,l):
 return add(scale(mul(k,add([H],k),l,add([H],l)),2*(a+1)*(a+4)),scale(add(mul(k,add(k,[-1]),add([H],k),add([H+1],k)),mul(l,add(l,[-1]),add([H],l),add([H+1],l))),-a*(a+3)))
def solve(a,m,r,H):
 k=[0,1];l=[m,-1];ff=scalar(a,H,k,l)
 g=mul([r,-1],[r-m,1],ff);rem=g.copy();P=[F(0)]*6
 for j in reversed(range(6)):
  shifted=[comb(j,k) for k in range(j+1)]
  Dj=add(mul([a,1],[m,-1],shifted),scale(mul([0,1],[a+m,-1],[0]*j+[1]),-1))
  assert Dj[-1]==-(2*a+j)
  c=rem[j+1]/Dj[-1] if j+1<len(rem) else F(0);P[j]=c
  rem=add(rem,scale(Dj,-c))
 assert len(rem)==1
 return rem[0],P,ff
def run():
 t=time.monotonic();out=dict(cases=0,identity_failures=[],mean_nonpositive=0,boundary_negative=0,uniform_bound_failures=0,a2_bound_failures=0,first_a2_failures=[])
 for a in range(2,13):
  for r in range(5,34):
   H=3*a+r+4
   for m in range(r,2*r):
    n=m-r;L=r-n;C,P,ff=solve(a,m,r,H)
    W=lambda k:comb(a+k-1,a-1)*comb(a+m-k-1,a-1)
    mass=sum(W(k) for k in range(n,r+1));Wn=W(n)
    boundary=L*ev(ff,n)-4*n*(a+r)*ev(P,n)
    actual=sum(W(k)*(1 if k==r else 4*(r-k))*(1 if m-k==r else 4*(r-(m-k)))*ev(ff,k) for k in range(n,r+1))
    predicted=16*C*mass+8*Wn*boundary
    out['cases']+=1
    if actual!=predicted:out['identity_failures'].append([a,r,m,str(actual),str(predicted)])
    if C<=0:out['mean_nonpositive']+=1
    if boundary<0:out['boundary_negative']+=1
    if 2*C*(L+1)+boundary<=0:out['uniform_bound_failures']+=1
    a2ratio=F(sum((k+1)*(m-k+1) for k in range(n,r+1)),(n+1)*(r+1))
    if 2*C*a2ratio+boundary<=0:
     out['a2_bound_failures']+=1
     if len(out['first_a2_failures'])<15:out['first_a2_failures'].append([a,r,m,str(2*C*a2ratio+boundary)])
 out.update(seconds=time.monotonic()-t,status='finite exact telescoping identity and bound experiments only')
 (O/'stein-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
if __name__=='__main__':run()
