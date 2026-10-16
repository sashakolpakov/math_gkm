"""Machine-authored exact generalization probes; none are proofs."""
from pathlib import Path
from math import comb
from functools import lru_cache
import json,time
@lru_cache(None)
def H(a,b,n,j,r,t=2,cut=1000):
 return sum((1 if k==0 else t)*comb(n+a+j-k,j-k)*comb(n+b+r-k,r-k)
            for k in range(min(j,r,cut)+1))
def main():
 out={};start=time.monotonic()
 for a,b in [(0,0),(1,0),(2,0),(0,1),(0,2),(2,2)]:
  for t in [1,2,3]:
   fail=[None,None,None];count=0
   for n in range(5):
    for j in range(10):
     for r in range(10):
      for cut in [0,1,2,4,1000]:
       f=lambda x,y:H(a,b,x,y,r,t,cut)
       gaps=[f(n+1,j)**2-f(n,j)*f(n+2,j),
             f(n,j)*f(n+1,j+1)-f(n+1,j)*f(n,j+1),
             f(n+1,j+1)**2-f(n,j+2)*f(n+2,j)]
       count+=3
       for s,g in enumerate(gaps):
        if g<0 and fail[s] is None: fail[s]=[n,j,r,cut,g]
   out[str((a,b,t))]={'comparisons':count,'first_failures_n_minor_diag':fail}
 out['seconds']=time.monotonic()-start
 Path('evidence/markov-8f77f493/general-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
