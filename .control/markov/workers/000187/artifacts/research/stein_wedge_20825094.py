"""Machine-authored polynomial search for a rigorous generator wedge."""
from weighted_beta_symbolic_ca9709f2 import P,var,expr
from fractions import Fraction as F
from pathlib import Path
import json
O=Path('/Users/sasha/math_gkm/evidence/markov-20825094')
raw=json.loads((O/'stein-bound-symbolic.json').read_text())
ps={name:P({tuple(k):F(v) for k,v in vals}) for name,vals in raw.items()}
x,y,z,w=[var(j) for j in range(4)]
rows=[]
for c in [1,2,4,8,16]:
 aa=x+c*(y+2)**2;mm=y+2;HH=3*aa+mm*F(1,2)+4+z
 pol=ps['num'].ev([aa,mm,HH,w]); neg=[(k,str(v)) for k,v in pol.d.items() if v<0]
 rows.append(dict(c=c,terms=len(pol.d),negative=neg))
 print(c,len(pol.d),len(neg))
(O/'stein-wedge.json').write_text(json.dumps(rows,indent=2))
