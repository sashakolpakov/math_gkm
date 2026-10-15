"""Machine-authored finite audit of full saved chamber numerators against source cuts."""
from pathlib import Path
from fractions import Fraction as F
from math import comb,gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
rows=[x['numerator'] for x in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
inputs=[(n,c,r) for c in range(5,19) for r in range(1,c) if gcd(c,r)==1 for n in [4,5,6,7,8,11,17,31]]
counts=dict(coefficients=0,valid_triples=0,literal_coefficients=0,zero_coefficients=0)
start=time.monotonic()
for n,c,r in inputs:
 t=next(t for t,((p,q),(s,u)) in enumerate(zip(bounds,bounds[1:])) if p*c<q*r and u*r<s*c)
 a=n*c+r;b=a+c;raw=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
 numerator={}
 for ks,z in rows[t]:
  assert ks[4:7]==[0,0,0]
  e=ks[1]*n+ks[-1];v=F(z)*n**ks[0]*c**ks[2]*r**ks[3]
  numerator[e]=numerator.get(e,0)+v
 for j in range(4*n+8):
  value=sum(v*comb(7+j-e,7) for e,v in numerator.items() if e<=j)
  assert value==24*raw.get(j,0),(n,c,r,j,'normalized candidate')
  counts['coefficients']+=1;counts['zero_coefficients']+=int(raw.get(j,0)==0)
 for j in range(4*n+6):
  i=a+2-j
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2,(n,c,r,j,'LC')
   counts['valid_triples']+=1
 if b<=80:
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j in range(a+5):
   assert p.get((a+4-j,j),0)==raw.get(j,0),(n,c,r,j,'literal')
   counts['literal_coefficients']+=1
result=dict(status='Finite exact full-fourth checks only; no universal source conclusion',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'full-fourth-checks.json').write_text(json.dumps(result,indent=2)+'\n');print(counts,flush=True)
