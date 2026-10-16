"""Machine-authored exact vertical-state checks; finite evidence only."""
from experiment_8833 import add,mul,source,path_for
from pathlib import Path
from math import comb,gcd
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ea4238fc')
one={(0,0):1};x={(1,0):1};y={(0,1):1};h=add(one,x)
def mix(f,g):return add(mul(h,f),mul(x,g))
def a_step(f,g):return mul(y,mix(f,g)),add(f,g)
def c_step(f,g):
 m=mix(f,g)
 return add(f,mul(mul(y,h),m)),m
def pair(w):
 f,g=one,{}
 for bit in reversed(w):
  if bit:f,g=a_step(f,g)
  f,g=c_step(f,g)
 return f,g
start=time.monotonic();cases=positions=comparisons=zeros=0;mixed=[];fails=[]
for b in range(2,33):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  w=[(k+1)*a//b-k*a//b for k in range(b)]
  f,g=pair(w);d=a+b-1
  raw=source(path_for(a,b))[2];lhs={}
  for (i,j),v in raw.items():
   for k in range(2*i+1):lhs[j+k,i]=lhs.get((j+k,i),0)+v*comb(2*i,k)
  rhs=mul({(k,0):comb(a-1,k) for k in range(a)},g)
  assert lhs==rhs,(a,b,'source identity')
  for i in range(d+1):
   c=[g.get((j,i),0) for j in range(i+b+1)]
   assert c[-1]==comb(d,i),(a,b,i,'top')
   first=next(j for j,v in enumerate(c) if v)
   assert all(v>0 for v in c[first:]),(a,b,i,'gap')
   zeros+=c.count(0)
   for j in range(len(c)-2):
    comparisons+=1
    assert c[j]*c[j+2]<=c[j+1]**2,(a,b,i,j,'LC')
    z=lambda p,k:p.get((k,i),0)
    if z(f,j)*z(g,j+2)+z(g,j)*z(f,j+2)>2*z(f,j+1)*z(g,j+1) and len(mixed)<5:
     mixed.append(dict(a=a,b=b,column=i,index=j,F=[z(f,j+k) for k in range(3)],H=c[j:j+3]))
  cases+=1;positions+=len(lhs)
out=dict(status='Exact finite checks, not proofs',source_fractions=cases,source_coefficient_comparisons=positions,
 residual_adjacent_comparisons=comparisons,retained_zero_positions=zeros,mixed_source_obstructions=mixed,
 failures=fails,source_denominator_bound=32,seconds=time.monotonic()-start)
(O/'vertical-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
