"""Machine-authored comparison with literal raw source recurrence; zeros retained."""
from horizontal_fourth_5110b3fa import *
from experiment_8833 import source,path_for
start=time.monotonic();cases=checks=zeros=triples=0;failures=[]
for B in range(9,49):
 for A in range(3,B):
  if gcd(A,B)>1:continue
  aa,bb,p=source(path_for(A,B));assert (aa,bb)==(A,B)
  c=seed(A,B)
  for i in range(A+B+5):
   value=sum(vv*comb(B-9,i-(A-3)-k) for k,vv in enumerate(c) if 0<=i-(A-3)-k<=B-9)
   raw=p.get((i,4),0);checks+=1;zeros+=raw==0
   if value!=24*raw:failures.append(['formula',A,B,i,value,raw])
   if i+6<=A+B-1 and B*i+4*A>=A*B:
    triples+=1
    if raw*p.get((i+2,4),0)>p.get((i+1,4),0)**2:failures.append(['lc',A,B,i])
  cases+=1
result=dict(status='Finite exact experiment, not proof',fractions=cases,coefficient_identities=checks,zeros=zeros,polygon_valid_triples=triples,failures=failures,domain='Every reduced 3<=a<b, 9<=b<=48; every row position through a+b+4',seconds=time.monotonic()-start)
(O/'horizontal-fourth-experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
