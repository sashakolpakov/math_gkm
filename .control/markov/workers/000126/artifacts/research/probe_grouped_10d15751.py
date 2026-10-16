"""Machine-authored grouped closure probes. Exact finite observations, not proofs."""
from experiment_8833 import add,mul
from pathlib import Path
from math import gcd
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-10d15751')
one={(0,0):1};x={(1,0):1};y={(0,1):1};h=add(one,x)
def astep(f,g):return mul(y,add(mul(h,f),mul(x,g))),add(f,g)
def cstep(f,g):
 m=add(mul(h,f),mul(x,g));return add(f,mul(mul(y,h),m)),m
def row(p,r):return {i:v for (i,j),v in p.items() if j==r}
def mix(p,q,k):return 2*p.get(k+1,0)*q.get(k+1,0)-p.get(k,0)*q.get(k+2,0)-q.get(k,0)*p.get(k+2,0)
def check_pair(p,q,kind,meta):
 for k in range(max(max(p,default=0),max(q,default=0))+1):
  counts[kind]=counts.get(kind,0)+1
  gap=mix(p,q,k)
  if gap<0:
   failures[kind]=failures.get(kind,0)+1
   if kind not in examples:examples[kind]=dict(**meta,index=k,p=[p.get(k+t,0) for t in range(3)],q=[q.get(k+t,0) for t in range(3)],mixed_gap=gap)
counts={};failures={};examples={};seen=set();start=time.monotonic()
for b in range(2,31):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  w=[(k+1)*a//b-k*a//b for k in range(b)]
  f,g=one,{}
  for t,bit in enumerate(w):
   # All source-word prefixes are included, including intermediate A before C.
   for stage in range(2 if bit else 1):
    key=(tuple(w[:t]),stage,bit)
    if key not in seen:
     seen.add(key)
     m=add(mul(h,f),mul(x,g));hm=mul(h,m)
     maxr=max((j for i,j in f.keys()|g.keys()),default=0)
     for r in range(maxr+2):
      meta=dict(source=[a,b],prefix=t,stage=stage,row=r)
      check_pair(row(f,r),row(g,r),'same_row',meta)
      check_pair(row(mul(h,f),r),row(mul(x,g),r),'weighted_same_row',meta)
      check_pair(row(f,r),row(hm,r-1),'C_group',meta)
      check_pair(row(f,r),row(f,r),'F_LC',meta)
      check_pair(row(g,r),row(g,r),'H_LC',meta)
    f,g=astep(f,g) if stage==0 else cstep(f,g)
out=dict(status='Exact finite probes only; not root refutation or proof',denominator_bound=30,
 prefix_states=len(seen),comparisons=counts,failures=failures,first_examples=examples,seconds=time.monotonic()-start)
(O/'grouped-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
