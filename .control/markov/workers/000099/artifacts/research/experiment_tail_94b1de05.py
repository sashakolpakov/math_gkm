"""Machine-authored finite exact checks. Not a proof of any universal claim."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-94b1de05'
rows=json.loads((R/'evidence/markov-8067e0c5/tail-probe.json').read_text())['charts']
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
inputs=[(n,c,r) for c in range(5,26) for r in range(1,c) if gcd(c,r)==1 for n in [0,1,2,3,4,5,6,7,8,17,37]]
inputs += [(111,c,r) for c,r in [(5,1),(5,2),(5,3),(5,4),(11,2),(11,9)]]
counts=dict(cases=0,coefficient_identities=0,zeros=0,valid_triples=0,literal_coefficients=0)
start=time.monotonic()
for n,c,r in inputs:
 ch=next(i for i,((p,q),(s,t)) in enumerate(zip(bounds,bounds[1:])) if p*c<q*r and t*r<s*c)
 values=[sum(F(v)*c**ks[2]*r**ks[3]/315 for ks,v in row) for row in rows[ch]['values']]
 a=n*c+r;b=a+c
 cut=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
 for k,v in enumerate(values):
  if n+k<7:continue
  assert v==24*cut.get(4*n+k,0),(n,c,r,k)
  counts['coefficient_identities']+=1;counts['zeros']+=int(v==0)
 for k in range(6):
  if n+k<7:continue
  i=a+2-(4*n+k);j=4*n+k
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert values[k]*values[k+2]<=values[k+1]**2
   counts['valid_triples']+=1
 if b<=100:
  aa,bb,p=source(path_for(a,b));assert (a,b)==(aa,bb)
  for k,v in enumerate(values):
   if n+k<7:continue
   j=4*n+k;i=a+4-j
   if i>=0:
    assert 24*p.get((i,j),0)==v
    counts['literal_coefficients']+=1
 counts['cases']+=1
result=dict(status='Finite exact experiment only',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(counts)
