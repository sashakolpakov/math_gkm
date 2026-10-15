"""Machine-authored finite exact checks. No computation is a universal proof."""
from pathlib import Path
from math import gcd
import json,time
from verify_third_75ad import source,path_for,backward
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-53d5229e';d=json.loads((O/'tail-probe.json').read_text());cross=json.loads((O/'cross-probe.json').read_text())
def val(p,vs):return sum(v*__import__('math').prod(x**k for x,k in zip(vs,e)) for e,v in p)
t=time.monotonic();count=rawcount=triples=0;cases=[];outside=[]
for n in range(5,21):
 for c in range(4,13):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   a=n*c+r;b=(n+1)*c+r;w=tuple((k+1)*a//b-k*a//b for k in range(1,b));p=backward(w,3);ch='low' if 2*r<=c else 'high'
   for j in range(2*n+5,3*n+4):
    v=val(d['tails'][ch],[0,c,r,3*n+3-j]);assert v==90*p.get(j,0),(n,c,r,j,v,p.get(j,0));count+=1
   for off in range(1,7):
    v=val(cross['shapes'][ch][off-1],[n,c,r,0]);assert v==90*p.get(2*n+off,0);count+=1
   for j in range(3*n+2):
    pts=[(a+1-j,j+2),(a+2-j,j+1),(a+3-j,j)]
    assert all(x>=0 and a*b<=b*x+a*y and x+y<=a+b-1 for x,y in pts)
    assert p.get(j+1,0)**2>=p.get(j,0)*p.get(j+2,0)
    triples+=1
   if n<=7 and c<=5:
    aa,bb,raw=source(path_for(a,b));assert(aa,bb)==(a,b)
    for j in range(3*n+4):assert raw.get((a+3-j,j),0)==p.get(j,0);rawcount+=1
   if len(outside)<6:
    j=3*n+4;v=val(d['tails'][ch],[0,c,r,-1]);actual=90*p.get(j,0)
    if v!=actual:outside.append(dict(n=n,c=c,r=r,j=j,uncorrected=v,scaled_raw=actual))
   cases.append([n,c,r,a,b])
out=dict(status='Finite exact experiments only',sources=len(cases),identity_positions=count,independent_raw_positions=rawcount,polygon_valid_triples=triples,failures=[],outside_range_mismatches=outside,inputs=cases,seconds=time.monotonic()-t)
(O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='inputs'}),flush=True)
