"""Machine-authored possible next cone. Generated algebra is not a Lean proof."""
import probe_strip_b9d0d341 as p
from fractions import Fraction
from pathlib import Path
import json
a,k,l,q,t,u=p.a,p.k,p.l,p.q,p.t,p.u
out=[]
for kn,kk in [('0',0),('1',1),('2',2),('K+3',k+3)]:
 for ln,ll in [('2',2),('3',3),('4',4),('5',5),('6',6),('L+7',l+7)]:
  if isinstance(kk,int) and isinstance(ll,int) and kk+ll<5:continue
  aa=(kk+ll+2+t)*Fraction(1,3)
  z=81*p.G.subst([aa,kk,ll,0,t,0])
  out.append(p.report(f'middle:k={kn},l={ln}',z))
Path('evidence/markov-b9d0d341/middle-strip-candidates.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
