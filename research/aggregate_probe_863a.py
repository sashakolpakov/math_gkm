"""Machine-authored exact finite tests, not a proof of Conjecture63."""
from math import comb
from fractions import Fraction
import json,pathlib,time
def C(n,k): return comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q): return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q)
start=time.monotonic(); tests=0;fail={};worst=(Fraction(0),None)
for a in range(3,45):
 for j in range(2*a+1):
  for s in range(1,a-1):
   L=[H(a,j,s,q) for q in range(a+1)]
   M=[H(a,j,s+1,q) for q in range(a+1)]
   R=[H(a,j,s+2,q) for q in range(a+1)]
   for q in range(a-1):
    tests+=1
    gap=M[q+1]**2+2*M[q]*M[q+2]-L[q]*R[q+2]-L[q+1]*R[q+1]-L[q+2]*R[q]
    if gap<0: fail.setdefault('three_charge_gap',[a,j,s,q,gap])
    denom=M[q+1]**2
    if denom:
     ratio=Fraction(L[q]*R[q+2]+L[q+2]*R[q],denom)
     if ratio>worst[0]: worst=ratio,[a,j,s,q]
    if a<=30:
     for d in (3,4,5,6):
      r=q+d
      if r>a:continue
      lo=(q+r)//2;hi=q+r-lo
      gap2=2*M[lo]*M[hi]-L[q]*R[r]-L[r]*R[q]
      if gap2<0:fail.setdefault('symmetric_midpoint_d'+str(d),[a,j,s,q,r,gap2])
out=dict(status='finite exact experiment only',bound_a=44,three_charge_tests=tests,
 failures=fail,worst_distance_two_symmetric_ratio=[str(worst[0]),worst[1]],seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-863a7482/aggregate-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out),flush=True)
