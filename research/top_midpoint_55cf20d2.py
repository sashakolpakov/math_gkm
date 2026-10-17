"""Machine-authored 55cf20d2: exact auxiliary tests, not proofs."""
from math import comb
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-55cf20d2')
def bc(n,k): return comb(n,k) if 0<=k<=n else 0
def term(d,t,i,s):
    return (1 if s==t else 4*(t-s) if s<t else 0)*bc(s-3,i-3)*bc(d+s+i+2,i)
def run():
    start=time.monotonic(); failures=[]; tested=0; mixed=[]
    for t in range(5,26):
      for d in [max(0,t-5),t,t+7,3*t,10*t]:
       for i in range(3,t-1):
        for s in range(i,t+1):
         for r in range(i+2,t+1):
          a=term(d,t,i,s)*term(d,t,i+2,r)
          b=term(d,t,i+1,(s+r)//2)*term(d,t,i+1,(s+r+1)//2)
          tested+=1
          if a>b and len(failures)<20: failures.append(dict(d=d,t=t,i=i,s=s,r=r,lhs=a,rhs=b))
        if t<12:
         for s in range(3,t+1):
          for r in range(s,t+1):
           a=term(d,t,i,s)*term(d,t,i+2,r)+term(d,t,i,r)*term(d,t,i+2,s)
           b=2*term(d,t,i+1,s)*term(d,t,i+1,r)
           if a>b and len(mixed)<5:mixed.append(dict(d=d,t=t,i=i,s=s,r=r,lhs=a,rhs=b))
    out=dict(status='finite auxiliary experiments only',midpoint_tests=tested,midpoint_failures=failures,mixed_failures=mixed,seconds=time.monotonic()-start)
    (O/'top-midpoint.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
