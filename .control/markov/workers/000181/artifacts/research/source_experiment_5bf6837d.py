"""Machine-authored exact actual-source experiment, not a universal proof."""
from pathlib import Path
from three_probe_9e205206 import frame
from source_experiment_6576ccc5 import correction
from source_experiment_9647c1ba import L
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-5bf6837d')
def run():
 start=time.monotonic();out=dict(status='finite exact source recurrence only',fractions=0,rows=0,coefficients=0,zeros=0,raw_triples=[0,0,0],failures=[])
 polys=[]
 for q in list(range(2,16))+[24,35,50]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   for k in range((q-(2 if r else 1))//2+1):
    d=q-2*k-(2 if r else 1);j=q+k+1;out['rows']+=1
    for i in range(b+6):
     raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=L(d,j,i-3)+correction(d,k,i-2,r):out['failures'].append(['source identity',q,r,k,i])
 rng=random.Random(181)
 paths=[[],[False],[True]]+[[bool(rng.randrange(2)) for _ in range(6)] for _ in range(18)]
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
