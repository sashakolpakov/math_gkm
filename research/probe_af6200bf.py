"""Machine-authored exploratory exact tests, not proofs."""
from math import comb
from pathlib import Path
import json,time
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def T(j,d,i,h):
 return C(2*d,h)*C(2*i-2-h,i)*(C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h)) if i>=2 and 0<=h<=i-2 else 0
start=time.monotonic();out={'status':'finite experiment only','midpoint_checks':0,'midpoint_failures':[],'mixed_checks':0,'mixed_failures':[]}
for j in range(2,16):
 for d in range(9):
  for i in range(2,j+2*d+4):
   for h in range(min(2*d,i-2)+1):
    for k in range(min(2*d,i)+1):
     lhs=T(j,d,i,h)*T(j,d,i+2,k)
     m=(h+k)//2
     rhs=T(j,d,i+1,m)*T(j,d,i+1,h+k-m)
     out['midpoint_checks']+=1
     if lhs>rhs and len(out['midpoint_failures'])<10:out['midpoint_failures'].append([j,d,i,h,k,lhs,rhs])
     rhs2=2*T(j,d,i+1,h)*T(j,d,i+1,k)
     lhs2=lhs+T(j,d,i,k)*T(j,d,i+2,h)
     out['mixed_checks']+=1
     if lhs2>rhs2 and len(out['mixed_failures'])<10:out['mixed_failures'].append([j,d,i,h,k,lhs2,rhs2])
out['seconds']=time.monotonic()-start
Path('evidence/markov-af6200bf/probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
