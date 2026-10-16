"""Machine-authored exact ratio-shape experiment, not a proof."""
from pathlib import Path
from fractions import Fraction
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-fee405c8')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5)) if m>=0 else 0
start=time.monotonic();out={'status':'finite exact auxiliary experiment only','comparisons':0,'failures':[]}
for j in range(2,61):
 for t in [1,2,3,5,10,25,50,100,250]:
  a=[Fraction(L(j,t-1,m-1),L(j,t,m)) for m in range(j+1)]
  b=[Fraction(L(j,t+1,m+1),L(j,t,m)) for m in range(j+1)]
  for m in range(j):
   out['comparisons']+=2
   if a[m]>a[m+1] and len(out['failures'])<20:out['failures'].append(['A_increase',j,t,m])
   if b[m]<b[m+1] and len(out['failures'])<20:out['failures'].append(['B_decrease',j,t,m])
  for m in range(j-1):
   out['comparisons']+=2
   if a[m]+a[m+2]<2*a[m+1] and len(out['failures'])<20:out['failures'].append(['A_convex',j,t,m,str(a[m]+a[m+2]-2*a[m+1])])
   if b[m]+b[m+2]<2*b[m+1] and len(out['failures'])<20:out['failures'].append(['B_convex',j,t,m,str(b[m]+b[m+2]-2*b[m+1])])
out['seconds']=time.monotonic()-start;(O/'ratio-convexity.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
