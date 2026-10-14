"""Machine-authored exact search for stronger global inequalities, not proofs."""
from math import comb
from fractions import Fraction
import json,pathlib,time,random
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q):return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q)
t=time.monotonic();fails={};ct=0;best=(Fraction(10**9),None)
for a in range(3,61):
 for j in range(2*a+1):
  arr=[sum(H(a,j,s,q) for q in range(a+1)) for s in range(1,a+1)]
  pos=[s for s,x in enumerate(arr,1) if x]
  if not pos:continue
  lo,hi=(0 if j==0 else min(pos)),max(pos)
  for s in range(1,a-1):
   L,M,R=arr[s-1:s+2]
   if not L*R:continue
   ct+=1
   cases={'factorial_s':(s+1)*M*M-(s+2)*L*R,
     'factorial_a_minus_s':(a-s-1)*M*M-(a-s)*L*R,
     'binomial_a':(s+1)*(a-s-1)*M*M-(s+2)*(a-s)*L*R,
     'support_binomial':(s+1-lo)*(hi-s-1)*M*M-(s+2-lo)*(hi-s)*L*R}
   for k,v in cases.items():
    if v<0:fails.setdefault(k,dict(a=a,j=j,s=s,lo=lo,hi=hi,values=[L,M,R],gap=v))
   rr=Fraction((s+1)*M*M,(s+2)*L*R)
   if rr<best[0]:best=rr,[a,j,s,L,M,R]
rec=dict(status='finite exact only',bound=60,triples=ct,failures=fails,best_factorial_s=[str(best[0]),best[1]],seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-be07ef75/global-probe-corrected.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
