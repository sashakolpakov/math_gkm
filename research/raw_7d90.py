"""Machine-authored independent literal pinned numerator recurrence."""
from pathlib import Path
import json
def mul(p,q):
 r={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():r[i+k,j+l]=r.get((i+k,j+l),0)+a*b
 return r
def sub(p,q):
 r=dict(p)
 for k,c in q.items():r[k]=r.get(k,0)-c
 return {k:c for k,c in r.items() if c}
def source(path):
 S={(0,0):1,(1,0):1,(0,1):1}
 lo=(0,1,{(0,0):1});mid=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
 for right in path:
  if right:
   nxt=(mid[0]+hi[0],mid[1]+hi[1],sub(mul(mul(S,hi[2]),mid[2]),mul({(hi[0],hi[1]):1},lo[2])))
   lo,mid=mid,nxt
  else:
   nxt=(lo[0]+mid[0],lo[1]+mid[1],sub(mul(mul(S,lo[2]),mid[2]),mul({(lo[0],lo[1]):1},hi[2])))
   hi,mid=mid,nxt
 return mid
out=[]
for path,pts in [([False,False,True],[(4,0),(3,1),(2,2)])]+[([True]*n+[False],[(3*n+k,0) for k in range(3)]) for n in range(3,16)]:
 a,b,P=source(path);v=[P.get(p,0) for p in pts];guards=[a*b<=b*i+a*j and i+j<=a+b-1 for i,j in pts]
 assert all(guards) and v[1]**2>=v[0]*v[2]
 out.append(dict(a=a,b=b,path=path,points=pts,coefficients=v,guards=guards,gap=v[1]**2-v[0]*v[2]))
rec=dict(status='finite independent literal recurrence, not universal proof',sources=out)
Path('evidence/markov-7d905904/raw-checks.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(sources=len(out),first=out[0],second=out[1])))
