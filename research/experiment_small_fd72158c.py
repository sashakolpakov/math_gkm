"""Machine-authored exact finite comparison with literal source recurrence. Not proof."""
from pathlib import Path
from fractions import Fraction
from math import gcd
import json,time
from verify_third_75ad import source,path_for,backward
O=Path('evidence/markov-fd72158c');start=time.monotonic()
polys=json.loads((O/'small-run-symbolic.json').read_text())['polynomials']
inputs=[];formula_positions=raw_positions=triples=0
def ev(n,c,r):
 vals=[n,0,c,r,max(2*r-c,0),min(c-r,max(3*r-c,0)),max(3*r-2*c,0)]
 arr={}
 for ks,v in polys[str(n)]:
  v=Fraction(v)
  for a,k in zip(vals,ks[:-1]):v*=a**k
  arr[ks[-1]]=arr.get(ks[-1],0)+v
 return arr
for n in [2,3]:
 for c in range(4,41):
  for r in range(1,c):
   if gcd(c,r)>1:continue
   a=n*c+r;b=(n+1)*c+r
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b))
   p=backward(w,3);f=ev(n,c,r)
   for j in range(a+4):
    assert f.get(j,0)==6*p.get(j,0),(n,c,r,j)
    formula_positions+=1
   for j in range(a+2):
    pts=[(a+1-j,j+2),(a+2-j,j+1),(a+3-j,j)]
    if all(x>=0 and a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):
     assert p.get(j,0)*p.get(j+2,0)<=p.get(j+1,0)**2
     triples+=1
   if c<=10:
    aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+4):
     assert f.get(j,0)==6*raw.get((a+3-j,j),0),(a,b,j)
     raw_positions+=1
   inputs.append([n,c,r,a,b])
out=dict(status='Finite exact computation only; not a universal proof',sources=len(inputs),formula_positions=formula_positions,literal_raw_positions=raw_positions,valid_triples=triples,inputs=inputs,failures=[],seconds=time.monotonic()-start)
(O/'small-run-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='inputs'}))
