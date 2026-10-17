"""Machine-authored exact source/kernel checks, finite experiments only."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time,hashlib,random
from three_probe_9e205206 import frame
from source_experiment_55cf20d2 import upper
from top_parameter_probe_dcb64029 import M
from central_probe_20825094 import scalar
O=Path('/Users/sasha/math_gkm/evidence/markov-73199834')
def save(name,out,t):
 out.update(seconds=time.monotonic()-t,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='finite exact experiment; not a proof')
 (O/name).write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='labels'}),flush=True)
def source():
 t0=time.monotonic();out=dict(coefficients=0,zeros=0,rows=0,wedge_triples=0,wedge_beyond_linear=0,raw_triples=[0,0,0],failures=[])
 polys=[]
 for q in list(range(1,19))+[27,37,49,61,83]:
  for residue in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,residue]);polys.append((a,b,p))
   for t in range(q+3):
    j=b+2-t;out['rows']+=1
    for i in range(t+4):
     raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=upper(b,t,i):out['failures'].append(['template',q,residue,t,i])
    if t>=5:
     for c in range(3,t):
      if 4*t+2>5*c:continue
      vals=[p.get((c+k,j),0) for k in range(3)];out['wedge_triples']+=1
      out['wedge_beyond_linear']+=6*t>b+3*c+4
      if vals[0]*vals[2]>=vals[1]**2:out['failures'].append(['wedge',q,residue,t,c,vals])
 rng=random.Random(188)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(6)]) for _ in range(15))
 polys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})]);seen=set()
 for a,b,p in polys:
  if (a,b) in seen:continue
  seen.add((a,b))
  def inside(i,j):return a*b<=b*i+a*j and i+j<=a+b-1
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      vals=[p.get(z,0) for z in pts];out['raw_triples'][direction]+=1
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['raw',a,b,direction,pts,vals])
 out['labels']=sorted(seen);out['fractions']=len(seen);save('source-experiment.json',out,t0)
def exact():
 t0=time.monotonic();out=dict(groups=0,base_checks=0,stationary_checks=0,kernel_checks=0,failures=[])
 for r in range(1,31):
  for i in sorted(set([4*r-1,4*r,5*r,8*r])):
   for d in [i+r-2,i+2*r,i+4*r]:
    H=d+2*i+9;Q=d+i+6;a=i+1
    den=[F(1)]
    for k in range(2*r):den.append(den[-1]*F((a+k)*(H+k),(k+1)*(Q+k)))
    for m in [2,r,2*r-1,2*r]:
     if m<2:continue
     base=F(0);group=F(0);stationary=F(0)
     for k in range(m+1):
      l=m-k;w=den[k]*den[l];f=scalar(a,H,k,l)
      B=(a+k)*(H+k)*l*(Q+l-1);D=k*(Q+k-1)*(a+l)*(H+l)
      stationary+=w*(B*(m-2*k-1)+D*(2*k-m-1));base+=w*f
      wr=lambda x:1 if x==r else (4*(r-x) if x<r else 0)
      group+=w*wr(k)*wr(l)*f
     out['groups']+=1;out['base_checks']+=1;out['stationary_checks']+=1
     if base<=0 or group<=0 or stationary:out['failures'].append([d,i,r,m,str(base),str(group),str(stationary)])
    vals=[M(d,i+r,j) for j in [i,i+1,i+2]];out['kernel_checks']+=1
    if vals[0]*vals[2]>=vals[1]**2:out['failures'].append(['kernel',d,i,r])
 save('exact-wedge-experiment.json',out,t0)
if __name__=='__main__':
 import sys
 {'source':source,'exact':exact}[sys.argv[1]]()
