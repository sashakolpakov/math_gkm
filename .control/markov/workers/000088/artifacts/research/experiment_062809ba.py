"""Machine-authored exact independent finite checks; never a universal proof."""
from pathlib import Path
from math import gcd
import json,time,hashlib
from experiment_8833 import backward,source,path_for,polyguard
from fourth_probe_01f51d63 import deser,sub,BOUNDS,ypoly
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-062809ba'
start=time.monotonic();data=json.loads((R/'evidence/markov-be5676f9/experiments.json').read_text())
runs={d['n']:d for d in data['runs']};cases=raw=triples=0;fail=[];samples=[]
for n in [2,3]:
 for c in range(2,42):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   a=c*n+r;b=c*(n+1)+r
   w=[(k+1)*a//b-k*a//b for k in range(1,b)]
   f=backward(w,4);cases+=1
   if c>=5:
    z=next(z for z in range(6) if BOUNDS[z][0]*c<BOUNDS[z][1]*r and BOUNDS[z+1][1]*r<BOUNDS[z+1][0]*c)
    candidate=sub(deser(runs[n]['chambers'][z]['fourth']),c,r)
    if candidate!=24*ypoly(f):fail.append(['formula',n,c,r])
   if c<=12:
    aa,bb,pol=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+5):
     raw+=1
     if f.get(j,0)!=pol.get((a+4-j,j),0):fail.append(['raw',n,c,r,j])
   for j in range(a+3):
    i=a+2-j
    if all(polyguard(a,b,*p) for p in [(i,j+2),(i+1,j+1),(i+2,j)]):
     triples+=1
     if f.get(j,0)*f.get(j+2,0)>f.get(j+1,0)**2:fail.append(['lc',n,c,r,j])
   if c<=4:samples.append(dict(n=n,c=c,r=r,a=a,b=b,coefficients=[f.get(j,0) for j in range(max(f)+1)]))
out=dict(status='Exact finite experiments, not proofs',cases=cases,raw_positions=raw,valid_triples=triples,failures=fail,small_cycles=samples,certificate_input_sha256=hashlib.sha256((R/'evidence/markov-be5676f9/experiments.json').read_bytes()).hexdigest(),seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='small_cycles'}));assert not fail
