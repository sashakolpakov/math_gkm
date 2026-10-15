"""Machine-authored exact finite onset experiments, never proof premises."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-96dea62b'
start=time.monotonic();d=json.loads((O/'onset-certificates.json').read_text())
def ev(p,n,c,r):return sum(F(v)*n**k[0]*c**k[2]*r**k[3] for k,v in p)
inputs=[(n,c,r) for c in range(5,22) for r in range(1,c) if gcd(c,r)==1 for n in [4,5,6,8,12,20]]
inputs += [(n,c,r) for n in [51,102,211] for c,r in [(5,1),(5,4),(7,3),(13,8)]]
counts=dict(coefficients=0,valid_triples=0,literal_coefficients=0)
for n,c,r in inputs:
 a=n*c+r;b=a+c;raw=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
 for k in range(1,7):
  assert ev(d['values'][str(k)],n,c,r)==7560*raw.get(n+k,0),(n,c,r,k)
  counts['coefficients']+=1
 for k in range(1,5):
  j=n+k;i=a+2-j
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2,(n,c,r,k,'LC')
   counts['valid_triples']+=1
 if b<=80:
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j in range(a+5):
   assert p.get((a+4-j,j),0)==raw.get(j,0),(a,b,j,'literal')
   counts['literal_coefficients']+=1
result=dict(status='Exact finite experiments only; no universal conclusion',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(counts,flush=True)
