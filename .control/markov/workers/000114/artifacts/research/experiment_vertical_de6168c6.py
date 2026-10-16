"""Machine-authored de6168c6. Exact raw recurrence versus q=1 closed formula.
Finite comparisons only. Imported prior modules have guarded mains.
"""
from pathlib import Path
from math import gcd,comb
import json,time,hashlib
from vertical_second_9e104e0c import source2
from experiment_8833 import path_for
O=Path('/Users/sasha/math_gkm/evidence/markov-de6168c6')
def seed(a,r):
 s=max(2*r-a,0)
 return [8*s,16*r*r,24*r*r+24*a*r+8*a-40*r,
 17*r*r+34*a*r+9*a*a-45*r-5*a+2,
 6*r*r+18*a*r+12*a*a-16*r-16*a+4,
 r*r+4*a*r+4*a*a-3*r-6*a+2]
def main():
 start=time.monotonic(); cases=positions=checks=zeros=0;data=[]
 for a in range(5,81):
  for r in range(1,a):
   b=a+r
   if gcd(a,b)!=1:continue
   path=path_for(a,b);aa,bb,p=source2(path);assert (aa,bb)==(a,b)
   cs=seed(a,r);raw=[p.get((2,j),0) for j in range(a+b+3)]
   expected=[0]*len(raw)
   for k,c in enumerate(cs):
    for m in range(a-4):expected[b-3+k+m]+=c*comb(a-5,m)
   assert [2*c for c in raw]==expected,(a,b)
   positions+=len(raw);zeros+=sum(c==0 for c in raw)
   for j in range(len(raw)-2):
    if a*b<=2*b+a*j and 2+j+2<=a+b-1:
     assert raw[j]*raw[j+2]<=raw[j+1]**2,(a,b,j)
     checks+=1
   assert all(cs[j]*cs[j+2]<=cs[j+1]**2 for j in range(4))
   data.append(dict(a=a,b=b,path=path,seed=cs,raw_sha256=hashlib.sha256(json.dumps(raw).encode()).hexdigest()))
   cases+=1
 out=dict(status='Finite exact experiment; not a universal proof',a_range=[5,80],fractions=cases,
   coefficient_identities=positions,polygon_valid_inequalities=checks,retained_raw_zeros=zeros,
   failures=[],cases=data,seconds=time.monotonic()-start)
 (O/'vertical-second-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='cases'}))
if __name__=='__main__':main()
