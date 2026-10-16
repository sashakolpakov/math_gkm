"""Machine-authored exact certificate generator, ordinary Lean checks all identities."""
from symbolic_second_f52ba141 import *
R=Path('/Users/sasha/math_gkm')
O=R/'evidence/markov-f52ba141'
head='''import Mathlib
/-! Machine-authored f52ba141. Raw smoothed-cubic gap; no source assumption. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
'''
defs='''
def secondHMF52 (k l m t : ℝ) : ℝ :=
 4*t*l*(l-1)*(l-2)+(9*m^2+13*m+6)*k*l*(l-1)+
 (6*m^2+6*m*(k+l)+8*m+6*(k+l)+6)*k*(k-1)*l+
 (m+k+l+2)*(m+k+l+1)*k*(k-1)*(k-2)
def secondGapMF52 (k l m t : ℝ) : ℝ :=
 (k+1)*(l+1)*secondHMF52 k l m t^2-
 k*l*secondHMF52 (k-1) (l+1) m t*secondHMF52 (k+1) (l-1) m t
def secondMixedMF52 (k l m : ℝ) : ℝ :=
 (k+1)*(l+1)*2*secondHMF52 k l m 0*secondHMF52 k l m (2*m)-
 k*l*(secondHMF52 (k-1) (l+1) m 0*secondHMF52 (k+1) (l-1) m (2*m)+
 secondHMF52 (k-1) (l+1) m (2*m)*secondHMF52 (k+1) (l-1) m 0)
theorem second_bernsteinMF52 (k l m t : ℝ) :
 (2*m)^2*secondGapMF52 k l m t=
 (2*m-t)^2*secondGapMF52 k l m 0+
 t*(2*m-t)*secondMixedMF52 k l m+t^2*secondGapMF52 k l m (2*m) := by
 unfold secondGapMF52 secondMixedMF52 secondHMF52
 ring
'''
(R/'research/MarkovSecondGapDefsMF52.lean').write_text(head+defs+'\nend\nend MathGKM.Markov\n')
mods=[];stats=[]
for kn,kk,ke in [('One',1,'1'),('Two',2,'2'),('Large',k+3,'(x+3)')]:
 for ln,ll,le in [('One',1,'1'),('Two',2,'2'),('Large',l+3,'(y+3)')]:
  if kn==ln=='One':continue
  name=f'MarkovSecondGap{kn}{ln}MF52';mods.append(name)
  src=head.replace('import Mathlib','import MarkovSecondGapDefsMF52')
  for gn,g,ge in [('zero',G0,f'secondGapMF52 {ke} {le} (z+1) 0'),('end',G2,f'secondGapMF52 {ke} {le} (z+1) (2*(z+1))'),('mixed',GM,f'secondMixedMF52 {ke} {le} (z+1)')]:
   p=g.subst([kk,ll,m+1,0]);assert all(c>0 for c in p.values()),(kn,ln,gn)
   stats.append([name,gn,len(p)])
   src+=f'''\ntheorem second_{kn.lower()}_{ln.lower()}_{gn}MF52 (x y z : ℝ)
 (hx : 0≤x) (hy : 0≤y) (hz : 0≤z) : 0≤{ge} := by
 unfold secondGapMF52 secondMixedMF52 secondHMF52
 ring_nf
 positivity
'''.replace('unfold secondGapMF52 secondMixedMF52 secondHMF52','simp only [secondGapMF52,secondMixedMF52,secondHMF52]')
  src+='\nend\nend MathGKM.Markov\n';(R/f'research/{name}.lean').write_text(src.replace('≤',' ≤ '))
(O/'second-generated.json').write_text(json.dumps({'modules':mods,'positive_terms':stats},indent=2)+'\n')
old=(R/'research/validate_10d15751.py').read_text().replace('10d15751','f52ba141').replace('M10D','MF52')
(R/'research/validate_f52ba141.py').write_text(old)
(R/'research/ReplayIsolatedMF52.lean').write_text((R/'research/ReplayIsolatedM10D.lean').read_text().replace('M10D','MF52'))
print(json.dumps({'modules':mods,'certificate_count':len(stats)}))
