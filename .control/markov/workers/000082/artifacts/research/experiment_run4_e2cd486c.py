"""Machine-authored finite exact full-slice checks for run four. Not a proof."""
from pathlib import Path
from math import gcd
import json,time
from verify_third_75ad import source,path_for,backward
O=Path('evidence/markov-e2cd486c');t=time.monotonic();cases=[];triples=rawcount=0
for c in range(4,31):
 for r in range(1,c):
  if gcd(c,r)!=1:continue
  n=4;a=n*c+r;b=(n+1)*c+r
  w=tuple((k+1)*a//b-k*a//b for k in range(1,b));p=backward(w,3)
  for j in range(a+2):
   pts=[(a+1-j,j+2),(a+2-j,j+1),(a+3-j,j)]
   if all(x>=0 and a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts):
    assert p.get(j+1,0)**2>=p.get(j,0)*p.get(j+2,0);triples+=1
  if c<=8:
   aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(a+4):
    assert raw.get((a+3-j,j),0)==p.get(j,0);rawcount+=1
  cases.append([a,b,c,r])
out=dict(status='Finite exact computation only',sources=len(cases),valid_triples=triples,independent_raw_positions=rawcount,inputs=cases,failures=[],seconds=time.monotonic()-t)
(O/'run4-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='inputs'}))
