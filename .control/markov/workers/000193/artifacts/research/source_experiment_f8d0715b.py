"""Machine-authored independent direct recurrence comparisons. Finite evidence only."""
from three_probe_9e205206 import frame
from correction_kernel_d0292f14 import top,raw
from pathlib import Path
import json,time,hashlib,random
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8d0715b'
def run():
 start=time.monotonic();out=dict(second_rows=0,second_triples=0,formula_checks=0,zeros=0,total_middle_checks=0,raw_triples=[0,0,0],failures=[],examples=[])
 polys=[]
 for q in list(range(1,32))+[43,61,79]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   j=b-q-2;out['second_rows']+=1
   for c in range(q+8):
    vs=[p.get((c+l,j),0) for l in range(3)]
    out['second_triples']+=1
    if vs[1]**2<vs[0]*vs[2]:out['failures'].append(['second',q,r,c,j,vs])
    if c>=3 and 2*(q+4)<=b:
     v=top(b-2*(q+4),q+1,c-3);out['formula_checks']+=1;out['zeros']+=vs[0]==0
     if vs[0]!=v:out['failures'].append(['second-template',q,r,c,vs[0],v])
   for k in range(q+1):
    x=q-2*k-(5 if r else 4)
    if x<0:continue
    j=b-q-k-1
    for c in range(3,14):
     v=raw(x,k,r,c);actual=p.get((c,j),0);out['formula_checks']+=1;out['zeros']+=actual==0
     if actual!=v:out['failures'].append(['middle',q,r,k,c,v,actual])
     vs=[p.get((c+l,j),0) for l in range(3)];out['total_middle_checks']+=1
     if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['total',q,r,k,c,vs])
     if q==11 and k==3 and c in [5,6,7]:out['examples'].append(dict(q=q,r=r,k=k,c=c,j=j,raw=vs,gap=vs[1]**2-vs[0]*vs[2]))
 rng=random.Random(193)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(7)]) for _ in range(20))
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
