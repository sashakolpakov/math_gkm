"""Machine-authored run-six source checks, finite and not proofs."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8b851864'
data=json.loads((R/'evidence/markov-1b02dddc/onset-candidates.json').read_text())
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
start=time.monotonic();counts=dict(cases=0,coefficient_identities=0,valid_full_slice_triples=0,literal_coefficients=0,zeros=0);inputs=[]
for c in range(5,25):
 for r in range(1,c):
  if gcd(c,r)!=1:continue
  ch=next(z for z in range(6) if bounds[z][0]*c<bounds[z][1]*r and bounds[z+1][1]*r<bounds[z+1][0]*c)
  (aa,bb),(u,v)=bounds[ch:ch+2];x=u*c-v*r-1;y=bb*r-aa*c-1;assert min(x,y)>=0
  a=6*c+r;b=a+c;cut=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
  for row in data:
   if row['chamber']!=ch:continue
   for t,p in enumerate(row['values']):
    z=sum(F(w)*(-1)**ks[0]*x**ks[2]*y**ks[3] for ks,w in p);j=18+row['k']+t
    assert z==7560*cut.get(j,0),(c,r,j,z,cut.get(j,0));counts['coefficient_identities']+=1
  for j in range(30):
   i=a+2-j
   if i>=0 and all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
    vals=[cut.get(j+t,0) for t in range(3)];assert vals[0]*vals[2]<=vals[1]**2
    counts['valid_full_slice_triples']+=1;counts['zeros']+=sum(z==0 for z in vals)
  if c<=7:
   aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(32):assert p.get((a+4-j,j),0)==cut.get(j,0);counts['literal_coefficients']+=1
  inputs.append([6,c,r]);counts['cases']+=1
d=dict(status='Finite exact computation only; not proof',counts=counts,inputs=inputs,failures=[],seconds=time.monotonic()-start)
(O/'six-experiments.json').write_text(json.dumps(d,indent=2)+'\n');print(d|dict(inputs='Saved in artifact'),flush=True)
