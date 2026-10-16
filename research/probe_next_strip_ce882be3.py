"""Machine-authored next-strip algebra probe. No source bridge or theorem claim."""
import probe_strip_b9d0d341 as p
from pathlib import Path
import re,json
a,k,l,q,t,u=p.a,p.k,p.l,p.q,p.t,p.u
b=k+l+2
src=Path('research/MarkovHorizontalFourthSeedM511.lean').read_text()
cs=[]
for r in range(3,8):
 body=re.search(r'def h4c'+str(r)+r'M511.*?:=\n(.*?)(?=\n\n)',src,re.S).group(1).strip().replace('^','**')
 cs.append(eval(body,{'__builtins__':{}},dict(a=a,b=b,q=0,t=0,u=0,v=0,w=0,z=0)))
J=p.D*p.fall(l-1,2)+p.E*k*(l-1)+p.F*p.fall(k,2)
H=sum((p.cs[r].subst([a,k,l,0,0,0])*p.fall(k,r-2)*p.fall(l-2,5-r) for r in range(2,6)),p.sp.poly(0))
I=sum((c*p.fall(k,r)*p.fall(l-3,4-r) for r,c in enumerate(cs)),p.sp.poly(0))
G=4*(k+l-5)*(k+l-6)*(l-1)*H**2-3*(k+l-3)*(k+l-4)*(l-2)*J*I
out=[]
for name,kk,ll in [('large',k,l+7),('three',k+4,3),('four',k+3,4),('five',k+2,5),('six',k+1,6)]:
 z=G.subst([a+1,kk,ll,0,0,0]);out.append(p.report(name,z))
out={'status':'Exact symbolic candidate for vertical starting j=2 in low slope b>=4a; no Lean proof or coefficient bridge here','charts':out,'gap_terms':len(G)}
Path('evidence/markov-ce882be3/next-strip-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
