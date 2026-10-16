"""Machine-authored exact candidate for 3a<=b<=4a. Experiments, not proofs."""
import probe_strip_b9d0d341 as p
from pathlib import Path
import re,json
from fractions import Fraction
a,k,l,t=p.a,p.k,p.l,p.t
b=k+l+2
src=Path('research/MarkovHorizontalFourthSeedM511.lean').read_text()
cs=[]
for r in range(3,8):
 body=re.search(r'def h4c'+str(r)+r'M511.*?:=\n(.*?)(?=\n\n)',src,re.S).group(1).strip().replace('^','**')
 cs.append(eval(body,{'__builtins__':{}},dict(a=a,b=b,q=0,t=0,u=0,v=0,w=0,z=0)))
J=p.D*p.fall(l-1,2)+p.E*k*(l-1)+p.F*p.fall(k,2)
H=sum((p.cs[r].subst([a,k,l,0,0,0])*p.fall(k,r-2)*p.fall(l-2,5-r) for r in range(2,6)),p.sp.poly(0))
I=sum((c*p.fall(k,r)*p.fall(l-3,4-r) for r,c in enumerate(cs)),p.sp.poly(0))
Igen=(k+1)*I+96*t*p.fall(l-3,5)
G=4*(k+l-5)*(k+l-6)*(l-1)*(k+1)*H**2-3*(k+l-3)*(k+l-4)*(l-2)*J*Igen
out=[]
for name,kk,ll in [('large',k,l+7),('three',k+4,3),('four',k+3,4),('five',k+2,5),('six',k+1,6)]:
 z=G.subst([(kk+ll+2+t)*Fraction(1,4),kk,ll,0,t,0]);out.append(p.report(name,z))
data={'status':'Exact rational symbolic candidate; no source bridge or theorem yet','slope':'3a<=b<=4a, t=4a-b','charts':out}
Path('evidence/markov-d11e335e/middle-probe.json').write_text(json.dumps(data,indent=2)+'\n');print(json.dumps(data))
