import Mathlib
/-! Machine-authored 263d8c71. Terminal-A raw compensation certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768

def terminalHM263 (k l m t r : ℝ) : ℝ :=
 4*t*l*(l-1)*(l-2)+(9*m^2+7*m+2-4*r)*k*l*(l-1)+
 (6*m^2+6*m*(k+l)+4*(k+l))*k*(k-1)*l+
 (m+k+l)*(m+k+l+1)*k*(k-1)*(k-2)
def terminalGapM263 (k l m t r : ℝ) : ℝ :=
 (k+1)*(l+1)*terminalHM263 k l m t r^2-
 k*l*terminalHM263 (k-1) (l+1) m t r*terminalHM263 (k+1) (l-1) m t r
def terminalMixedM263 (k l m r : ℝ) : ℝ :=
 (k+1)*(l+1)*2*terminalHM263 k l m 0 r*terminalHM263 k l m (2*m-r) r-
 k*l*(terminalHM263 (k-1) (l+1) m 0 r*terminalHM263 (k+1) (l-1) m (2*m-r) r+
 terminalHM263 (k-1) (l+1) m (2*m-r) r*terminalHM263 (k+1) (l-1) m 0 r)
theorem terminal_bernsteinM263 (k l m t r : ℝ) :
 (2*m-r)^2*terminalGapM263 k l m t r=
 (2*m-r-t)^2*terminalGapM263 k l m 0 r+
 t*(2*m-r-t)*terminalMixedM263 k l m r+t^2*terminalGapM263 k l m (2*m-r) r := by
 unfold terminalGapM263 terminalMixedM263 terminalHM263
 ring

end
end MathGKM.Markov
