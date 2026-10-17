"""Machine-authored finite recurrence cross-checks; experiments are not proofs."""
from pathlib import Path
from math import comb
from fractions import Fraction as F
from three_probe_9e205206 import frame
from central_low_probe_e108e0e2 import raw
import json,time,random,hashlib
O=Path('evidence/markov-f88f6a75');t=time.monotonic()
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(D,k,a,b):return sum(C(a+l,a)*C(D+a,b-l)*C(k,a+l+2) for l in range(b+1))
def top(h,T,c):return sum(C(c+l,c)*C(h+2*c+4,c+3-l)*(C(T,c+l)+4*C(T+1,c+l+2)) for l in range(c+4))
def corr(e,k,c,r):
 if r:return 4*(H(e+c+2,k,c,c+1)+2*H(e+c+3,k,c+1,c+2)+H(e+c+2,k,c+1,c+2)+H(e+c+2,k,c,c+2)+H(e+c+3,k,c,c+2))
 return 4*(2*H(e+c+3,k,c+1,c+2)+H(e+c+3,k,c,c+1)+H(e+c+4,k,c+1,c+2)+H(e+c+3,k,c,c+2))
out=dict(coefficient_checks=0,zeros=0,polynomial_evaluations=0,low_gap_checks=0,raw_triples=[0,0,0],zero_triples=[0,0,0],failures=[])
polys={};certs=json.loads(Path('evidence/markov-e108e0e2/central-low-probe.json').read_text())['cases']
def ev(p,z):
 v=F(0)
 for a in reversed(p):v=v*z+F(a)
 return v
for r in [False,True]:
 for h in range(4):
  for k in range(27):
   q=2*k+h+int(r)
   if q<1:continue
   if (q,r) not in polys:polys[q,r]=frame([False]*(q-1)+[True,r])
   a,b,p=polys[q,r];j=b-q-k-1;T=q+k
   vals=[]
   for c in range(15):
    v=top(h,T,c)+corr(h+int(r),k,c,r);actual=p.get((c+3,j),0);vals.append(v)
    out['coefficient_checks']+=1;out['zeros']+=int(actual==0)
    if v!=actual:out['failures'].append(['coefficient',h,k,c,r,v,actual])
   for c in range(1,10):
    gap=vals[c+1]**2-vals[c]*vals[c+2];out['low_gap_checks']+=1
    if gap<0:out['failures'].append(['gap',h,k,c,r,gap])
    row=next(v for v in certs if v['c']==c and v['h']==h and v['r']==r)
    # Includes values below the nonnegative-shift certificate domain; equality only.
    observed=ev(row['coefficients'],k-row['k0']);out['polynomial_evaluations']+=1
    if observed!=gap:out['failures'].append(['polynomial',h,k,c,r,str(observed),gap])
allpolys=list(polys.values())
rng=random.Random(200)
for _ in range(20):allpolys.append(frame([bool(rng.randrange(2)) for _ in range(7)]))
allpolys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})]);seen=set()
for a,b,p in allpolys:
 if (a,b) in seen:continue
 seen.add((a,b))
 inside=lambda i,j: i>=0 and j>=0 and a*b<=b*i+a*j and i+j<=a+b-1
 for i in range(a+b):
  for j in range(a+b-i):
   for di,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
    if all(inside(*z) for z in pts):
     vs=[p.get(z,0) for z in pts];out['raw_triples'][di]+=1;out['zero_triples'][di]+=int(0 in vs)
     if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['raw',a,b,di,pts,vs])
out.update(labels=sorted(seen),seconds=time.monotonic()-t,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='Finite exact experiments only; all directions, endpoints and zero positions retained.')
(O/'source-experiment.json').write_text(json.dumps(out,indent=2));print(json.dumps({k:v for k,v in out.items() if k!='labels'}))
