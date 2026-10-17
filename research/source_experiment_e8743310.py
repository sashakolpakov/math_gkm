"""Machine-authored actual recurrence checks; finite experiments, not proofs."""
from three_probe_9e205206 import frame
from correction_kernel_d0292f14 import raw,top
from pathlib import Path
import json,time,random,hashlib
t=time.monotonic();out=dict(coefficient_checks=0,relative_checks=0,weak_checks=0,strong_small_checks=0,zeros=0,raw_triples=[0,0,0],failures=[])
polys=[]
for q in list(range(1,46))+[53,64]:
 for r in [False,True]:
  a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
  for k in range(q+1):
   x=q-2*k-(5 if r else 4)
   if x<0:continue
   j=b-q-k-1
   for c in range(36):
    v=p.get((c+3,j),0);A=top(x,x+3*k+(5 if r else 4),c)
    out['coefficient_checks']+=1;out['zeros']+=int(v==0)
    if v!=raw(x,k,r,c+3):out['failures'].append(['formula',q,r,k,c,v])
    if c>=10:
     az=[top(x,x+3*k+(5 if r else 4),c+h) for h in range(3)]
     out['weak_checks']+=1
     if (8*(c+4)+1)*az[0]*az[2]>8*(c+4)*az[1]**2:out['failures'].append(['weak',x,k,r,c])
    if 5<=c<16:
     az=[top(x,x+3*k+(5 if r else 4),c+h) for h in range(3)]
     out['strong_small_checks']+=1
     if (c+5)*az[0]*az[2]>(c+4)*az[1]**2:out['failures'].append(['strong-small',x,k,r,c])
    out['relative_checks']+=1
    if not A<=v or not 3**(c+2)*v<=(3**(c+2)+21)*A:out['failures'].append(['relative',q,r,k,c,v,A])
rng=random.Random(198)
polys.extend(frame([bool(rng.randrange(2)) for _ in range(7)]) for _ in range(12))
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
out.update(labels=sorted(seen),seconds=time.monotonic()-t,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='Finite exact source checks, retaining zeros, all three directions and endpoints.')
Path('evidence/markov-e8743310/source-experiment.json').write_text(json.dumps(out,indent=2));print(json.dumps({k:v for k,v in out.items() if k!='labels'}))
