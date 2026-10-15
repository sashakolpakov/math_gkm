"""Machine-authored durable reproduction of the executed correction normalization."""
from pathlib import Path
from math import comb
import json
O=Path('/Users/sasha/math_gkm/evidence/markov-38ebef17')
rows=json.loads((O/'small-cycle-probe.json').read_text())['rows'];out=[]
for z in rows:
 n,c,r=z['n'],z['c'],z['r'];d=2*(4-c);p={j-(c*n+r+c):v//24 for j,v in z['delta']};q={}
 assert all(v%24==0 for j,v in z['delta'])
 for j,v in p.items():
  for k in range(d+1):q[j+k]=q.get(j+k,0)+v*(-1)**k*comb(d,k)
 out.append(dict(n=n,c=c,r=r,denominator_power=d,shift=c*n+r+c,numerator=[[j,v] for j,v in sorted(q.items()) if v]))
expected=json.loads((O/'small-cycle-normalized.json').read_text())['rows']
assert out==expected
print('Reproduced all 125 exact finite correction normalizations; no universal proof.')
