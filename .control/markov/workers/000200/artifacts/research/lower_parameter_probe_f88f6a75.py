"""Machine-authored lower diagonal parameter tests; no theorem inference."""
from math import comb
from functools import lru_cache
from pathlib import Path
import json,time
t0=time.monotonic()
@lru_cache(None)
def K(t,j,k):return sum((1 if r==0 else 4*r)*comb(j-r+t+3,t+3)*comb(k-r+t,t) for r in range(min(j,k)+1))
out=dict(counts=dict(parameter=0,minor=0,diagonal=0),failures={x:[] for x in ['parameter','minor','diagonal']})
for t in range(25):
 for j in range(41):
  for k in range(41):
   gaps=dict(parameter=K(t+1,j,k)**2-K(t,j,k)*K(t+2,j,k),
     minor=K(t,j,k)*K(t+1,j+1,k)-K(t+1,j,k)*K(t,j+1,k),
     diagonal=K(t+1,j+1,k)**2-K(t,j+2,k)*K(t+2,j,k))
   for key,gap in gaps.items():
    out['counts'][key]+=1
    if gap<0 and len(out['failures'][key])<15:out['failures'][key].append(dict(t=t,j=j,k=k,gap=gap))
out.update(seconds=time.monotonic()-t0,status='Finite exact auxiliary parameter probes. Failures do not refute source inequalities.')
Path('evidence/markov-f88f6a75/lower-parameter-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
