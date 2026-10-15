"""Independent literal pinned recurrence versus cut transfer, exact integers."""
from pathlib import Path
from activity_b485 import transfer
import json
def mul(p,q):
 r={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():r[i+k,j+l]=r.get((i+k,j+l),0)+a*b
 return r
def sub(p,q):
 r=dict(p)
 for k,v in q.items():r[k]=r.get(k,0)-v
 return {k:v for k,v in r.items() if v}
def source(path):
 S={(0,0):1,(1,0):1,(0,1):1}
 lo=(0,1,{(0,0):1});mid=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
 for r in path:
  if r:
   new=(mid[0]+hi[0],mid[1]+hi[1],sub(mul(mul(S,hi[2]),mid[2]),mul({(hi[0],hi[1]):1},lo[2])))
   lo,mid=mid,new
  else:
   new=(lo[0]+mid[0],lo[1]+mid[1],sub(mul(mul(S,lo[2]),mid[2]),mul({(lo[0],lo[1]):1},hi[2])))
   hi,mid=mid,new
 return mid
results=[];checks=0
for path,pts in [([False]*6,[(1,2),(2,2),(3,2)]),([True,True,False,False],[(1,9),(2,9),(3,9)]),([True,False,True,True],[(0,11),(1,11),(2,11)])]:
 a,b,p=source(path);w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);F=transfer(w,(1,)*(b-1))
 for i in range(a+b+1):
  for j in range(a+b+1):
   assert p.get((i,j),0)==F.get((i+j-a,j),0);checks+=1
 vals=[p.get(pt,0) for pt in pts];guards=[a*b<=b*i+a*j and i+j<=a+b-1 for i,j in pts]
 assert all(guards) and vals[1]**2>=vals[0]*vals[2]
 results.append(dict(a=a,b=b,path=path,points=pts,values=vals,gap=vals[1]**2-vals[0]*vals[2],polygon_guards=guards))
out=dict(status='independent exact finite recurrence computation, not proof',coefficient_positions=checks,results=results)
Path('evidence/markov-b485717c/independent-raw.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
