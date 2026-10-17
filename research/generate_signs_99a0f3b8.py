"""Machine-authored certificates: generation is not validation."""
from pathlib import Path
from fractions import Fraction as F
from math import lcm
from weighted_beta_symbolic_ca9709f2 import P,var,div_exact
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-99a0f3b8'
raw=json.loads((R/'evidence/markov-97b019af/sixth-probe.json').read_text())
ps={n:P({tuple(k):F(v) for k,v in vs}) for n,vs in raw['polynomials'].items()}
a,m,H,w=[var(j) for j in range(4)];red=div_exact(ps['certificate'],a*m*(m-1))
def horner(p,vs):
 if not vs:return str(next(iter(p.values())))
 kmax=max(k[0] for k in p);parts={}
 for k,v in p.items():parts.setdefault(k[0],{})[k[1:]]=v
 cur=horner(parts[kmax],vs[1:])
 for k in range(kmax-1,-1,-1):
  cur=f'({cur})*{vs[0]}'
  if k in parts:cur+=f'+({horner(parts[k],vs[1:])})'
 return cur
mods=[]
for tag,slope,h,domain,arg,slack in [('Wide',F(9,4),8,'9*a+2*m+32 ≤ 4*H','9*(x+7)/4+(y+2)/2+8+z','H-9*a/4-m/2-8'),('First',F(3),1,'6*a+m+2 ≤ 2*H','3*(x+7)+(y+2)/2+1+z','H-3*a-m/2-1')]:
 for name,p,target,unfold in [('Delta',ps['delta'],'sixthdeltaM97B','sixthdeltaM97B'),('A',ps['A'],'sixthAM97B','sixthAM97B'),('C',ps['C'],'sixthCM97B','sixthCM97B'),('K',-ps['K'],'(fun a m H => -sixthKM97B a m H)','sixthKM97B'),('Reduced',red,'sixthReducedM97B','sixthReducedM97B')]:
  shifted=p.ev([a+7,m+2,slope*(a+7)+(m+2)*F(1,2)+h+H,w]);assert all(v>0 for v in shifted.d.values())
  scale=lcm(*(v.denominator for v in shifted.d.values()))
  e=horner({k[:3]:int(v*scale) for k,v in shifted.d.items()},['x','y','z'])
  stem=f'MarkovMiddle{tag}{name}M99A';mods.append(stem)
  src=f'''import MarkovTopSixthCertificateM97B
/-! Machine-authored 99a0f3b8. Wider domain; exact ring certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 24000000
set_option maxRecDepth 40000
theorem middle_{tag.lower()}_{name.lower()}_shiftM99A (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < {target} (x+7) (y+2) ({arg}) := by
 have he : {scale}*{target} (x+7) (y+2) ({arg})={e} := by
   try dsimp only
   unfold {unfold}
   ring
 have hp : (0:ℝ)<{e} := by positivity
 linarith only [he,hp]
attribute [local irreducible] {unfold}
theorem middle_{tag.lower()}_{name.lower()}_positiveM99A (a m H : ℝ)
 (ha : 7 ≤ a) (hm : 2 ≤ m) (hH : {domain}) :
 0 < {target} a m H := by
 have h := middle_{tag.lower()}_{name.lower()}_shiftM99A (a-7) (m-2) ({slack})
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
'''
  (R/'research'/f'{stem}.lean').write_text(src)
(O/'sign-modules.json').write_text(json.dumps(mods));print(json.dumps(mods))
