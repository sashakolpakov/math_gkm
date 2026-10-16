"""Machine-authored exact chart probe for remaining high source slopes."""
import probe_strip_b9d0d341 as p
from fractions import Fraction as F
from pathlib import Path
import json
a,k,l,q,t,u=p.a,p.k,p.l,p.q,p.t,p.u
out=[]
for name,kk,ll in [('large',k,l+5),('two',k+3,2),('three',k+2,3),('four',k+1,4)]:
 b=kk+ll+2
 for cone,aa,qq,tt,uu in [('half',(b+q)*F(1,2),q,(b-q)*F(1,2),0),('high',(2*b+u)*F(1,3),(b+2*u)*F(1,3),(b-u)*F(1,3),u)]:
  z=81*16*p.G.subst([aa,kk,ll,qq,tt,uu])
  out.append(p.report(cone+':'+name,z))
Path('evidence/markov-ce882be3/remaining-chart-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
