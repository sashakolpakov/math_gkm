"""Machine-authored exact source/residual experiment; not a universal proof."""
from pathlib import Path
from math import gcd,comb
import json,time
from experiment_8833 import source,path_for,add,mul
O=Path('/Users/sasha/math_gkm/evidence/markov-9e104e0c')
def divide(c):
 d=[c[0]]
 for v in c[1:-1]:d.append(v-d[-1])
 assert c[-1]==d[-1]
 return d
def mm(m,n):return tuple(add(mul(m[i],n[j]),mul(m[i+1],n[j+2])) for i in [0,2] for j in [0,1])
one={(0,0):1};z={(1,0):1};v={(0,1):1};h=add(one,v);hz=mul(h,z)
A=(mul(v,add(one,hz)),add({(0,0):2},hz),mul(v,hz),add(one,hz))
C=(add(one,mul(v,z)),z,mul(v,z),z);B=mm(A,C)
def matres(a,b):
 m=(one,{}, {},one)
 for k in range(b):m=mm(m,B if (k+1)*a//b>k*a//b else A)
 return add(add(m[0],m[1]),{k:-x for k,x in add(m[2],m[3]).items()})
start=time.monotonic();fractions=rows=checks=zeros=identities=0;failures=[];supports=[];negative=[];matrixcases=0
for b in range(2,45):
 for a in range(1,b):
  if gcd(a,b)>1:continue
  _,_,p=source(path_for(a,b));fractions+=1
  if b<=16:
   d=matres(a,b);left={}
   for (i,j),v0 in p.items():
    for k in range(2*i+1):left[i,j+k]=left.get((i,j+k),0)+v0*comb(2*i,k)
   right=mul({(0,k):comb(a-1,k) for k in range(a)},d)
   assert left==right,(a,b,'matrix identity')
   assert all(v0>=0 for v0 in d.values())
   matrixcases+=1;identities+=len(left)
  for i in range(a+b+1):
   c=[p.get((i,j),0) for j in range(a+b+2)];zeros+=c.count(0)
   n=max(a-2*i-1,0)
   for _ in range(n):c=divide(c)
   rows+=1
   if min(c)<0:negative.append([a,b,i,c])
   pos=[j for j,v0 in enumerate(c) if v0>0]
   if pos and any(c[k]==0 for k in range(min(pos),max(pos)+1)):supports.append([a,b,i,c])
   for j in range(len(c)-2):
    checks+=1
    if c[j]*c[j+2]>c[j+1]**2:failures.append([a,b,i,j,c])
out=dict(status='Exact finite experiments only',fractions=fractions,rows=rows,triples=checks,zero_positions=zeros,matrix_cases=matrixcases,matrix_coefficients=identities,negative=negative[:10],support_failures=supports[:10],lc_failure_count=len(failures),lc_failures=failures[:10],seconds=time.monotonic()-start)
(O/'vertical-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
