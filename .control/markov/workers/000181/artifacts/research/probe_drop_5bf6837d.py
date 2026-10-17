"""Exact experimental tests only; machine-authored 5bf6837d."""
from probe_moments_1c65a306 import kernel,moments
from fractions import Fraction as F
from pathlib import Path
import json,time,random
O=Path('/Users/sasha/math_gkm/evidence/markov-5bf6837d')
start=time.monotonic(); out=dict(checks=0,failures=[],minimum=None,status='finite exact experiment, not proof')
minimum=F(1); witness=None
for j in range(2,101):
 for s in [0,1,2,5,10,30,100,1000]:
  f=kernel(j,s);old=moments(f,0)[2]
  for h in range(1,j+1):
   v=moments(f,h)[2];d=v-old+F(1,4);out['checks']+=1
   if d<minimum:minimum=d;witness=[j,s,h,str(v),str(old)]
   if d<0 and len(out['failures'])<20:out['failures'].append([j,s,h,str(d)])
   old=v
out.update(minimum=str(minimum),witness=witness,seconds=time.monotonic()-start)
(O/'drop-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
