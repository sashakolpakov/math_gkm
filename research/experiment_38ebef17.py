"""Machine-authored finite exact checks of new fixed-run quotient candidates."""
from pathlib import Path
from math import gcd
from fractions import Fraction
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-38ebef17'
rows=json.loads((O/'small-run-candidates.json').read_text())['rows']
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
start=time.monotonic();counts=dict(cases=0,coefficient_identities=0,polygon_valid_triples=0,literal_coefficients=0,zero_coefficients=0);inputs=[]
for n in range(4):
 for c in range(5,31):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   ch=next(z for z in range(6) if bounds[z][0]*c<bounds[z][1]*r and bounds[z+1][1]*r<bounds[z+1][0]*c)
   row=next(z for z in rows if z['n']==n and z['chamber']==ch)
   vals=[sum(Fraction(v)*c**k[0]*r**k[1] for k,v in q) for q in row['quotient']]
   a=n*c+r;b=a+c;cut=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
   for j in range(a+5):
    q=vals[j] if j<len(vals) else 0
    assert q==24*cut.get(j,0),(n,c,r,j,q,cut.get(j,0));counts['coefficient_identities']+=1;counts['zero_coefficients']+=q==0
   for j in range(a+3):
    i=a+2-j
    if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
     assert cut.get(j,0)*cut.get(j+2,0)<=cut.get(j+1,0)**2,(n,c,r,j);counts['polygon_valid_triples']+=1
   if c<=9:
    aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+5):
     assert p.get((a+4-j,j),0)==cut.get(j,0);counts['literal_coefficients']+=1
   counts['cases']+=1;inputs.append([n,c,r])
d=dict(status='Exact finite experiments only; not proofs',counts=counts,inputs=inputs,failures=[],seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d|dict(inputs='Saved in artifact')))
