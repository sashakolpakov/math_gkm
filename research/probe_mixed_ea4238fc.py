"""Machine-authored source-specific mixed-term probe; finite evidence only."""
from experiment_8833 import add,mul
from pathlib import Path
from math import gcd
import json,time,itertools
O=Path('/Users/sasha/math_gkm/evidence/markov-ea4238fc')
one={(0,0):1};x={(1,0):1};y={(0,1):1};h=add(one,x);h2=mul(h,h)
def a_step(f,g):return mul(y,add(mul(h,f),mul(x,g))),add(f,g)
def c_step(f,g):
 m=add(mul(h,f),mul(x,g));return add(f,mul(mul(y,h),m)),m
def pair(w):
 f,g=one,{}
 for bit in w:
  f,g=a_step(f,g)
  if bit:f,g=c_step(f,g)
 return f,g
def row(p,r):return {(i,0):v for (i,j),v in p.items() if j==r}
start=time.monotonic();tests=0;witnesses=[];cases=0
for b in range(2,21):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  w=[(k+1)*a//b-k*a//b for k in range(b)]
  f,g=pair(w)
  for r in range(a+b+1):
   terms=[mul(x,row(f,r)),mul(x,row(g,r)),mul(h2,row(f,r-1)),mul(mul(x,h),row(g,r-1))]
   for s,t in itertools.combinations(range(4),2):
    for k in range(a+r+2):
     p=[terms[s].get((k+l,0),0) for l in range(3)]
     q=[terms[t].get((k+l,0),0) for l in range(3)]
     tests+=1
     if p[0]*q[2]+q[0]*p[2]>2*p[1]*q[1] and len(witnesses)<10:
      witnesses.append(dict(source=[a,b],row=r,index=k,term_indices=[s,t],first=p,second=q,
       interpretation='Terms in H after appending B to an actual source state; not a source counterexample.'))
  cases+=1
out=dict(status='Exact finite strategy experiment only',source_fractions=cases,tests=tests,
 summand_synchronization_failures=witnesses,seconds=time.monotonic()-start)
(O/'mixed-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
