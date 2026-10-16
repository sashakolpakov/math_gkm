"""Machine-authored exact first-tail candidate checks; no universal source proof."""
from pathlib import Path
from math import comb
import json,time
from low_probe_e9cdd527 import solve,l3,l4
O=Path('/Users/sasha/math_gkm/evidence/markov-e9cdd527')
out={'status':'finite first-tail candidate checks, source bridge not proved','checks':0,'crossing_triples':0,'failures':[]}
for q in range(1,201):
 for r in [False,True]:
  n=3*q+(1 if r else 2);a=solve(q,r,4,q+1)
  corrections={2:8 if r else 4,3:8*(q-2) if r else 4*(q-1),4:4*(q-2)*(q-3) if r else 2*(q-1)*(q-2)}
  for i,base in [(2,0),(3,l3(q+1)),(4,l4(n,q+1))]:
   out['checks']+=1
   if a[i,q+1]!=base+corrections[i]:out['failures'].append([q,r,i,a[i,q+1],str(base+corrections[i])])
  out['crossing_triples']+=1
  if a[4,q-1]*a[4,q+1]>=a[4,q]**2:out['failures'].append(['strict_crossing',q,r])
(O/'first-tail-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
