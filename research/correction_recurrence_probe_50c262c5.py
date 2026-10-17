"""Machine-authored exploratory exact recurrence of the finite correction.
The recorded recurrence tests are experiments, not proved source identities.
"""
from pathlib import Path
from math import comb
from three_probe_9e205206 import frame,add,mul,neg,s,v
import json
def D(c,j,k):return sum((1 if z==0 else 4*z)*comb(j-z+c+3,c+3)*comb(k-z+c,c) for z in range(min(j,k)+1))
out={}
for r in (False,True):
 H=[{},{}]
 for q in range(2,15):
  a,b,p=frame([False]*(q-1)+[True,r]);h={}
  for (i,j),val in p.items():
   if i<3:continue
   e=val-D(i-3,j,b+2-i-j)
   if e:
    assert e%4==0 and j>=q+1
    h[i-3,j-q-1]=e//4
  H.append(h)
 forcing=[add(add(H[q],neg(mul(s,H[q-1]))),mul(v,H[q-2])) for q in range(2,len(H))]
 out[str(r)]={'H':[sorted([i,j,c] for (i,j),c in x.items()) for x in H],
   'forcing':[sorted([i,j,c] for (i,j),c in x.items()) for x in forcing]}
out['status']='Finite exact polynomial observations only; no universal source recurrence or positivity theorem.'
Path('evidence/markov-50c262c5/correction-recurrence-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({r:out[r]['forcing'][:8] for r in ('False','True')}))
