"""Machine-authored 8f77f493. Exact finite strategy tests, not proofs."""
from math import comb
from functools import lru_cache
from pathlib import Path
import json,time
def C(n,k): return comb(n,k) if 0 <= k <= n else 0
def term(n,j,r,k):
    return (1 if k==0 else 2)*C(n+j+2-k,j-k)*C(n+r-k,r-k) if 0<=k<=min(j,r) else 0
@lru_cache(None)
def H(n,j,r): return sum(term(n,j,r,k) for k in range(min(j,r)+1))
def main():
    out={'status':'finite exact tests only','strategies':{}}; t=time.monotonic()
    for kind in ['n_lc','minor']:
      for shift in range(-2,3):
        fail=None; count=0
        for n in range(1,10):
          if fail: break
          for j in range(12):
            if fail: break
            for r in range(12):
              if fail: break
              for k in range(min(j+1,r)+1):
                if fail: break
                for l in range(min(j+1,r)+1):
                  a,b=min(k,l+shift),max(k-shift,l)
                  if kind=='n_lc':
                    lhs=term(n,j,r,k)*term(n+2,j,r,l)
                    rhs=term(n+1,j,r,a)*term(n+1,j,r,b)
                  else:
                    lhs=term(n+1,j,r,k)*term(n,j+1,r,l)
                    rhs=term(n,j,r,a)*term(n+1,j+1,r,b)
                  count+=1
                  if lhs>rhs: fail=dict(n=n,j=j,r=r,k=k,l=l,a=a,b=b,lhs=lhs,rhs=rhs);break
        out['strategies'][f'{kind}_{shift}']={'checks':count,'failure':fail}
    out['seconds']=time.monotonic()-t
    Path('evidence/markov-8f77f493/strategy-probe.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out))
if __name__=='__main__': main()
