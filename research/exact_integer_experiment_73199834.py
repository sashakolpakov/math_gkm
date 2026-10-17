"""Machine-authored finite exact checks of integer-group and central identities.
No experiment constitutes a universal proof.
"""
from pathlib import Path
from fractions import Fraction as F
from math import comb,prod
import json,time
from top_parameter_probe_dcb64029 import M
O=Path('/Users/sasha/math_gkm/evidence/markov-73199834')
def scalar(a,H,k,l):
 return 2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*(k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
def cut(r,k):return 1 if k==r else 4*(r-k) if k<r else 0
def run():
 start=time.monotonic();out=dict(q_identities=0,group_identities=0,total_checks=0,central_checks=0,raw_fourth_checks=0,failures=[])
 for i in [1,2,3,6,11]:
  for r in [5,6,9,15,25]:
   for d in [i+r-2,i+2*r,i+4*r]:
    a=i+1;H=d+2*i+9;Q=d+i+6;D=comb(H-1,a+2)
    q=[F(1)]
    for k in range(2*r):q.append(q[-1]*F(H+k,Q+k))
    ts=[comb(i+k,i)*comb(H+k-1,a+2) for k in range(2*r+1)]
    for k in range(2*r+1):
     out['q_identities']+=1
     if q[k]*D!=comb(H+k-1,a+2):out['failures'].append(['q',d,i,r,k])
    total=0
    for m in range(2*r+1):
     integer=sum(ts[k]*ts[m-k]*cut(r,k)*cut(r,m-k)*scalar(a,H,k,m-k) for k in range(m+1))
     rational=sum(comb(i+k,i)*comb(i+m-k,i)*q[k]*q[m-k]*cut(r,k)*cut(r,m-k)*scalar(a,H,k,m-k) for k in range(m+1))
     out['group_identities']+=1
     if integer!=D*D*rational:out['failures'].append(['group',d,i,r,m])
     if m==r:
      out['central_checks']+=1
      if integer<=0:out['failures'].append(['first-central',d,i,r])
     total+=integer
    out['total_checks']+=1
    raw=[M(d,i+r,c) for c in [i,i+1,i+2]]
    if total<=0 or raw[1]**2<=raw[0]*raw[2]:out['failures'].append(['total',d,i,r])
 for T in list(range(3,31))+[50,100,250,1000]:
  for d in [0,1,T,T*T]:
   aa,bb,cc=[M(d,T,k) for k in [1,2,3]];out['raw_fourth_checks']+=1
   if aa*cc>=bb*bb:out['failures'].append(['fourth',d,T])
 out.update(seconds=time.monotonic()-start,status='finite exact experiment only')
 (O/'integer-experiment.json').write_text(json.dumps(out,indent=2))
 print(json.dumps(out))
if __name__=='__main__':run()
