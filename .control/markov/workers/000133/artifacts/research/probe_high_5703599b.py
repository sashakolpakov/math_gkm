"""Machine-authored general row-two gap exploration. Exact arithmetic, not proof."""
from pathlib import Path
from fractions import Fraction
import sys,json,re,time
sys.path.insert(0,'research')
import probe_strip_b9d0d341 as p
sp=p.sp;a,k,l,q,t,u=p.a,p.k,p.l,p.q,p.t,p.u
N=k+l;b=N+2
J=8*q*p.fall(l,3)+p.D*k*p.fall(l,2)+p.E*p.fall(k,2)*l+p.F*p.fall(k,3)
H=sum((p.cs[r]*p.fall(k+1,r)*p.fall(l-1,5-r) for r in range(6)),sp.poly(0))
source=Path('research/MarkovHorizontalFourthSeedM511.lean').read_text()
bodies=[re.search(r'def h4c'+str(r)+r'M511.*?:=\n(.*?)(?=\n\n)',source,re.S).group(1).strip().replace('^','**') for r in range(8)]
out=[];start=time.monotonic()
for name,aa,qq,tt,uu,vv,ww,zz in [
 ('three_halves_to_two',(b+q)*Fraction(1,2),q,b-(b+q)*Fraction(1,2),0,0,q,0),
 ('four_thirds_to_three_halves',(2*b+q)*Fraction(1,3),2*(2*b+q)*Fraction(1,3)-b,b-(2*b+q)*Fraction(1,3),q,0,b-(2*b+q)*Fraction(1,3),0),
 ('one_to_four_thirds',(3*b+q)*Fraction(1,4),2*(3*b+q)*Fraction(1,4)-b,b-(3*b+q)*Fraction(1,4),3*(3*b+q)*Fraction(1,4)-2*b,0,b-(3*b+q)*Fraction(1,4),q)]:
 cs=[eval(body,{'__builtins__':{}},dict(a=aa,b=b,q=qq,t=tt,u=uu,v=vv,w=ww,z=zz)) for body in bodies]
 ii=sum((c*p.fall(k+2,r)*p.fall(l-2,7-r) for r,c in enumerate(cs)),sp.poly(0))
 jj=J.subst([aa,k,l,qq,tt,uu]);hh=H.subst([aa,k,l,qq,tt,uu])
 gg=4*(N-5)*(N-6)*(k+2)*l*hh**2-3*(N-3)*(N-4)*(k+1)*(l-1)*jj*ii
 charts=[]
 for nn,kk,ll in [('large',k,l+9)]+[(str(r),k+max(7-r,0),r) for r in range(2,9)]:
  z=gg.subst([0,kk,ll,q,0,0]);charts.append(p.report(nn,z))
 out.append({'cone':name,'parameter':'q is distance from lower numerator boundary; upper cone constraint not imposed by chart','charts':charts})
 data={'status':'Exact symbolic candidates only; no Lean source adapters or universal inequalities proved','gap':'4(N-5)(N-6)(k+2)l H^2 -3(N-3)(N-4)(k+1)(l-1) J I','index':'i=a-1+k, N=k+l=b-2','completed':out,'seconds':time.monotonic()-start}
 Path('evidence/markov-5703599b/high-cone-probe.json').write_text(json.dumps(data,indent=2)+'\n')
 print(json.dumps(out[-1]),flush=True)
