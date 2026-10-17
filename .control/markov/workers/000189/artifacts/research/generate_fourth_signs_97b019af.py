"""Machine-authored exact positive shifted scalar certificates, Lean checked separately."""
from pathlib import Path
from fractions import Fraction as F
from math import lcm
import json
from weighted_beta_symbolic_ca9709f2 import P,var,expr
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-97b019af'
raw=json.loads((R/'evidence/markov-20825094/stein-bound-symbolic.json').read_text())
ps={n:P({tuple(k):F(v) for k,v in vs}) for n,vs in raw.items()}
a,m,H,w=[var(j) for j in range(4)]
delta=(8*a+14)*m*m*F(1,2)-ps['E']
src='''import MarkovTopFourthMomentConditionalM731
/-! Machine-authored 97b019af. Exact signs needed by the fourth-moment attachment. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
'''
out={}
for name,p,unfold in [('delta',delta,'fourthDeltaM731 steinEM208'),('cp',ps['Cp'],'steinCpM208')]:
 target='fourthDeltaM731' if name=='delta' else 'steinCpM208'
 shifted=p.ev([a+3,m+2,3*(a+3)+(m+2)*F(1,2)+4+H,w])
 assert all(v>0 for v in shifted.d.values())
 scale=lcm(*(v.denominator for v in shifted.d.values()))
 e=expr(scale*shifted,['x','y','z','w'])
 src+=f'''theorem fourth_{name}_shift_positiveM97B (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < {target} (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : {scale}*{target} (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 {e} := by unfold {unfold}; ring
 have hp : (0:ℝ)<{e} := by positivity
 linarith only [he,hp]

theorem fourth_{name}_positiveM97B (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H) :
 0 < {target} a m H := by
 have h := fourth_{name}_shift_positiveM97B (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring

'''
 out[name]=dict(terms=len(shifted.d),scale=scale,positive_coefficients=True)
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovTopFourthSignsM97B.lean').write_text(src)
(O/'fourth-sign-certificates.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out))
