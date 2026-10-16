"""Machine-authored exact normalized-pair monotonicity probe; not a proof."""
from pathlib import Path
from fractions import Fraction
from math import comb
from functools import lru_cache
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-7e2e958e')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
@lru_cache(None)
def L(j,t,r):
 m=t-r
 if m<0 or m>j:return 0
 return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def main():
 start=time.monotonic();out={'status':'finite exact auxiliary experiments only','comparisons':0,'failures':[]}
 for j in range(1,36):
  for t in range(1,2*j+3):
   for v in range(2*(t-j),2*t+1):
    old=None
    for r in range(max(t-j,v-t),v//2+1):
     s=v-r
     a=L(j,t,r);b=L(j,t,s)
     if not a*b:continue
     z=2-Fraction(L(j,t-1,r)*L(j,t+1,s)+L(j,t-1,s)*L(j,t+1,r),a*b)
     if old is not None:
      out['comparisons']+=1
      if z<old and len(out['failures'])<10:out['failures'].append({'j':j,'t':t,'sum':v,'r':r,'previous':str(old),'next':str(z)})
     old=z
 out['seconds']=time.monotonic()-start;(O/'pair-ratio.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
