"""Machine-authored exact finite checks of new natural-count expression."""
from pathlib import Path
from fractions import Fraction as F
from math import comb,gcd
import json,time
from experiment_8833 import backward,source,path_for,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fa9eb434'
hs=json.loads((O/'universal-numerator-candidates.json').read_text())['coefficients']
rows=[x['numerator'] for x in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
inputs=[(n,c,r) for c in range(5,16) for r in range(1,c) if gcd(c,r)==1 for n in [0,1,2,3,4,5,6,7,9,16,32]]
start=time.monotonic();counts=dict(numerator_identities=0,coefficients=0,literal_coefficients=0,valid_triples=0,zeros=0)
def evaluate(p,n,c,r,q,t,u,shift=0):
 out={}
 for ks,z in p:
  e=ks[1]*n+ks[-1]+shift;v=F(z)
  for a,k in zip([n,1,c,r,q,t,u,1],ks):v*=a**k
  out[e]=out.get(e,0)+v
 return {k:v for k,v in out.items() if v}
for n,c,r in inputs:
 q=max(2*r-c,0);t=min(c-r,max(3*r-c,0));u=max(3*r-2*c,0)
 num={}
 for i,p in enumerate(hs):
  for k,v in evaluate(p,n,c,r,q,t,u,i*n).items():num[k]=num.get(k,0)+v
 correction=({5:min(max(c-2*r,0),max(4*r-c,0))} if 2*r<=c else {6:2*(2*r-c)} if 3*r<=2*c else {6:2*(c-r)} if 4*r<=3*c else {6:2*(c-r),7:4*r-3*c})
 for k,v in correction.items():
  for d in range(9):
   e=4*n+k+d;num[e]=num.get(e,0)+96*v*comb(8,d)*(-1)**d
 num={k:v for k,v in num.items() if v}
 ch=next(i for i,((p,q),(s,t)) in enumerate(zip(bounds,bounds[1:])) if p*c<q*r and t*r<s*c)
 assert num==evaluate(rows[ch],n,c,r,0,0,0),(n,c,r,'candidate mismatch')
 counts['numerator_identities']+=1
 a=n*c+r;b=a+c;raw=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
 for j in range(4*n+10):
  v=sum(z*comb(7+j-e,7) for e,z in num.items() if e<=j)
  assert v==24*raw.get(j,0),(n,c,r,j,'source cut')
  counts['coefficients']+=1;counts['zeros']+=int(v==0)
 for j in range(4*n+6):
  i=a+2-j
  if all(polyguard(a,b,*x) for x in [(i,j+2),(i+1,j+1),(i+2,j)]):
   assert raw.get(j,0)*raw.get(j+2,0)<=raw.get(j+1,0)**2
   counts['valid_triples']+=1
 if b<=65:
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
  for j in range(a+5):
   assert p.get((a+4-j,j),0)==raw.get(j,0)
   counts['literal_coefficients']+=1
result=dict(status='Exact finite computation only; no new universal inequality proved',inputs=inputs,counts=counts,failures=[],seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(result,indent=2)+'\n');print(counts,flush=True)
