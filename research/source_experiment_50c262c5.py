"""Machine-authored exact recurrence experiment, all results finite only."""
from pathlib import Path
from math import comb
import json,time,random,hashlib
from three_probe_9e205206 import frame
start=time.monotonic(); O=Path('evidence/markov-50c262c5')
def D(c,j,k):
 if k<0:return 0
 return sum((1 if s==0 else 4*s)*comb(j-s+c+3,c+3)*comb(k-s+c,c) for s in range(min(j,k)+1))
out=dict(coefficient_checks=0,zeros=0,new_vertical=0,new_diagonal=0,
 crossing_vertical=0,crossing_diagonal=0,all_direction_triples=[0,0,0],zero_triples=[0,0,0],failures=[])
polys={}
for q in list(range(1,37))+[43,57]:
 for r in (False,True):
  a,b,p=frame([False]*(q-1)+[True,r]);polys[a,b]=p
  for j in range(q-1,b+4):
   for i in range(0,max(8,b+5-j)):
    if i>=3 and b<i+j+q and i+j<=b+2 and b+2<=i+2*j:
     v=D(i-3,j,b+2-i-j);actual=p.get((i,j),0)
     out['coefficient_checks']+=1;out['zeros']+=int(actual==0)
     if v!=actual:out['failures'].append(['model',q,r,i,j,actual,v])
    if b<i+j+q and b+2<=i+2*j:
     vs=[p.get((i,j+e),0) for e in range(3)];out['new_vertical']+=1
     out['crossing_vertical']+=int(j in (q-1,q,b-q-2,b-q-1))
     if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['vertical',q,r,i,j,vs])
    if i>=4 and b<i+j+q+2 and b<=i+2*j:
     vs=[p.get(x,0) for x in [(i,j+2),(i+1,j+1),(i+2,j)]];out['new_diagonal']+=1
     out['crossing_diagonal']+=int(j in (q-1,q,b-q-2,b-q-1))
     if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['diagonal',q,r,i,j,vs])
rng=random.Random(202)
for _ in range(30):
 a,b,p=frame([bool(rng.randrange(2)) for _ in range(7)]);polys[a,b]=p
polys[0,1]={(0,0):1};polys[1,1]={(1,0):1,(0,1):1}
for (a,b),p in polys.items():
 inside=lambda i,j:a*b<=b*i+a*j and i+j<=a+b-1
 for i in range(a+b):
  for j in range(a+b-i):
   for di,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(inside(*x) for x in pts):
     vs=[p.get(x,0) for x in pts];out['all_direction_triples'][di]+=1;out['zero_triples'][di]+=int(0 in vs)
     if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['raw',a,b,di,pts,vs])
out.update(labels=sorted([list(x) for x in polys]),seconds=time.monotonic()-start,
 script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 status='Finite exact experiments, not proof. All directions, both endpoints and zero coefficients retained.')
(O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='labels'}))
