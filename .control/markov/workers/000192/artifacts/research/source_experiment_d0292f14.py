"""Machine-authored finite direct-source comparisons, all three raw directions."""
from pathlib import Path
from three_probe_9e205206 import frame
from source_experiment_99a0f3b8 import corrections
from correction_kernel_d0292f14 import raw,correction
import json,time,hashlib,random
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-d0292f14'
def run():
 start=time.monotonic();out=dict(source_checks=0,zeros=0,correction_checks=0,strict_excess_checks=0,raw_triples=[0,0,0],failures=[],examples=[])
 polys=[]
 for q in list(range(1,24))+[31,47,73]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   Ds=corrections(q,r,q)
   for k in range(q+1):
    x=q-2*k-(5 if r else 4)
    if x<0:continue
    j=b+2-(q+3+k)
    for c in range(q+k+5):
     v=raw(x,k,r,c+3);actual=p.get((c+3,j),0)
     out['source_checks']+=1;out['zeros']+=actual==0
     if v!=actual:out['failures'].append(['source',q,r,k,c,v,actual])
     dv=correction(x+(3 if r else 2),k,r,c+3)
     out['correction_checks']+=1
     if dv!=Ds[k].get(c+3,0):out['failures'].append(['correction',q,r,k,c])
     out['strict_excess_checks']+=1
     if (dv>0)!=(c+2<=k):out['failures'].append(['support',q,r,k,c])
     if q==6 and k==1 and not r and c<3:out['examples'].append(dict(q=q,r=r,k=k,c=c+3,j=j,raw=actual))
 rng=random.Random(192)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(6)]) for _ in range(18))
 polys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})]);seen=set()
 for a,b,p in polys:
  if (a,b) in seen:continue
  seen.add((a,b))
  def inside(i,j):return a*b<=b*i+a*j and i+j<=a+b-1
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for di,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      vs=[p.get(z,0) for z in pts];out['raw_triples'][di]+=1
      if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['raw',a,b,di,pts,vs])
 out.update(labels=sorted(seen),seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='Finite exact experiments only; not a universal proof.')
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2))
 print(json.dumps({k:v for k,v in out.items() if k not in ['labels','examples']}),flush=True)
if __name__=='__main__':run()
