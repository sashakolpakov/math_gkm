"""Machine-authored db972d62. Reparameterized kernel shape exploration only."""
from pathlib import Path
from functools import lru_cache
from math import comb
import json,time
def C(n,r):return comb(n,r) if 0<=r<=n else 0
@lru_cache(None)
def H(n,j,r):return sum((1 if k==0 else 2)*C(n+j+2-k,j-k)*C(n+r-k,r-k) for k in range(min(j,r)+1))
def term(n,j,r,k):return (1 if k==0 else 2)*C(n+j+2-k,j-k)*C(n+r-k,r-k) if 0<=k<=min(j,r) else 0
def main():
 start=time.monotonic();out={'status':'finite exploration, not proof','checks':0,'failures':[],'term_failure':None,'minor_term_failure':None}
 for n in range(31):
  for j in range(31):
   for r in range(31):
    gaps=[H(n+1,j,r)**2-H(n,j,r)*H(n+2,j,r),
     H(n,j+1,r)**2-H(n,j,r)*H(n,j+2,r),
     H(n,j,r)*H(n+1,j+1,r)-H(n+1,j,r)*H(n,j+1,r)]
    out['checks']+=3
    if min(gaps)<0:out['failures'].append([n,j,r,gaps])
    if out['term_failure'] is None:
     for k in range(min(j,r)+1):
      if out['term_failure']:break
      for l in range(k+1):
       a=term(n,j,r,k)*term(n+2,j,r,l)+term(n,j,r,l)*term(n+2,j,r,k)
       b=2*term(n+1,j,r,k)*term(n+1,j,r,l)
       if a>b:out['term_failure']=[n,j,r,k,l,a,b];break
    if out['minor_term_failure'] is None:
     for k in range(min(j+1,r)+1):
      if out['minor_term_failure']:break
      for l in range(k+1):
       a=term(n,j,r,k)*term(n+1,j+1,r,l)+term(n,j,r,l)*term(n+1,j+1,r,k)
       b=term(n+1,j,r,k)*term(n,j+1,r,l)+term(n+1,j,r,l)*term(n,j+1,r,k)
       if a<b:out['minor_term_failure']=[n,j,r,k,l,a,b];break
 out['seconds']=time.monotonic()-start;out['bounds']={'n_j_r':[0,30]}
 Path('evidence/markov-db972d62/reduced-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
