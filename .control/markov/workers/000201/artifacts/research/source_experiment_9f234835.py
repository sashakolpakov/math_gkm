"""Machine-authored independent integer-recurrence checks; no theorem claim."""
from pathlib import Path
from math import comb
import json,time,hashlib,random
from three_probe_9e205206 import frame
O=Path('evidence/markov-9f234835');start=time.monotonic()
def D(t,j,k):
 if k<0:return 0
 return sum((1 if r==0 else 4*r)*comb(j-r+t+3,t+3)*comb(k-r+t,t) for r in range(min(j,k)+1))
out=dict(lower_comparisons=0,upper_comparisons=0,coefficient_zeros=0,lower_diagonal=0,
 upper_vertical=0,upper_diagonal=0,all_direction_triples=[0,0,0],zero_triples=[0,0,0],failures=[])
polys={}
for q in list(range(1,33))+[41,53]:
 for r in [False,True]:
  a,b,p=frame([False]*(q-1)+[True,r]);polys[a,b]=p
  for region,js in [('lower',range(q+1)),('upper',range(b-q,b+5))]:
   for j in js:
    for i in range(3,min(max(7,b+5-j),80)):
     v=D(i-3,j,b+2-i-j);actual=p.get((i,j),0)
     out[region+'_comparisons']+=1;out['coefficient_zeros']+=int(actual==0)
     if actual!=v:out['failures'].append([region,q,r,i,j,actual,v])
  for j in range(b+4):
   for i in range(min(max(7,b+5-j),80)):
    for name,pts,guard in [
      ('lower_diagonal',[(i,j+2),(i+1,j+1),(i+2,j)],j+2<=q),
      ('upper_vertical',[(i,j),(i,j+1),(i,j+2)],b<=j+q),
      ('upper_diagonal',[(i,j+2),(i+1,j+1),(i+2,j)],b<=j+q and i>=3)]:
     if guard:
      vals=[p.get(x,0) for x in pts];out[name]+=1
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append([name,q,r,i,j,vals])
rng=random.Random(201)
for _ in range(25):
 a,b,p=frame([bool(rng.randrange(2)) for _ in range(7)]);polys[a,b]=p
polys[0,1]={(0,0):1};polys[1,1]={(1,0):1,(0,1):1}
for (a,b),p in polys.items():
 inside=lambda i,j:a*b<=b*i+a*j and i+j<=a+b-1
 for i in range(a+b):
  for j in range(a+b-i):
   for di,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(inside(*x) for x in pts):
     vals=[p.get(x,0) for x in pts];out['all_direction_triples'][di]+=1;out['zero_triples'][di]+=int(0 in vals)
     if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['all',a,b,di,pts,vals])
out.update(labels=sorted([list(x) for x in polys]),seconds=time.monotonic()-start,
 script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 status='Finite exact experiments only; all directions, endpoint polynomials and zeros retained. No universal conclusion.')
(O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='labels'}))
