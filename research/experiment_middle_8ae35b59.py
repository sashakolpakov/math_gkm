"""Machine-authored exact finite experiments; no universal conclusion."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8ae35b59'
shapes=json.loads((R/'evidence/markov-00a02b28/middle-symbolic.json').read_text())['middle_shapes']
inputs=[(n,c,r) for c in range(5,18) for r in range(1,c) if gcd(c,r)==1 for n in [7,13,26]]
counts=dict(cases=0,middle_coefficients=0,valid_middle_triples=0,literal_coefficients=0,zeros=0)
start=time.monotonic()
for n,c,r in inputs:
 a=n*c+r;b=a+c;word=[(k+1)*a//b-k*a//b for k in range(1,b)]
 cut=backward(word,4);ch=0 if 2*r<c else 3
 cs=[F(0)]*8
 for ks,v in shapes[ch]:cs[ks[4]]+=F(v)*n**ks[0]*c**ks[2]*r**ks[3]
 def val(j):return sum(v*j**k for k,v in enumerate(cs))
 for j in range(2*n+6,3*n+4):
  v=val(j);assert v==120960*cut.get(j,0),(n,c,r,j,v,cut.get(j,0))
  counts['middle_coefficients']+=1;counts['zeros']+=int(v==0)
 for j in range(2*n+6,3*n+1):
  i=a+2-j
  if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert val(j)*val(j+2)<=val(j+1)**2
   counts['valid_middle_triples']+=1
 if n==7 and c<=6:
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j in range(2*n+6,3*n+4):
   assert p.get((a+4-j,j),0)==cut.get(j,0)
   counts['literal_coefficients']+=1
 counts['cases']+=1
 if counts['cases']%30==0:(O/'experiment-progress.json').write_text(json.dumps(dict(counts=counts,seconds=time.monotonic()-start)))
result=dict(status='Finite exact experiments only; not proof',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result|dict(inputs='Retained in artifact')),flush=True)
