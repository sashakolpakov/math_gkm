"""Machine-authored independent raw-source checks; finite evidence only."""
from pathlib import Path
from three_probe_9e205206 import frame
from source_experiment_55cf20d2 import upper
from top_short_probe_eb6a9001 import shortpoly
from top_gap_probe_eb6a9001 import ev
from math import comb
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-eb6a9001')
def run():
 start=time.monotonic();out=dict(status='finite exact source recurrence checks, not proof',fractions=0,rows=0,coefficients=0,zeros=0,short_formula_checks=0,new_edge_triples=0,raw_triples=[0,0,0],failures=[])
 polys=[];cache={}
 for q in list(range(1,19))+[29,43,67]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   for t in range(q+3):
    j=b+2-t;out['rows']+=1
    for i in range(t+4):
     raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=upper(b,t,i):out['failures'].append(['template',q,r,t,i])
     if t>=5 and 3<=i<=min(t+1,9):
      T=t-3;d=b-2*t;ii=i-3
      key=T,ii
      if key not in cache:cache[key]=shortpoly(T,ii)
      value=ev(cache[key],d);out['short_formula_checks']+=1
      if value!=raw:out['failures'].append(['short sum',q,r,t,i,str(value),raw])
    if t>=5:
     for i in [3,t-2]:
      vals=[p.get((i+k,j),0) for k in range(3)];out['new_edge_triples']+=1
      if vals[1]**2<=vals[0]*vals[2]:out['failures'].append(['new strict gap',q,r,t,i,vals])
 rng=random.Random(184)
 paths=[[],[False],[True]]+[[bool(rng.randrange(2)) for _ in range(6)] for _ in range(15)]
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
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['raw',a,b,direction,pts,vals])
 out['labels']=sorted(seen);out['seconds']=time.monotonic()-start
 out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='labels'}),flush=True)
if __name__=='__main__':run()
