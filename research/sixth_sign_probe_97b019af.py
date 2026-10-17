"""Machine-authored exact shifted coefficient test for the sixth certificate."""
from pathlib import Path
from fractions import Fraction as F
from weighted_beta_symbolic_ca9709f2 import P,var,div_exact
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-97b019af'
start=time.monotonic();raw=json.loads((O/'sixth-probe.json').read_text())
ps={n:P({tuple(k):F(v) for k,v in vs}) for n,vs in raw['polynomials'].items()}
a,m,H,w=[var(j) for j in range(4)]
reduced=div_exact(ps['certificate'],a*m*(m-1))
out=dict(status='symbolic experiment only',reduced=[[list(k),str(v)] for k,v in sorted(reduced.d.items())],shifts=[])
for offset in [3,4,5,6,7,8,9,10,12,16,32]:
 row=dict(offset=offset)
 for name,p in [('delta',ps['delta']),('A',ps['A']),('C',ps['C']),('minusK',-ps['K']),('reduced',reduced)]:
  q=p.ev([a+offset,m+2,3*(a+offset)+(m+2)*F(1,2)+4+H,w])
  bad=[(k,str(v)) for k,v in sorted(q.d.items()) if v<0]
  row[name]=dict(terms=len(q.d),negative=len(bad),sample=bad[:5],constant=str(q.d.get((0,0,0,0),0)))
 out['shifts'].append(row)
out['seconds']=time.monotonic()-start
(O/'sixth-sign-probe.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out['shifts']))
