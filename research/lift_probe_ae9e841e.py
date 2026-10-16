"""Machine-authored exact binomial lift and discrete midpoint probes."""
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ae9e841e')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def F(j,t,r):
 m=t-r
 if m<0:return 0
 return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5))
def raw(d,j,t):return C(d+j,t)*C(t+j+3,j)+4*sum((j-s)*C(d+s,t)*C(t+s+3,s) for s in range(j))
def main():
 out={'status':'finite experiments only','lift_checks':0,'midpoint_checks':0,'lift_failures':[],'midpoint_failures':[]}
 for j in range(21):
  for d in [0,1,j,2*j,3*j]:
   for t in range(d+j+3):
    x=raw(d,j,t); y=sum(C(d,r)*F(j,t,r) for r in range(t+1))
    out['lift_checks']+=1
    if x!=y:out['lift_failures'].append([d,j,t,x,y])
  for t in range(1,2*j+4):
   for r in range(t):
    for s in range(t+2):
     a=F(j,t-1,r)*F(j,t+1,s);b=F(j,t,(r+s)//2)*F(j,t,(r+s+1)//2)
     out['midpoint_checks']+=1
     if a>b and len(out['midpoint_failures'])<10:out['midpoint_failures'].append([j,t,r,s,a,b])
 (O/'lift-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
