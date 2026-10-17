"""Machine-authored exact finite source verification, not a universal proof."""
from three_probe_9e205206 import frame
from correction_kernel_d0292f14 import raw
from pathlib import Path
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-9db2326d')
def run():
 start=time.monotonic();out=dict(formula_checks=0,zeros=0,third_row_triples=0,raw_triples=[0,0,0],failures=[],examples=[])
 polys=[]
 for q in list(range(1,35))+[41,61]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   j=b-q-3
   for c in range(b+5):
    vs=[p.get((c+l,j),0) for l in range(3)];out['third_row_triples']+=1
    out['zeros']+=sum(v==0 for v in vs)
    if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['third',q,r,c,j,vs])
   for k in range(q+1):
    x=q-2*k-(5 if r else 4)
    if x<0:continue
    j=b-q-k-1
    for c in range(3,22):
     actual=p.get((c,j),0);v=raw(x,k,r,c);out['formula_checks']+=1
     if actual!=v:out['failures'].append(['formula',q,r,k,c,actual,v])
     if q==34 and k==2 and c in [10,13,16,19]:
      vs=[p.get((c+l,j),0) for l in range(3)]
      out['examples'].append(dict(q=q,r=r,k=k,c=c,j=j,raw=vs,gap=vs[1]**2-vs[0]*vs[2]))
 rng=random.Random(195)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(7)]) for _ in range(15))
 polys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})]);seen=set()
 for a,b,p in polys:
  if (a,b) in seen:continue
  seen.add((a,b))
  inside=lambda i,j:a*b<=b*i+a*j and i+j<=a+b-1
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for di,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      vs=[p.get(z,0) for z in pts];out['raw_triples'][di]+=1
      if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['raw',a,b,di,pts,vs])
 out.update(labels=sorted(seen),seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='Finite exact source checks only, retaining zero tails and endpoints.')
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2))
 print(json.dumps({k:v for k,v in out.items() if k not in ['labels','examples']}),flush=True)
if __name__=='__main__':run()
