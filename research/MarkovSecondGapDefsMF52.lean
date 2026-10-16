import Mathlib
/-! Machine-authored f52ba141. Raw smoothed-cubic gap; no source assumption. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768

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

end
end MathGKM.Markov
