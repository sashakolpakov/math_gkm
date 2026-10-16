"""Machine-authored a24fe23d. Exact exploratory inequalities, not proofs."""
from math import comb
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-a24fe23d')
def C(n,k): return comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q):return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q) if s>0 else int(q==j==0)
d={'status':'finite experiments only','checks':0,'midpoint_failures':[],'shift_failures':{}}
for a in range(3,21):
 for j in range(2*a+1):
  for s in range(1,a-1):
   for q in range(a-s+1):
    for r in range(a-s-1):
     lhs=H(a,j,s,q)*H(a,j,s+2,r)
     if not lhs:continue
     k=(q+r)//2; rhs=H(a,j,s+1,k)*H(a,j,s+1,q+r-k)
     d['checks']+=1
     if lhs>rhs and len(d['midpoint_failures'])<10:d['midpoint_failures'].append([a,j,s,q,r,lhs,rhs])
(O/'pell-probe.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(d))
