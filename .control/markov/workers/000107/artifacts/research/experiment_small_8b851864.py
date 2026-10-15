"""Machine-authored finite source-window checks; experiments are not proofs."""
from pathlib import Path
from fractions import Fraction as F
from math import gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8b851864'
charts=json.loads((R/'evidence/markov-5dc9c88d/onset-candidates.json').read_text())['charts']
start=time.monotonic();counts=dict(cases=0,coefficient_identities=0,valid_triples=0,literal_coefficients=0,zeros=0)
inputs=[];used=[0]*4;outside=[]
def val(p,N,C,R):return sum(F(v)*N**ks[0]*C**ks[2]*R**ks[3] for ks,v in p)
for c in range(5,18):
 for r in range(1,c):
  if gcd(c,r)!=1:continue
  if 2*r<c:ci,C,Rr=(1,c-5,0) if r==1 else (0,c-2*r-1,r-2)
  else:ci,C,Rr=(3,0,c-5) if c-r==1 else (2,c-r-2,2*r-c-1)
  assert C>=0 and Rr>=0
  for n in [3,4,5,6]:
   inputs.append([n,c,r]);used[ci]+=1;a=n*c+r;b=a+c
   cut=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
   vs=[val(p,n-7,C,Rr) for p in charts[ci]['values']]
   for k,v in enumerate(vs,1):
    if n+5<=2*n+k<=3*n+3:
     assert v==120960*cut.get(2*n+k,0),(n,c,r,k)
     counts['coefficient_identities']+=1;counts['zeros']+=int(v==0)
    elif v!=120960*cut.get(2*n+k,0) and len(outside)<12:outside.append(dict(n=n,c=c,r=r,k=k,formula=str(v),source_scaled=str(120960*cut.get(2*n+k,0))))
   for k in range(1,6):
    gap=vs[k]**2-vs[k-1]*vs[k+1]
    assert gap==val(charts[ci]['gaps'][k-1],n-7,C,Rr) and gap>=0
    j=2*n+k;i=a+2-j
    if n+5<=j and j+2<=3*n+3 and all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):counts['valid_triples']+=1
   if n in [3,4] and c<=7:
    aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
    for k in range(1,8):
     j=2*n+k;assert p.get((a+4-j,j),0)==cut.get(j,0);counts['literal_coefficients']+=1
   counts['cases']+=1
d=dict(status='Finite exact checks only; not proof',counts=counts,inputs=inputs,chart_cases=used,failures=[],outside_window_mismatches=outside,seconds=time.monotonic()-start)
(O/'small-onset-experiments.json').write_text(json.dumps(d,indent=2)+'\n');print(d|dict(inputs='Saved in artifact',outside_window_mismatches=len(outside)),flush=True)
