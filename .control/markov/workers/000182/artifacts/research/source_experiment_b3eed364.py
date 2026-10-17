"""Machine-authored independent raw-source checks of the upper-sector formula."""
from pathlib import Path
from three_probe_9e205206 import frame
from math import comb
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-b3eed364')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def upper(n,t,i):
 if t==0:return int(i==0)
 if t==1:return 2 if i==0 else n+2 if i==1 else 0
 if t==2:return 1 if i==0 else 3*n-1 if i==1 else C(n+2,2) if i==2 else 0
 if i==0:return 0
 if i==1:return 4*(n+6-3*t)
 if i==2:return 4*(t-2)*C(n-2*t+6,2)
 return C(t-3,i-3)*C(n+2-t+i,i)+4*sum((t-s)*C(s-3,i-3)*C(n-2*t+s+i+2,i) for s in range(3,t))
def run():
 start=time.monotonic();out=dict(status='finite exact source recurrence only',fractions=0,rows=0,coefficients=0,zeros=0,edge_strict=0,raw_triples=[0,0,0],failures=[])
 polys=[]
 for q in list(range(1,17))+[24,35,50]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   for t in range(q+3):
    j=b+2-t;out['rows']+=1
    for i in range(t+5):
     raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=upper(b,t,i):out['failures'].append(['source identity',q,r,t,i,raw,upper(b,t,i)])
    if t>=5:
     vals=[p.get((i,j),0) for i in [1,2,3]];out['edge_strict']+=1
     if vals[1]**2<=vals[0]*vals[2]:out['failures'].append(['strict edge',q,r,t,vals])
 rng=random.Random(182)
 paths=[[],[False],[True]]+[[bool(rng.randrange(2)) for _ in range(6)] for _ in range(14)]
 polys.extend(frame(p) for p in paths)
 polys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})])
 seen=set()
 for a,b,p in polys:
  if (a,b) in seen:continue
  seen.add((a,b));out['fractions']+=1
  def inside(i,j):return a*b<=b*i+a*j and i+j<=a+b-1
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      vals=[p.get(z,0) for z in pts];out['raw_triples'][direction]+=1
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['raw inequality',a,b,direction,pts,vals])
 out['labels']=sorted(seen);out['seconds']=time.monotonic()-start
 out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='labels'}),flush=True)
if __name__=='__main__':run()
