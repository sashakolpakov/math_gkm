"""Exact experiments on arbitrary charge intervals and abstract local hypotheses.
Machine-authored be07ef75; experiments are not universal proofs.
"""
from math import comb
import json,pathlib,time,random
from fractions import Fraction
out=pathlib.Path('evidence/markov-be07ef75')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q):return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q)
t=time.monotonic();counts={'interval':0,'block_cross':0,'local_12':0};fails={}
for a in range(3,36):
 for j in range(2*a+1):
  for s in range(1,a-1):
   L=[H(a,j,s,q) for q in range(a+1)]
   M=[H(a,j,s+1,q) for q in range(a+1)]
   R=[H(a,j,s+2,q) for q in range(a+1)]
   for lo in range(a+1):
    ls=ms=rs=0
    for hi in range(lo,a+1):
     ls+=L[hi];ms+=M[hi];rs+=R[hi]
     counts['interval']+=1
     if ms*ms<ls*rs:fails.setdefault('interval',[a,j,s,lo,hi,ls,ms,rs])
     if hi>lo:
      # Same middle parameter, interval vs next singleton synchronization.
      gap=2*(ms-M[hi])*M[hi]-(ls-L[hi])*R[hi]-(rs-R[hi])*L[hi]
      counts['block_cross']+=1
      if gap<0:fails.setdefault('block_cross',[a,j,s,lo,hi,gap])
   for q in range(a-1):
    counts['local_12']+=2
    for tag,x in [('forward',L[q]*M[q+2]),('reverse',L[q+2]*M[q])]:
     if x>L[q+1]*M[q+1]:fails.setdefault('local_12_'+tag,[a,j,s,q,x,L[q+1]*M[q+1]])
rec=dict(status='finite exact only',bound=35,counts=counts,failures=fails,seconds=time.monotonic()-t)
(out/'interval-probe.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
