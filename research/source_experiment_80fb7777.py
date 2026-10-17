"""Machine-authored finite exact recurrence checks; never a universal proof."""
from pathlib import Path
from three_probe_9e205206 import frame
from source_experiment_99a0f3b8 import corrections
from source_experiment_55cf20d2 import upper
from fractions import Fraction
import json,time,hashlib,random
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-80fb7777'
def run():
 start=time.monotonic();data=json.loads((O/'general-jets.json').read_text())
 out=dict(jet_checks=0,source_checks=0,zeros=0,strict_middle_triples=0,raw_triples=[0,0,0],failures=[],witnesses=[])
 polys=[]
 for q in list(range(1,25))+[37,55,81]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   cor=corrections(q,r,q)
   for k,D in enumerate(cor):
    for c in range(9):
     v=sum(Fraction(v)*q**e[0]*k**e[1] for e,v in data[str(r)][c])
     out['jet_checks']+=1
     if v!=D.get(c,0):out['failures'].append(['jet',q,r,k,c,str(v),D.get(c,0)])
    t=q+3+k;j=b+2-t
    if 2*t>b:continue
    for c in range(t+4):
     raw=p.get((c,j),0);out['source_checks']+=1;out['zeros']+=raw==0
     if raw!=upper(b,t,c)+D.get(c,0):out['failures'].append(['source',q,r,k,c])
    for c in range(2,5):
     vs=[p.get((c+z,j),0) for z in range(3)];gap=vs[1]**2-vs[0]*vs[2]
     out['strict_middle_triples']+=1
     if gap<=0:out['failures'].append(['strict',q,r,k,c,vs])
     if k>=2 and q in [12,24] and len(out['witnesses'])<12:out['witnesses'].append(dict(q=q,r=r,k=k,c=c,b=b,j=j,raw=vs,gap=gap))
 rng=random.Random(191)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(6)]) for _ in range(16))
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
 out.update(labels=sorted(seen),seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='finite exact experiment only')
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2))
 print(json.dumps({k:v for k,v in out.items() if k not in ['labels','witnesses']}),flush=True)
if __name__=='__main__':run()
