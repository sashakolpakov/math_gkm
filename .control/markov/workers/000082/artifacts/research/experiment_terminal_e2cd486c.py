"""Machine-authored exact source checks. Finite experiments are not universal proofs."""
from pathlib import Path
from math import gcd,prod
import json,time
from verify_third_75ad import source,path_for,backward
O=Path('evidence/markov-e2cd486c');d=json.loads((O/'terminal-probe.json').read_text())
def val(p,vs):return sum(v*prod(x**k for x,k in zip(vs,e)) for e,v in p)
t=time.monotonic();cases=[];rawcount=coeffcount=triples=0;excluded=[]
for n in range(3,16):
 for c in range(4,19):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   a=n*c+r;b=(n+1)*c+r
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b));p=backward(w,3)
   if c<=3*r:
    ch='lo' if 2*r<=c else ('mid' if 3*r<=2*c else 'hi')
    for k,sh in enumerate(d['shapes'][ch]):
     j=3*n+2+k;v=val(sh,[0,c,r,0]);assert v==90*p.get(j,0),(n,c,r,j,v,p.get(j,0));coeffcount+=1
   for off in [2,3]:
    j=3*n+off;pts=[(a+1-j,j+2),(a+2-j,j+1),(a+3-j,j)]
    valid=all(x>=0 and a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
    assert valid==(off*c<=c+3*r)
    if valid:
     assert p.get(j+1,0)**2>=p.get(j,0)*p.get(j+2,0);triples+=1
   if n<=5 and c<=7:
    aa,bb,raw=source(path_for(a,b));assert(aa,bb)==(a,b)
    for j in range(3*n+2,3*n+6):
     assert raw.get((a+3-j,j),0)==p.get(j,0);rawcount+=1
   cases.append([n,c,r,a,b])
out=dict(status='Finite exact computation only',sources=len(cases),coefficient_checks=coeffcount,raw_recurrence_checks=rawcount,valid_terminal_triples=triples,inputs=cases,seconds=time.monotonic()-t,failures=[])
(O/'terminal-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='inputs'}))
