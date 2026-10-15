"""Machine-authored exact one-cut degree-weight and coefficientwise gap probe."""
from aligned_probe_6d2c import transfer
from math import gcd,comb
from pathlib import Path
import json,time
start=time.monotonic();O=Path('evidence/markov-c4169865');counts={'graded':0,'weighted':0};fail={};inputs=[]
for b in range(3,151):
 for a in range(1,b):
  if gcd(a,b)!=1:continue
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,1)
  D=max(d for s,d,j in F if s==1);J=max(j for s,d,j in F if s==1)
  for j in range(J-1):
   gap=[0]*(2*D+1)
   for d in range(D+1):
    for e in range(D+1):gap[d+e]+=F.get((1,d,j+1),0)*F.get((1,e,j+1),0)-F.get((1,d,j),0)*F.get((1,e,j+2),0)
   counts['graded']+=len(gap)
   if min(gap)<0 and 'graded' not in fail:fail['graded']=dict(a=a,b=b,j=j,gap=gap)
  for l in range(D+1):
   for u in range(l,D+1):
    m=u-l
    for name,wt in [('decreasing',[100**(m-d) for d in range(m+1)]),('binomial',[comb(m,d) for d in range(m+1)]),('nb_decreasing',[comb(m-d+3,3) for d in range(m+1)])]:
     vals=[sum(wt[d-l]*F.get((1,d,j),0) for d in range(l,u+1)) for j in range(J+1)]
     for j in range(J-1):
      counts['weighted']+=1;g=vals[j+1]**2-vals[j]*vals[j+2]
      if g<0 and 'weighted' not in fail:fail['weighted']=dict(a=a,b=b,j=j,interval=[l,u],weights=wt,shape=name,values=vals[j:j+3],gap=g)
  inputs.append([a,b]);rec=dict(status='finite exact test only',inputs=inputs,checks=counts,failures=fail,seconds=time.monotonic()-start)
  (O/'onecut-weights.json').write_text(json.dumps(rec,indent=2)+'\n')
  if fail or time.monotonic()-start>50:break
 if fail or time.monotonic()-start>50:break
print(json.dumps(dict(inputs=len(inputs),checks=counts,failures=fail,seconds=time.monotonic()-start)))
