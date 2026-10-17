"""Machine-authored exact finite probes for request d0292f14; not proof."""
from math import comb
from pathlib import Path
import json,time
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-d0292f14'
def C(n,k): return comb(n,k) if 0<=k<=n else 0
def H(d,k,a,b):
 return sum(C(a+l,a)*C(d+a,b-l)*C(k,a+l+2) for l in range(b+1))
def correction(d,k,r,c):
 if c==0:return 0
 if c==1:return (8 if r else 4)+12*k
 if c==2:return k*(8*(d+3) if r else 4*(d+4))+4*sum((k-1-s)*gain(d+2*s+4,s,r,1) for s in range(k))
 # X times gain at column c-1.
 z=c-1
 if r:
  return 4*(H(d+z+2,k,z-2,z-1)+H(d+z+3,k,z-1,z)+
    H(d+z+2,k,z-1,z)+H(d+z+2,k,z-2,z)+
    H(d+z+3,k,z-1,z)+H(d+z+3,k,z-2,z))
 return 4*(H(d+z+3,k,z-1,z)+H(d+z+3,k,z-2,z-1)+
    H(d+z+4,k,z-1,z)+H(d+z+3,k,z-1,z)+H(d+z+3,k,z-2,z))
def fib(n,t,c):return C(t,c-1)*C(n-t-1+c,c) if c>0 else 0
def gain(q,s,r,c):
 if r:return fib(q,s,c-1)+fib(q,s,c)+fib(q,s+1,c)+fib(q+1,s+1,c)
 return fib(q,s,c)+fib(q+1,s,c-1)+fib(q+1,s,c)+fib(q+1,s+1,c)
def top(d,T,i):
 return sum(C(i+l,i)*C(d+2*i+8,i+3-l)*(C(T,i+l)+4*C(T+1,i+l+2)) for l in range(i+4))
def raw(x,k,r,c):
 return top(x,x+3*k+(5 if r else 4),c-3)+correction(x+(3 if r else 2),k,r,c)
def differences(v):
 out=[]
 while v:
  out.append(v[0]);v=[b-a for a,b in zip(v,v[1:])]
 return out
def run():
 t=time.monotonic();checks=0
 for d in range(7):
  for k in range(12):
   for a in range(6):
    for b in range(6):
     assert H(d,k,a,b)==sum((k-1-s)*C(s,a)*C(s+d,b) for s in range(k));checks+=1
   for r in [False,True]:
    for c in range(3,14):
     assert correction(d,k,r,c)==4*sum((k-1-s)*gain(d+2*s+4,s,r,c-1) for s in range(k));checks+=1
 out=dict(kernel_checks=checks,newton_cases=[],status='Finite exact experiments; no universal positivity conclusion.')
 (O/'kernel-probe.json').write_text(json.dumps(out,indent=2))
 for c in range(3,13):
  for r in [False,True]:
   # Safe separate-degree bounds from the displayed binomial formulas.
   N=4*c+6
   grid=[]
   for x in range(N+1):
    vals=[]
    for k in range(N+1):
     a,b,z=[raw(x,k,r,h) for h in range(c,c+3)]
     vals.append(b*b-a*z)
    grid.append(differences(vals))
   coeffs=[differences([grid[x][j] for x in range(N+1)]) for j in range(N+1)]
   negative=[(i,j,v) for j,col in enumerate(coeffs) for i,v in enumerate(col) if v<0]
   nonzero=[(i,j,v) for j,col in enumerate(coeffs) for i,v in enumerate(col) if v]
   case=dict(c=c,r=r,nonzero=len(nonzero),negative_count=len(negative),first_negative=negative[:3],max_total_degree=max(i+j for i,j,v in nonzero),seconds=time.monotonic()-t)
   out['newton_cases'].append(case); print(json.dumps(case),flush=True)
   (O/'kernel-probe.json').write_text(json.dumps(out,indent=2))
 out['seconds']=time.monotonic()-t
 (O/'kernel-probe.json').write_text(json.dumps(out,indent=2))
if __name__=='__main__':run()
