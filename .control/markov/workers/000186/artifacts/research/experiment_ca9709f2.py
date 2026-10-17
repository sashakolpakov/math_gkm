"""Machine-authored ca9709f2. Exact source and sharper comparison experiments.
Finite observations only; no external assertion is imported into Lean.
"""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time,hashlib,random
from three_probe_9e205206 import frame
from source_experiment_55cf20d2 import upper
from top_parameter_probe_dcb64029 import K,M
O=Path('/Users/sasha/math_gkm/evidence/markov-ca9709f2')
def save(name,out,t):
 out.update(seconds=time.monotonic()-t,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='finite exact experiment, not a proof')
 (O/name).write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['labels','first_negative_groups']}),flush=True)
def source():
 t0=time.monotonic();out=dict(coefficients=0,zeros=0,rows=0,linear_rows=0,linear_triples=0,strict_linear_columns=0,raw_triples=[0,0,0],failures=[])
 polys=[]
 for q in list(range(1,37))+[49,67]:
  for residue in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,residue]);polys.append((a,b,p))
   for t in range(q+3):
    j=b+2-t;out['rows']+=1
    for i in range(t+4):
     raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=upper(b,t,i):out['failures'].append(['template',q,residue,t,i])
    if t>=5 and 6*t<=b+16:
     out['linear_rows']+=1
     for i in range(t+3):
      vals=[p.get((i+k,j),0) for k in range(3)];out['linear_triples']+=1
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['linear row',q,residue,t,i,vals])
    if t>=5:
     for i in range(3,t):
      if 6*t>b+3*i+4:continue
      vals=[p.get((i+k,j),0) for k in range(3)];out['strict_linear_columns']+=1
      if vals[0]*vals[2]>=vals[1]**2:out['failures'].append(['strict column',q,residue,t,i,vals])
 rng=random.Random(186)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(6)]) for _ in range(18))
 polys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})])
 seen=set()
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
 out['labels']=sorted(seen);out['fractions']=len(seen)
 save('source-experiment.json',out,t0)
def groups():
 t0=time.monotonic();out=dict(group_checks=0,negative_groups=0,zero_groups=0,first_negative_groups=[],full_gap_checks=0,full_gap_failures=[],linear_gap_checks=0)
 for i in range(13):
  for r in range(2,43):
   for d in sorted(set([max(0,i+r-2),max(0,i+r-1),i+2*r,i+4*r-1])):
    H=d+2*i+9;Q=d+i+6;a=i+1
    rho=[];q=F(1)
    for k in range(r+1):
     w=1 if k==r else 4*(r-k)
     rho.append(comb(i+k,i)*q*w)
     q=q*F(H+k,Q+k)
    total=F(0)
    for m in range(2,2*r+1):
     group=F(0)
     for k in range(max(0,m-r),min(m,r)+1):
      l=m-k
      scalar=2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*(k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
      group+=rho[k]*rho[l]*scalar
     total+=group;out['group_checks']+=1
     if group<0:
      out['negative_groups']+=1
      if len(out['first_negative_groups'])<20:out['first_negative_groups'].append(dict(d=d,i=i,r=r,m=m,group=str(group)))
     if group==0:out['zero_groups']+=1
    vals=[M(d,i+r,j) for j in [i,i+1,i+2]]
    out['full_gap_checks']+=1
    if total<=0 or vals[0]*vals[2]>=vals[1]**2:out['full_gap_failures'].append([d,i,r,str(total)])
    if d+1>=i+4*r:out['linear_gap_checks']+=1
 save('sharper-group-probe.json',out,t0)
if __name__=='__main__':
 import sys
 {'source':source,'groups':groups}[sys.argv[1]]()
