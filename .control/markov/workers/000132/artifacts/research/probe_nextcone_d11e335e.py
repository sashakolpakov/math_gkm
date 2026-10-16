"""Machine-authored next-cone experiment. Exact polynomial evidence only."""
from pathlib import Path
from fractions import Fraction
import json
ns={};exec(Path('research/probe_strip_d11e335e.py').read_text().split('out=[]')[0],ns)
p,a,k,l,t,J,H,I=[ns[x] for x in ['p','a','k','l','t','J','H','I']]
b=k+l+2
Hnew=(k+1)*H+24*t*p.fall(l-2,4)
Inew=(k+1)*I+(-480*t+288*a*t+96*(b-2*a))*p.fall(l-3,5)+(-864+96*a+96*b)*t*(k+1)*p.fall(l-3,4)
G=4*(k+l-5)*(k+l-6)*(l-1)*Hnew**2-3*(k+l-3)*(k+l-4)*(l-2)*(k+1)*J*Inew
out=[]
for name,kk,ll in [('large',k,l+7),('three',k+4,3),('four',k+3,4),('five',k+2,5),('six',k+1,6)]:
 z=G.subst([(kk+ll+2+t)*Fraction(1,3),kk,ll,0,t,0]);out.append(p.report(name,z))
data={'status':'Candidate only; no Lean proof or source coefficient bridge','slope':'2a<=b<=3a; t=3a-b, v=b-2a','charts':out}
Path('evidence/markov-d11e335e/next-cone-probe.json').write_text(json.dumps(data,indent=2)+'\n');print(json.dumps(data))
