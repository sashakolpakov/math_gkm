"""Machine-authored independent exact raw recurrence checks. Not proofs."""
from pathlib import Path
from math import gcd
import json,time
from experiment_8833 import source,path_for,backward,polyguard
O=Path('evidence/markov-6604cff8');start=time.monotonic();cases=raw=triples=0;inputs=[];fail=[]
for n in [3,4,7,12]:
 for c in range(2,24):
  for r in range(1,c):
   if gcd(c,r)>1:continue
   a=c*n+r;b=c*(n+1)+r
   w=[(k+1)*a//b-k*a//b for k in range(1,b)]
   f=backward(w,4);cases+=1;inputs.append([n,c,r,a,b])
   if c<=8:
    aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+5):
     raw+=1
     if p.get((a+4-j,j),0)!=f.get(j,0):fail.append(['raw',n,c,r,j])
   for j in range(a+3):
    i=a+2-j
    if all(polyguard(a,b,*pt) for pt in [(i,j+2),(i+1,j+1),(i+2,j)]):
     triples+=1
     if f.get(j,0)*f.get(j+2,0)>f.get(j+1,0)**2:fail.append(['lc',n,c,r,j])
rec=dict(status='Exact finite computation only; no universal proof',cases=cases,literal_raw_positions=raw,valid_triples=triples,inputs=inputs,failures=fail,seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}));assert not fail
