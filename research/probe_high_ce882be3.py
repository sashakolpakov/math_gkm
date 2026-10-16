"""Machine-authored next-cone feasibility probe; not a theorem."""
import probe_strip_b9d0d341 as p
from fractions import Fraction as F
from pathlib import Path
import json
a,k,l,q,t,u=p.a,p.k,p.l,p.q,p.t,p.u
out=[]
for kn,kk in [('0',0),('1',1),('2',2),('K+3',k+3)]:
 for ln,ll in [('2',2),('3',3),('4',4),('5',5),('6',6),('L+7',l+7)]:
  if isinstance(kk,int) and isinstance(ll,int) and kk+ll<5:continue
  b=kk+ll+2
  aa=(b+q)*F(1,2)
  z=16*p.G.subst([aa,kk,ll,q,b-aa,0])
  out.append(p.report(f'half_to_twothirds:k={kn},l={ln}',z))
Path('evidence/markov-ce882be3/high-chart-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
