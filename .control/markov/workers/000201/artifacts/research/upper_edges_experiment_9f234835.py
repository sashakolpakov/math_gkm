"""Machine-authored finite checks of newly attached exceptional upper columns."""
from three_probe_9e205206 import frame
from math import comb
from pathlib import Path
import json,time
start=time.monotonic();out=dict(low_coefficient_checks=0,zeros=0,upper_low_diagonals=0,failures=[])
for q in list(range(1,49))+[61,79]:
 for r in (False,True):
  a,b,p=frame([False]*(q-1)+[True,r])
  for t in range(3,q+3):
   j=b+2-t
   vals=[0,4*(b+6-3*t),4*(t-2)*comb(b-2*t+6,2)]
   for i,v in enumerate(vals):
    actual=p.get((i,j),0);out['low_coefficient_checks']+=1;out['zeros']+=int(actual==0)
    if actual!=v:out['failures'].append(['coefficient',q,r,i,j,v,actual])
  for j in range(b-q,b+5):
   for i in range(4):
    vs=[p.get(x,0) for x in [(i,j+2),(i+1,j+1),(i+2,j)]]
    out['upper_low_diagonals']+=1
    if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['diagonal',q,r,i,j,vs])
out.update(seconds=time.monotonic()-start,status='Finite exact source recurrence checks, not proof; all zeros retained.')
Path('evidence/markov-9f234835/upper-edges-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
