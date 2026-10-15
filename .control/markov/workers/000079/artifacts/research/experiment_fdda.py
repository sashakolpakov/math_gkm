"""Machine-authored exact independent finite source checks; not proof."""
from pathlib import Path
from fractions import Fraction
from math import gcd,comb
import json,time
from verify_third_75ad import source,path_for,backward
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fddabb33'
data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
low=[(tuple(k),Fraction(v)) for k,v in data['low_numerator']]
def low_coeff(n,c,r,j):
 return sum(v*n**k[0]*c**k[2]*r**k[3]*comb(j-k[7]+5,5)
   for k,v in low if j>=k[7])
start=time.monotonic();positions=raw_positions=triples=0;cases=[];failures=[]
for n in range(6,25):
 for c in range(2,11):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   a=n*c+r;b=(n+1)*c+r
   word=tuple((k+1)*a//b-k*a//b for k in range(1,b))
   back=backward(word,3)
   raw=None
   if n<=9 and c<=5:
    aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(4,n+2):
    v=low_coeff(n,c,r,j);assert v.denominator==1
    assert v==6*back.get(j,0),(n,c,r,j,v,back.get(j,0))
    positions+=1
    if raw is not None:
     assert v==6*raw.get((a+3-j,j),0)
     raw_positions+=1
   for j in range(4,n-1):
    i=a+1-j;pts=[(i,j+2),(i+1,j+1),(i+2,j)]
    assert all(a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
    vals=[back.get(k,0) for k in [j,j+1,j+2]]
    assert vals[1]**2>=vals[0]*vals[2]
    triples+=1
   cases.append([n,c,r,a,b])
res=dict(status='Finite exact experiments, not universal proof',sources=len(cases),coefficient_positions=positions,independent_raw_positions=raw_positions,polygon_valid_triples=triples,failures=failures,inputs=cases,seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps({k:v for k,v in res.items() if k!='inputs'}),flush=True)
