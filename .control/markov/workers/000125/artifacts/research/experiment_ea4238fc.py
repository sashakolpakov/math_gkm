"""Machine-authored exact finite probes of new positive recurrence; not proofs."""
from experiment_8833 import add,mul,source,path_for
from pathlib import Path
from math import comb,gcd
import json,time,itertools
O=Path('/Users/sasha/math_gkm/evidence/markov-ea4238fc')
one={(0,0):1};x={(1,0):1};y={(0,1):1};h=add(one,x)
h2=mul(h,h);h3=mul(h,h2);y2=mul(y,y)
def step(f,g,bit):
 if not bit:return mul(y,add(mul(h,f),mul(x,g))),add(f,g)
 return (add(mul(y,add(mul(h2,f),mul(mul(x,add(x,{(0,0):2})),g))),
             mul(y2,add(mul(h3,f),mul(mul(x,h2),g)))),
         add(mul(x,add(f,g)),mul(y,add(mul(h2,f),mul(mul(x,h),g)))))
def pair(w):
 f,g=one,{}
 for bit in w:f,g=step(f,g,bit)
 return f,g
def rows(p):
 for j in range(max((j for i,j in p),default=-1)+1):
  yield j,[p.get((i,j),0) for i in range(max((i for i,k in p if k==j),default=-1)+1)]
def check(w,p):
 a=sum(w);n=0;bad=[]
 for j,c in rows(p):
  if not c:continue
  assert len(c)==a+j+1,(w,j,'top',len(c),a+j+1)
  first=next(i for i,v in enumerate(c) if v)
  assert all(v>0 for v in c[first:]),(w,j,'gap')
  for i in range(len(c)-2):
   n+=1
   if c[i]*c[i+2]>c[i+1]**2:bad.append(dict(row=j,index=i,triple=c[i:i+3]))
 return n,bad
start=time.monotonic();cases=positions=comparisons=zeros=0;fail=[];mixed=[]
for b in range(2,39):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  w=[(k+1)*a//b-k*a//b for k in range(b)]
  f,g=pair(w);n,bad=check(w,g);assert not bad,(a,b,bad)
  raw=source(path_for(a,b))[2]
  lhs={}
  for (i,j),v in raw.items():
   for k in range(2*j+1):lhs[i+k,j]=lhs.get((i+k,j),0)+v*comb(2*j,k)
  rhs=mul({(k,0):comb(b-1,k) for k in range(b)},g)
  assert lhs==rhs,(a,b,'source identity')
  for j,c in rows(g):
   assert c[-1]==comb(a+b-1,j),(a,b,j,'top coefficient')
   zeros+=c.count(0)
   # Test the mixed adjacent condition needed for an elementary sum closure.
   for i in range(len(c)-2):
    z=lambda p,k:p.get((k,j),0)
    if z(f,i)*z(g,i+2)+z(g,i)*z(f,i+2)>2*z(f,i+1)*z(g,i+1) and len(mixed)<5:
     mixed.append(dict(a=a,b=b,row=j,index=i,F=[z(f,i+k) for k in range(3)],H=c[i:i+3]))
  cases+=1;positions+=len(lhs);comparisons+=n
  if cases%50==0:(O/'experiment-progress.json').write_text(json.dumps(dict(fractions=cases,seconds=time.monotonic()-start)))
arbitrary=[]
for n in range(1,38):
 w=[0,1]+[0]*n+[1,1] # palindromic core B A^n B; generally not source
 f,g=pair(w);nc,bad=check(w,g)
 if bad:arbitrary.append(dict(n=n,a=sum(w),b=len(w),word=w,first_failure=bad[0]))
out=dict(status='Exact finite experiments only',source_fractions=cases,source_coefficient_comparisons=positions,
 residual_adjacent_comparisons=comparisons,retained_zero_positions=zeros,failures=fail,
 mixed_source_obstructions=mixed,palindromic_non_source_residual_failures=arbitrary,
 source_denominator_bound=38,seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='palindromic_non_source_residual_failures'}))
print('palindromic first failure',arbitrary[:1])
