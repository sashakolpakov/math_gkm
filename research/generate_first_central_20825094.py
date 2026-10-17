"""Machine-authored exact first-central endpoint margin certificate."""
from weighted_beta_symbolic_ca9709f2 import P,expr
from fractions import Fraction as F
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-20825094'
raw=json.loads((O/'first-central-symbolic.json').read_text())
ps={n:P({tuple(k):F(v) for k,v in v}) for n,v in raw.items()}
s='''import MarkovTopWeightedBetaMeanMCA9
/-! Machine-authored 20825094. Positive endpoint margin at m=r.
The comparison-mass and endpoint-sum attachment are separate statements. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 14000000
set_option maxRecDepth 20000
def firstCentralDenM208 (a : ℤ) : ℤ :=
 (2*a)*(2*a+1)*(2*a+2)*(2*a+3)*(2*a+4)*(2*a+5)
def firstCentralMeanM208 (a r H : ℤ) : ℤ :=
 2*a^2*(a+1)*r*(r-1)*betaWeightedPolynomialMCA9 a r r H
def firstCentralMarginM208 (a r H : ℤ) : ℤ :=
 2*firstCentralMeanM208 a r H*(r+1)+
 r*betaScalarMCA9 a H 0 r*firstCentralDenM208 a
def firstCentralReducedM208 (a r H : ℤ) : ℤ :=
'''+expr(ps['reduced'],['a','r','H','z'])+'''
theorem first_central_margin_identityM208 (a r H : ℤ) :
 firstCentralMarginM208 a r H=a^2*(a+1)*r*(r-1)*firstCentralReducedM208 a r H := by
 unfold firstCentralMarginM208 firstCentralMeanM208 firstCentralDenM208
   betaWeightedPolynomialMCA9 betaScalarMCA9 firstCentralReducedM208
 ring
theorem first_central_reduced_shift_positiveM208 (x y z : ℤ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < firstCentralReducedM208 (x+2) (y+5) (3*(x+2)+(y+5)+4+z) := by
 have he : firstCentralReducedM208 (x+2) (y+5) (3*(x+2)+(y+5)+4+z)=
'''+expr(ps['shifted'],['x','y','unused','z'])+''' := by unfold firstCentralReducedM208; ring
 rw [he]
 positivity
theorem first_central_margin_positiveM208 (a r H : ℤ)
 (ha : 2 ≤ a) (hr : 5 ≤ r) (hH : 3*a+r+4 ≤ H) :
 0 < firstCentralMarginM208 a r H := by
 have hh := first_central_reduced_shift_positiveM208 (a-2) (r-5) (H-3*a-r-4)
  (by omega) (by omega) (by omega)
 have hred : 0 < firstCentralReducedM208 a r H := by
  convert hh using 1 <;> ring
 rw [first_central_margin_identityM208]
 have : 0 < r-1 := by omega
 positivity
end
end MathGKM.Markov
'''
(R/'research/MarkovTopFirstCentralMarginM208.lean').write_text(s)
print(len(s))
