"""Machine-authored finite diagnosis of the excluded short predecessor cycles."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json,time
from experiment_8833 import backward
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-38ebef17'
data=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
out=[];start=time.monotonic()
for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
 ch=next(k for k in range(6) if r*bounds[k+1][1]<=c*bounds[k+1][0])
 for n in range(25):
  a=n*c+r;b=a+c;actual=backward([(k+1)*a//b-k*a//b for k in range(1,b)],4)
  num={}
  for ks,v in data[ch]['numerator']:
   j=ks[1]*n+ks[7];num[j]=num.get(j,F(0))+F(v)*n**ks[0]*c**ks[2]*r**ks[3]
  naive={j:sum(v*comb(7+j-k,7) for k,v in num.items() if k<=j) for j in range(4*n+8)}
  delta={j:24*actual.get(j,0)-naive[j] for j in naive if 24*actual.get(j,0)!=naive[j]}
  assert all(v.denominator==1 for v in delta.values())
  out.append(dict(n=n,c=c,r=r,chamber=ch,delta=[[j,int(v)] for j,v in delta.items()],shifted_delta=[[j-c*n,int(v)] for j,v in delta.items()]))
(O/'small-cycle-probe.json').write_text(json.dumps(dict(status='Finite exact diagnosis only; no universal source extension or inequality proof',meaning='24 times actual fourth cut polynomial minus extrapolated c>=5 quotient, retaining all coefficients',rows=out,seconds=time.monotonic()-start),indent=2)+'\n')
for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
 print(c,r,[(z['n'],z['shifted_delta']) for z in out if z['c']==c and z['r']==r and z['n'] in [4,5,10,24]],flush=True)
