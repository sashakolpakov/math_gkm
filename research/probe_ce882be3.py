"""Machine-authored exact symbolic middle-cone certificates; no proof by scan."""
import probe_strip_b9d0d341 as p
from fractions import Fraction as F
from pathlib import Path
import json
a,k,l,q,t,u=p.a,p.k,p.l,p.q,p.t,p.u
T=p.T; J=p.J.subst([a,k,l,0,t,0])
# Divide out the known k+1 in J, and k+2 in H, explicitly.
J0=p.D*p.fall(l-1,2)+p.E*k*(l-1)+p.F*p.fall(k,2)
H0=sum((p.cs[r].subst([a,k,l,0,t,0])*p.fall(k,r-2)*p.fall(l-2,5-r) for r in range(2,6)),p.sp.poly(0))
H=(k+1)*H0+24*t*p.fall(l-2,4)
G=3*(k+l-3)*(k+l-4)*(k+1)*l*J0**2-2*(k+l-1)*(k+l-2)*(l-1)*T*H
assert p.G.subst([a,k,l,0,t,0])==(k+1)*(k+2)*G
out=[]
for kk,ll in [(k,l+5),(k+3,2),(k+2,3),(k+1,4),(k,l+6),(k,l+7)]:
 z=81*G.subst([(kk+ll+2+t)*F(1,3),kk,ll,0,t,0])
 out.append(p.report(str((list(kk.items()) if not isinstance(kk,int) else kk,list(ll.items()) if not isinstance(ll,int) else ll)),z))
Path('evidence/markov-ce882be3/chart-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
