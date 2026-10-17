"""Machine-authored exact scalar sixth-moment certificate and positive expansions."""
from pathlib import Path
from fractions import Fraction as F
from math import lcm
from weighted_beta_symbolic_ca9709f2 import P,var,expr,div_exact
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-97b019af'
raw=json.loads((O/'sixth-probe.json').read_text())
ps={n:P({tuple(k):F(v) for k,v in vs}) for n,vs in raw['polynomials'].items()}
a,m,H,w=[var(j) for j in range(4)]
red=div_exact(ps['certificate'],a*m*(m-1))
def ex(p,vs):
 scale=lcm(*(v.denominator for v in p.d.values()))
 s=expr(p*scale,vs)
 return s if scale==1 else '('+s+')/'+str(scale)
src='''import MarkovTopSixthBetaM97B
/-! Machine-authored 97b019af. Exact two-generator scalar certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 18000000
set_option maxRecDepth 20000
def sixthLM97B (a m H k : ℝ) : ℝ :=
 -steinBM208 a m H k*((k+1-m/2)^4-(k-m/2)^4)-
 steinDM208 a m H k*((k-1-m/2)^4-(k-m/2)^4)
'''
for n in ['delta','A','C','J','K']:
 src+=f'def sixth{n}M97B (a m H : ℝ) : ℝ :=\n'+ex(ps[n],['a','m','H','w'])+'\n'
src+='def sixthReducedM97B (a m H : ℝ) : ℝ :=\n'+ex(red,['a','m','H','w'])+'\n'
src+='''theorem sixth_point_certificateM97B (a m H k : ℝ) :
 sixthdeltaM97B a m H*steinScalarM208 a H k (m-k)+
 sixthAM97B a m H*steinLM208 a m H k+sixthCM97B a m H*sixthLM97B a m H k=
 sixthJM97B a m H+sixthKM97B a m H*(k-m/2)^6 := by
 unfold sixthdeltaM97B sixthAM97B sixthCM97B sixthJM97B sixthKM97B sixthLM97B
   steinScalarM208 steinLM208 steinBM208 steinDM208
 ring

theorem sixth_certificate_factorM97B (a m H : ℝ) :
 sixthMomentDenM97B a*sixthJM97B a m H+sixthKM97B a m H*sixthMomentNumM97B a m=
 a*m*(m-1)*sixthReducedM97B a m H := by
 unfold sixthMomentDenM97B sixthMomentNumM97B sixthJM97B sixthKM97B sixthReducedM97B
 ring
end
end MathGKM.Markov
'''
(R/'research/MarkovTopSixthCertificateM97B.lean').write_text(src)
# Separate each sign to keep verification bounded and expose dependencies.
for name,p,target,unfold in [('Delta',ps['delta'],'sixthdeltaM97B','sixthdeltaM97B'),('A',ps['A'],'sixthAM97B','sixthAM97B'),('C',ps['C'],'sixthCM97B','sixthCM97B'),('K',-ps['K'],'(fun a m H => -sixthKM97B a m H)','sixthKM97B'),('Reduced',red,'sixthReducedM97B','sixthReducedM97B')]:
 offset=7 if name=='Reduced' else 3
 shifted=p.ev([a+offset,m+2,3*(a+offset)+(m+2)*F(1,2)+4+H,w])
 assert all(v>0 for v in shifted.d.values())
 scale=lcm(*(v.denominator for v in shifted.d.values()));e=expr(scale*shifted,['x','y','z','w'])
 s=f'''import MarkovTopSixthCertificateM97B
/-! Machine-authored 97b019af. Ring-checked positive scalar expansion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
theorem sixth_{name.lower()}_shiftM97B (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < {target} (x+{offset}) (y+2) (3*(x+{offset})+(y+2)/2+4+z) := by
 have he : {scale}*{target} (x+{offset}) (y+2) (3*(x+{offset})+(y+2)/2+4+z)=
 {e} := by try dsimp only
   unfold {unfold}; ring
 have hp : (0:ℝ)<{e} := by positivity
 linarith only [he,hp]

theorem sixth_{name.lower()}_positiveM97B (a m H : ℝ)
 (ha : {offset} ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H) :
 0 < {target} a m H := by
 have h := sixth_{name.lower()}_shiftM97B (a-{offset}) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
'''
 (R/f'research/MarkovTopSixth{name}SignM97B.lean').write_text(s)
print('Generated scalar identity and five independently checkable signs.')
