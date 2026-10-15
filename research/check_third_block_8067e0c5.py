"""Machine-authored independent exact coefficient checks of third-block candidates."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
from probe_shift_f2da221d import load
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
shape0=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
shape1=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['shape'])
shape2=[load(p) for p in json.loads((O/'second-block-probe.json').read_text())['second_shapes']]
shape3=[load(p) for p in json.loads((O/"third-block-probe.json").read_text())["third_shapes"]]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
def ev(p,values):
 out=F(0)
 for ks,v in p.items():
  for a,b in zip(values,ks):v*=a**b
  out+=v
 return out
start=time.monotonic();counts=dict(coefficients=0,valid_triples=0,literal_coefficients=0)
inputs=[(n,c,r) for c in range(5,15) for r in range(1,c) if gcd(c,r)==1 for n in [7,8,12,20]]
inputs += [(n,c,r) for n in [41,101] for c,r in [(5,1),(5,4),(13,5),(13,8)]]
for n,c,r in inputs:
 a=n*c+r;b=a+c;raw=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
 t=next(t for t,((p,q),(s,u)) in enumerate(zip(bounds,bounds[1:])) if p*c<q*r and u*r<s*c)
 for k in range(7,n+3):
  value=ev(shape0,[n,0,c,n*c+r,3*n+k,0,0,0])+ev(shape1,[n,0,c,r,2*n+k,0,0,0])+ev(shape2[int(2*r>c)],[n,0,c,r,n+k,0,0,0])+ev(shape3[t],[n,0,c,r,k,0,0,0])
  assert value==7560*raw.get(3*n+k,0),(n,c,r,k,'shape')
  counts['coefficients']+=1
 for k in range(7,n+1):
  j=3*n+k;i=a+2-j
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2,(n,c,r,k,'LC')
   counts['valid_triples']+=1
 if b<=80:
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j in range(a+5):
   assert p.get((a+4-j,j),0)==raw.get(j,0),(a,b,j,'literal')
   counts['literal_coefficients']+=1
result=dict(status='Exact finite candidate checks only; not a formal source bridge',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'third-block-checks.json').write_text(json.dumps(result,indent=2)+'\n');print(counts,flush=True)
