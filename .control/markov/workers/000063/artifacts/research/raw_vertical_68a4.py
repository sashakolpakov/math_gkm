"""Machine-authored literal recurrence check of the experimental vertical witness."""
from pathlib import Path
import json,time
def mul(p,q):
 r={}
 for (i,j),a in p.items():
  for (k,l),b in q.items():r[i+k,j+l]=r.get((i+k,j+l),0)+a*b
 return r
def sub(p,q):
 r=dict(p)
 for k,c in q.items():r[k]=r.get(k,0)-c
 return {k:c for k,c in r.items() if c}
t=time.monotonic();S={(0,0):1,(1,0):1,(0,1):1}
lo=(0,1,{(0,0):1});mid=(1,2,{(2,0):1,(1,1):2,(0,2):1,(1,0):1});hi=(1,1,{(1,0):1,(0,1):1})
for right in [True]*39+[False]:
 if right:
  nxt=(mid[0]+hi[0],mid[1]+hi[1],sub(mul(mul(S,hi[2]),mid[2]),mul({(hi[0],hi[1]):1},lo[2])))
  lo,mid=mid,nxt
 else:
  nxt=(lo[0]+mid[0],lo[1]+mid[1],sub(mul(mul(S,lo[2]),mid[2]),mul({(lo[0],lo[1]):1},hi[2])))
  hi,mid=mid,nxt
a,b,P=mid;pts=[(79,4),(79,5),(79,6)];v=[P.get(p,0) for p in pts]
guards=[a*b<=b*i+a*j and i+j<=a+b-1 for i,j in pts]
assert (a,b)==(79,81) and v==[1052700916,106849324804,8979215652392] and all(guards)
rec=dict(status='finite exact literal recurrence; no root proof',a=a,b=b,path=[True]*39+[False],points=pts,coefficients=v,polygon_guards=guards,gap=v[1]**2-v[0]*v[2],nonzero_coefficients=len(P),seconds=time.monotonic()-t)
Path('evidence/markov-68a44d34/raw-vertical.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
