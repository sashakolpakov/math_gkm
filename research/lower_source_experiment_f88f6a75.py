"""Machine-authored new lower convolution versus independent recurrence checks."""
from three_probe_9e205206 import frame
from math import comb
from pathlib import Path
import json,time
t0=time.monotonic()
def K(t,j,k):
 if k<0:return 0
 return sum((1 if r==0 else 4*r)*comb(j-r+t+3,t+3)*comb(k-r+t,t) for r in range(min(j,k)+1))
out=dict(coefficients=0,zeros=0,vertical_triples=0,failures=[])
for q in list(range(1,33))+[41,53]:
 for r in [False,True]:
  a,b,p=frame([False]*(q-1)+[True,r])
  for j in range(q+1):
   for i in range(3,min(b+5-j,75)):
    v=K(i-3,j,b+2-i-j);actual=p.get((i,j),0)
    out['coefficients']+=1;out['zeros']+=int(actual==0)
    if v!=actual:out['failures'].append(['coefficient',q,r,i,j,v,actual])
   if j+2<=q:
    for i in range(min(b+4-j,75)):
     vs=[p.get((i,j+l),0) for l in range(3)];out['vertical_triples']+=1
     if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['vertical',q,r,i,j,vs])
out.update(seconds=time.monotonic()-t0,status='Finite exact independent recurrence comparisons; all coefficient zeros retained. Not a universal proof.')
Path('evidence/markov-f88f6a75/lower-source-experiment.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
