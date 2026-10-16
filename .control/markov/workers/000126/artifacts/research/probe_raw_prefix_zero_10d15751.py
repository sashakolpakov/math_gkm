"""Exact raw prefix probe, separate from the published source family."""
from experiment_8833 import add,mul
from pathlib import Path
from math import gcd
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-10d15751')
one={(0,0):1};x={(1,0):1};y={(0,1):1};h=add(x,one)
def astep(q,p):return mul(y,add(q,mul(x,p))),add(q,mul(h,p))
def cstep(q,p):
 pp=add(q,mul(x,p));return add(q,mul(y,pp)),pp
start=time.monotonic();seen=set();count=0;examples={};failures={}
for b in range(2,43):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  w=[(k+1)*a//b-k*a//b for k in range(b)]
  q,p=one,{}
  for t,bit in enumerate(w):
   q,p=astep(q,p)
   if bit:q,p=cstep(q,p)
   key=tuple(w[:t+1])
   if key in seen:continue
   seen.add(key)
   degree=max((i+j for i,j in p),default=0)
   for i,j in ((i,j) for i in range(degree+2) for j in range(degree+2-i)):
    v=p.get((i,j),0)
    for name,(di,dj) in [('horizontal',(1,0)),('vertical',(0,1)),('diagonal',(1,-1))]:
     left=p.get((i-di,j-dj),0);right=p.get((i+di,j+dj),0);count+=1
     if v*v<left*right:
      failures[name]=failures.get(name,0)+1
      if name not in examples:examples[name]=dict(source=[a,b],prefix=t+1,word=list(key),center=[i,j],triple=[left,v,right],gap=v*v-left*right,complete_source=t+1==b)
out=dict(status='Finite exact strategy probe; non-source prefixes are not root witnesses',denominator_bound=42,
 zero_centers_retained=True,prefix_count=len(seen),comparisons=count,failures=failures,first_examples=examples,seconds=time.monotonic()-start)
(O/'raw-prefix-zero-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
