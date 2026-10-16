"""Machine-authored exact Pell positive-transfer and rhombus experiments."""
from collections import defaultdict
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-9e205206')
def add(p,q):
 r=dict(p)
 for x,v in q.items():r[x]=r.get(x,0)+v
 return {x:v for x,v in r.items() if v}
def neg(p):return {x:-v for x,v in p.items()}
def mul(p,q):
 r=defaultdict(int)
 for (i,j),v in p.items():
  for (k,l),w in q.items():r[i+k,j+l]+=v*w
 return {x:v for x,v in r.items() if v}
one={(0,0):1};u={(1,0):1};v={(0,1):1};b=add(u,v);s=add(b,one)
def main():
 t=time.monotonic(); p,q=one,{}; old,now=one,add(mul(b,b),u)
 checks=0;fails={}; rows={};samples=[]
 # rhombi in six primitive orientations, and LC of P/Q component mixtures.
 dirs=[((1,0),(0,1)),((1,0),(1,-1)),((0,1),(-1,1))]
 for a in range(1,41):
  p,q=add(mul(add(mul(b,b),u),p),mul(b,q)),add(mul(mul(v,b),p),mul(v,q))
  assert p==now,(a,'positive transfer')
  for d,e in dirs:
   key=str((d,e))
   for i in range(2*a+1):
    for j in range(2*a+1-i):
     c=lambda x,y:p.get((x,y),0)
     pts=[(i,j),(i+d[0]+e[0],j+d[1]+e[1]),(i+d[0],j+d[1]),(i+e[0],j+e[1])]
     vals=[c(*x) for x in pts];checks+=1
     if vals[0]*vals[1]>vals[2]*vals[3] and key not in fails:
      fails[key]=dict(a=a,points=pts,values=vals)
  # Vertical and horizontal synchronization between p and q with shifts.
  for ax in range(2):
   key=f'sync{ax}'
   for i in range(2*a+1):
    for j in range(2*a+1):
     x=(i,j);y=(i+1,j) if ax==0 else (i,j+1);z=(i+2,j) if ax==0 else (i,j+2)
     vals=[p.get(x,0),p.get(y,0),p.get(z,0),q.get(x,0),q.get(y,0),q.get(z,0)]
     if vals[0]*vals[5]+vals[3]*vals[2]>2*vals[1]*vals[4] and key not in fails:
      fails[key]=dict(a=a,points=[x,y,z],values=vals)
  if a<=4:samples.append(dict(a=a,p=sorted((i,j,c) for (i,j),c in p.items()),q=sorted((i,j,c) for (i,j),c in q.items())))
  old,now=now,add(mul(mul(s,b),now),neg(mul(mul(u,v),old)))
 out=dict(status='finite exact experiments, not proofs',a_max=40,checks=checks,first_failures=fails,samples=samples,seconds=time.monotonic()-t)
 (O/'positive-transfer-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='samples'}))
if __name__=='__main__':main()
