"""Machine-authored finite exact checks against independent recurrences; not proofs."""
from pathlib import Path
from fractions import Fraction
from math import gcd,comb
import json,time,shutil,importlib.util
from verify_third_75ad import source,path_for,backward
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
d=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
terms=[(k,Fraction(v)) for k,v in d['numerator'] if k[1]<=1]
second=json.loads((O/'second-band-probe.json').read_text())['second_terms']
def candidate(n,c,r,j):
 return sum(v*n**k[0]*c**k[2]*r**k[3]*comb(j-n*k[1]-k[7]+5,5)
  for k,v in terms if j>=n*k[1]+k[7])
def shape(n,c,r,j):return sum(v*n**k[0]*c**k[1]*r**k[2]*j**k[3] for k,v in second)
start=time.monotonic();cases=[];positions=raw_positions=triples=crossings=0;over=[]
for n in range(1,25):
 for c in range(2,11):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   a=n*c+r;b=(n+1)*c+r
   word=tuple((k+1)*a//b-k*a//b for k in range(1,b))
   back=backward(word,3)
   raw=None
   if 4<=n<=8 and c<=4:
    aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
   bound=2*n+2 if n>=4 else n+1
   for j in range(bound+1):
    v=candidate(n,c,r,j)
    assert v==6*back.get(j,0),(n,c,r,j,v,back.get(j,0))
    positions+=1
    if j>=n+4:assert shape(n,c,r,j)==15*v
    if raw is not None:
     assert v==6*raw.get((a+3-j,j),0)
     raw_positions+=1
   for j in range((2*n if n>=4 else n-1)+1):
    pts=[(a+1-j,j+2),(a+2-j,j+1),(a+3-j,j)]
    assert all(x>=0 and a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
    vals=[back.get(k,0) for k in [j,j+1,j+2]]
    assert vals[1]**2>=vals[0]*vals[2]
    triples+=1
    if n<=j<=n+3:crossings+=1
   if n>=4 and len(over)<8:
    j=2*n+3;v=candidate(n,c,r,j)
    if v!=6*back.get(j,0):over.append(dict(n=n,c=c,r=r,j=j,two_band_prediction=str(v),actual_scaled_raw=6*back.get(j,0)))
   cases.append([n,c,r,a,b])
res=dict(status='Finite exact checks only, no universal conclusion',sources=len(cases),positions=positions,independent_raw_positions=raw_positions,polygon_valid_triples=triples,crossing_triples=crossings,failures=[],outside_claimed_range_mismatches=over,inputs=cases,seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(res,indent=2)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,python=__import__('sys').version,limitations=['.scratch denied by sandbox; no attempt to bypass.','Shell here-document temporary-file creation failed.','Pinned dependencies unchanged.']),indent=2)+'\n')
print(json.dumps({k:v for k,v in res.items() if k!='inputs'}),flush=True)
