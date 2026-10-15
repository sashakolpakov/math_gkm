"""Machine-authored literal recurrence comparison, including every zero position."""
from horizontal_third_13d40bd7 import *
from experiment_8833 import source,path_for
import time
start=__import__('time').monotonic();cases=checks=zeros=triples=0
for B in range(7,41):
 for A in range(2,B):
  if gcd(A,B)>1:continue
  aa,bb,p=source(path_for(A,B));assert (aa,bb)==(A,B)
  cs=rowseed(A,B)
  for i in range(A+B+4):
   v=sum(c*comb(B-7,i-(A-2)-k) for k,c in enumerate(cs) if 0<=i-(A-2)-k<=B-7)
   assert v==6*p.get((i,3),0),(A,B,i,v,p.get((i,3),0))
   checks+=1;zeros+=p.get((i,3),0)==0
   if i+2+3<=A+B-1 and B*i+3*A>=A*B:
    assert p.get((i,3),0)*p.get((i+2,3),0)<=p.get((i+1,3),0)**2
    triples+=1
  cases+=1
result=dict(status='Finite exact observations only, not proof',cases=cases,coefficient_identities=checks,zeros=zeros,polygon_valid_triples=triples,inputs='Every reduced 2<=a<b, 7<=b<=40; all tested row positions including zeros',seconds=time.monotonic()-start)
(O/'horizontal-third-experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
