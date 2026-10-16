"""Machine-authored lower-region summand certificate probes; finite only."""
from pathlib import Path
from math import comb
import json,time
O=Path('evidence/markov-6799c386')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def T(j,d,i,h):return C(2*d,h)*C(2*i-2-h,i)*(C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h)) if 0<=h<i-1 else 0
out={'status':'finite auxiliary inequalities only','variants':{}}
for dr in ['vertical','diagonal']:
 for s in range(-3,4):
  fail=[];checks=0
  for j in range(1,13):
   for d in range(2,13):
    for i in range(2,12):
     for h in range(i+2):
      for k in range(i+2):
       a,b=min(h+s,k),max(h+s,k)-s
       if dr=='vertical':lhs=T(j,d,i,h)*T(j+2,d-2,i,k);rhs=T(j+1,d-1,i,a)*T(j+1,d-1,i,b)
       else:lhs=T(j+2,d-2,i,h)*T(j,d,i+2,k);rhs=T(j+1,d-1,i+1,a)*T(j+1,d-1,i+1,b)
       checks+=1
       if lhs>rhs and len(fail)<4:fail.append([j,d,i,h,k,lhs,rhs])
  out['variants'][dr+str(s)]={'checks':checks,'failures':fail}
  (O/'lower-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
