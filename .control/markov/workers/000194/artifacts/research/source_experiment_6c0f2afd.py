"""Machine-authored direct source checks; experiments, never proof premises."""
from three_probe_9e205206 import frame
from correction_kernel_d0292f14 import raw,top
from pathlib import Path
from math import comb
import json,time,hashlib,random
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6c0f2afd'
def run():
 start=time.monotonic();out=dict(formula_checks=0,zeros=0,middle_triples=0,raw_triples=[0,0,0],failures=[],examples=[])
 polys=[]
 for q in list(range(1,30))+[41,59,73]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p))
   for k in range(q+1):
    x=q-2*k-(5 if r else 4)
    if x<0:continue
    j=b-q-k-1
    for c in range(3,19):
     actual=p.get((c,j),0);v=raw(x,k,r,c);out['formula_checks']+=1;out['zeros']+=actual==0
     if actual!=v:out['failures'].append(['formula',q,r,k,c,actual,v])
     vs=[p.get((c+l,j),0) for l in range(3)];out['middle_triples']+=1
     if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['middle',q,r,k,c,vs])
     if q==29 and k==7 and c in [6,7,8,9,10,11,12]:
      out['examples'].append(dict(q=q,r=r,k=k,c=c,j=j,raw=vs,gap=vs[1]**2-vs[0]*vs[2]))
 rng=random.Random(194)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(7)]) for _ in range(23))
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
 out.update(labels=sorted(seen),seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='Finite exact source checks only, retaining zeros and endpoints.')
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2))
 print(json.dumps({k:v for k,v in out.items() if k not in ['labels','examples']}),flush=True)
 t=time.monotonic();ct=0;bad=[]
 C=lambda n,k:comb(n,k) if 0<=k<=n else 0
 kernel=lambda d,s,i:C(s,i)*C(d+s+i+8,i+3)
 for d in [0,1,2,5,10,30]:
  for T in range(2,100):
   row=[kernel(d,T,i)+4*sum((T-s)*kernel(d,s,i) for s in range(T)) for i in range(T+1)]
   for i in range(T-1):
    ct+=1
    if row[i]*row[i+2]>row[i+1]**2:bad.append([d,T,i])
 (O/'top-mass-experiment.json').write_text(json.dumps(dict(tested=ct,failures=bad,seconds=time.monotonic()-t,status='Finite experiment, not global template log-concavity.'),indent=2))
 print(json.dumps(dict(top_mass_tested=ct,failures=bad)))
if __name__=='__main__':run()
