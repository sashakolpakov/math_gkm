"""Machine-authored exact shifted-polynomial probe; not a theorem."""
from pathlib import Path
from fractions import Fraction as F
from weighted_beta_symbolic_ca9709f2 import P,var,div_exact
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-99a0f3b8'
raw=json.loads((R/'evidence/markov-97b019af/sixth-probe.json').read_text())
ps={n:P({tuple(k):F(v) for k,v in vs}) for n,vs in raw['polynomials'].items()}
a,m,H,w=[var(j) for j in range(4)];red=div_exact(ps['certificate'],a*m*(m-1))
start=time.monotonic();out=[]
for h in [3,2,1,0,-1,-2,-4,-8]:
 for off in [7,8,10,12,16,24,40]:
  bad={}
  for name,p in [('delta',ps['delta']),('A',ps['A']),('C',ps['C']),('minusK',-ps['K']),('reduced',red)]:
   q=p.ev([a+off,m+2,3*(a+off)+(m+2)*F(1,2)+h+H,w]);neg=[(k,str(v)) for k,v in q.d.items() if v<0]
   bad[name]=len(neg)
  out.append(dict(h=h,offset=off,negative=bad))
  if not any(bad.values()):break
(O/'sign-probe.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-start),indent=2));print(json.dumps(out))
