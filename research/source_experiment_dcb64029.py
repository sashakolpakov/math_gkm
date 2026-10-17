"""Machine-authored independent exact source recurrence and tail checks.
Every finite observation is experimental evidence, never a universal proof.
"""
from pathlib import Path
from three_probe_9e205206 import frame
from source_experiment_55cf20d2 import upper
from top_parameter_probe_dcb64029 import K,M
from math import prod
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-dcb64029')
def scalar(d,i,r):
 den=prod((j+1)*(d+i+j+6) for j in range(r))
 A=E=C=0
 for k in range(r+1):
  v=prod((i+j+1)*(d+2*i+j+9) for j in range(k))*prod((j+1)*(d+i+j+6) for j in range(k,r))
  w=1 if k==r else 4*(r-k)
  A+=w*v;E+=w*k*(d+2*i+k+9)*v;C+=w*k*(k-1)*(d+2*i+k+9)*(d+2*i+k+10)*v
 return den,A,E,C,(i+2)*(i+5)*E*E-(i+1)*(i+4)*A*C
def run():
 start=time.monotonic();out=dict(status='finite exact source recurrence checks, not proof',fractions=0,rows=0,coefficients=0,zeros=0,tail_identity_checks=0,new_tail_triples=0,raw_triples=[0,0,0],failures=[])
 for d in range(10):
  for i in range(15):
   for r in range(13):
    L,A,E,C,G=scalar(d,i,r);base=K(d,i,i);aa,bb,cc=[M(d,i+r,j) for j in [i,i+1,i+2]];s=(i+1)*(i+4);ss=(i+2)*(i+5)
    vals=[L*aa-A*base,L*s*bb-E*base,L*s*ss*cc-C*base,L*L*s*s*ss*(bb*bb-aa*cc)-base*base*G]
    out['tail_identity_checks']+=1
    if any(vals):out['failures'].append(['tail identity',d,i,r,vals])
 polys=[]
 for q in list(range(1,25))+[37,61]:
  for residue in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,residue]);polys.append((a,b,p))
   for t in range(q+3):
    j=b+2-t;out['rows']+=1
    for i in range(t+4):
     raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=upper(b,t,i):out['failures'].append(['template',q,residue,t,i])
    for rr in [3,4]:
     if t<rr+3:continue
     i=t-rr;vals=[p.get((i+k,j),0) for k in range(3)];out['new_tail_triples']+=1
     if vals[1]**2<=vals[0]*vals[2]:out['failures'].append(['strict tail gap',q,residue,t,i,vals])
 rng=random.Random(185)
 paths=[[],[False],[True]]+[[bool(rng.randrange(2)) for _ in range(6)] for _ in range(16)]
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
