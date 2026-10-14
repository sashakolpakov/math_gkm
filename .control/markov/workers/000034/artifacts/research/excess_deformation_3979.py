"""Exact generalized excess-kernel test. Uniform base powers are a proposed invariant."""
from math import comb
from functools import lru_cache
import json,pathlib,time
def nb(p,n):
    return 0 if n<0 else (int(n==0) if p==0 else comb(p+n-1,n))
@lru_cache(None)
def f(s,p,q,i,j):
    return sum(comb(2*s,k)*nb(s+p,i-k)*nb(s+q,j-2*s+k)
               for k in range(max(0,2*s-j),min(2*s,i)+1))
def main():
    start=time.monotonic(); checks=0; failures={}
    for p in range(6):
        for q in range(6):
            for s in range(9):
                for i in range(20):
                    for j in range(20):
                        a=f(s,p,q,i,j); b=f(s+1,p,q,i+1,j); c=f(s+2,p,q,i+2,j)
                        checks+=1
                        if b*b<a*c:
                            failures.setdefault('horizontal',dict(p=p,q=q,s=s,i=i,j=j,coefficients=[a,b,c]))
            f.cache_clear()
    r=dict(status='finite exact experiment only',checks=checks,failures=failures,
           bounds=dict(p_max=5,q_max=5,s_max=8,i_max=19,j_max=19),seconds=time.monotonic()-start)
    pathlib.Path('evidence/markov-3979f3c7/excess-deformation.json').write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps(r))
if __name__=='__main__':main()
