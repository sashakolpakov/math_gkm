"""Machine-authored exact tests of untransposed kernel; experiments only."""
from pathlib import Path
from math import comb
from functools import lru_cache
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-7e2e958e')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
@lru_cache(None)
def K(d,s,t):return C(d+s,t)*C(t+s+3,s) if s>=0 and t>=0 else 0
def main():
 start=time.monotonic();o={'status':'finite exact experiments only','midpoint_checks':0,'midpoint_failures':[],'aligned_checks':0,'aligned_failures':[]}
 for d in range(16):
  for s in range(18):
   for u in range(s,18):
    for t in range(1,d+u+3):
     a,b=(s+u)//2,(s+u+1)//2
     mid=K(d,a,t)*K(d,b,t)
     for left in [K(d,s,t-1)*K(d,u,t+1),K(d,s,t+1)*K(d,u,t-1)]:
      o['midpoint_checks']+=1
      if left>mid and len(o['midpoint_failures'])<10:o['midpoint_failures'].append([d,s,u,t,left,mid])
     # Four-functions local monotone pairing (shift by one).
     left=K(d,s,t-1)*K(d,u,t+1)
     right=K(d,s+1,t)*K(d,u-1,t)
     if s+1<=u:
      o['aligned_checks']+=1
      if left>right and len(o['aligned_failures'])<10:o['aligned_failures'].append([d,s,u,t,left,right])
 o['seconds']=time.monotonic()-start;(O/'kernel-probe.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
