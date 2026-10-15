"""Machine-authored uniform horizontal residual scan. Exact finite evidence only."""
from pathlib import Path
from math import gcd,comb
import json,time
from experiment_8833 import source,path_for
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5110b3fa'
start=time.monotonic();fractions=rows=checks=zeros=0;division_failures=[];negative=[];lc_failures=[];support_failures=[]
for b in range(2,61):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b);fractions+=1
  for j in range((b-1)//2+1):
   c=[p.get((i,j),0) for i in range(a+b+2)];zeros+=c.count(0)
   n=b-2*j-1
   for _ in range(n):
    d=[c[0]]
    for k in range(1,len(c)-1):d.append(c[k]-d[-1])
    if c[-1]!=d[-1]:division_failures.append([a,b,j]);break
    c=d
   rows+=1
   if min(c)<0:negative.append([a,b,j,c])
   pos=[k for k,v in enumerate(c) if v>0]
   if pos and any(c[k]==0 for k in range(min(pos),max(pos)+1)):support_failures.append([a,b,j,c])
   for k in range(len(c)-2):
    checks+=1
    if c[k]*c[k+2]>c[k+1]**2:lc_failures.append([a,b,j,k,c])
result=dict(status='Finite exact quotient experiment, not proof',domain='Every reduced 1<=a<b<=60, 0<=j<=floor((b-1)/2); exact quotient by (1+u)^(b-2j-1)',fractions=fractions,rows=rows,triples=checks,raw_zero_positions=zeros,division_failures=division_failures,negative=negative[:10],negative_count=len(negative),lc_failures=lc_failures[:10],lc_failure_count=len(lc_failures),support_failures=support_failures[:10],seconds=time.monotonic()-start)
(O/'uniform-horizontal-experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ('lc_failures','negative','support_failures')}))
