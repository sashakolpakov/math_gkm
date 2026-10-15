"""Machine-authored exact finite tests of the backwards coefficient route; not proof."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-94b1de05'
rows=json.loads((O/'backward-candidates.json').read_text())
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
inputs=[(n,c,r) for c in range(5,18) for r in range(1,c) if gcd(c,r)==1 for n in [7,8,12,24]]
counts=dict(cases=0,coefficient_identities=0,zeros=0,valid_triples=0,literal_coefficients=0)
start=time.monotonic()
for n,c,r in inputs:
 ch=next(i for i,((p,q),(s,t)) in enumerate(zip(bounds,bounds[1:])) if p*c<q*r and t*r<s*c)
 a=n*c+r;b=a+c
 cut=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
 vals={}
 for j in range(3*n+7,4*n+3):
  v=sum(F(v)*c**ks[2]*r**ks[3]*(4*n-j)**ks[5] for ks,v in rows[ch]['shape'])
  assert v==7560*cut.get(j,0),(n,c,r,j)
  vals[j]=v;counts['coefficient_identities']+=1;counts['zeros']+=int(v==0)
 for j in range(3*n+7,4*n+1):
  i=a+2-j
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert vals[j]*vals[j+2]<=vals[j+1]**2
   counts['valid_triples']+=1
 if b<=55:
  aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j,v in vals.items():
   assert 7560*raw.get((a+4-j,j),0)==v
   counts['literal_coefficients']+=1
 counts['cases']+=1
 if counts['cases']%40==0:
  (O/'backward-experiment-progress.json').write_text(json.dumps(dict(counts=counts,seconds=time.monotonic()-start)))
result=dict(status='Finite exact computation only; no universal conclusion',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'backward-experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(counts)
