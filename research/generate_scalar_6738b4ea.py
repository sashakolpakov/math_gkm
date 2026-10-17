"""Machine-authored scalar identity generator. Lean ring verifies the output."""
from pathlib import Path
from weak_margin_probe_6738b4ea import data,expr
L,P=data(16,8)
assert all(v>0 for v in P.values()) and all(v>0 for v in L.values())
s='''import MarkovWeakMarginM673
/-! Machine-authored 6738b4ea. Explicit positive scalar certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
def weakScalarM673 (i r H : ℝ) : ℝ :=
 (15*i+47)*deficitLowerM41B i r H^2*(i+4)+
 (H-r+1)*deficitLowerM41B i r H*(i+1)*(8*(i+4)+1)*(i+3)*(i+4)-
 (H+r)^2*deficitSecondM41B i r*(i+1)*(8*(i+4)+1)*(i+3)
theorem weak_scalar_shiftM673 (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < weakScalarM673 (x+16) (y+3) ((y+3)+2*(x+16)+9+z) := by
 have he : weakScalarM673 (x+16) (y+3) ((y+3)+2*(x+16)+9+z) = EXPR := by
   unfold weakScalarM673 deficitLowerM41B deficitSecondM41B
   ring
 rw [he]
 positivity
theorem weak_lower_shiftM673 (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < deficitLowerM41B (x+16) (y+3) ((y+3)+2*(x+16)+9+z) := by
 have he : deficitLowerM41B (x+16) (y+3) ((y+3)+2*(x+16)+9+z) = LOWER := by
   unfold deficitLowerM41B
   ring
 rw [he]
 positivity
theorem weak_scalar_positiveM673 (i r H : ℝ) (hi : 16 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < weakScalarM673 i r H := by
 have h := weak_scalar_shiftM673 (i-16) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
theorem weak_lower_positiveM673 (i r H : ℝ) (hi : 16 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < deficitLowerM41B i r H := by
 have h := weak_lower_shiftM673 (i-16) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring

theorem weak_controlM673 (i r H M E V F G : ℝ)
 (hi : 16 ≤ i) (hr : 3 ≤ r) (hH : r+2*i+9 ≤ H)
 (hM : 0 ≤ M)
 (hfirst : (i+3)*F ≤ (2*r+i+1)*M)
 (hsecond : (i+3)*(i+4)*G ≤ deficitSecondM41B i r*M)
 (hE : r*H*M-(H+r)*F ≤ E)
 (hV : V ≤ (H+r)^2*M*G) :
 0 ≤ (15*i+47)*E^2+(i+1)*(8*(i+4)+1)*(H-r+1)*M*E-(i+1)*(8*(i+4)+1)*V := by
 have hL := weak_lower_positiveM673 i r H hi hr hH
 have hS := weak_scalar_positiveM673 i r H hi hr hH
 have hE' : deficitLowerM41B i r H*M ≤ (i+3)*E := by
   have h0 := mul_le_mul_of_nonneg_left hfirst (by linarith : 0 ≤ H+r)
   have h1 := mul_le_mul_of_nonneg_left hE (by linarith : 0 ≤ i+3)
   unfold deficitLowerM41B
   nlinarith only [h0,h1]
 have hV' : (i+3)*(i+4)*V ≤ (H+r)^2*deficitSecondM41B i r*M^2 := by
   have h0 := mul_le_mul_of_nonneg_left hV (by positivity : 0 ≤ (i+3)*(i+4))
   have h1 := mul_le_mul_of_nonneg_left hsecond (by positivity : 0 ≤ (H+r)^2*M)
   nlinarith only [h0,h1]
 exact weak_control_algebraM673 (i+3) (i+4) (deficitLowerM41B i r H)
   (deficitSecondM41B i r) (H+r) ((i+1)*(8*(i+4)+1)) (H-r+1) (15*i+47) M E V
   (by linarith) (by linarith) hL.le (by positivity) (by linarith) (by linarith)
   hM hE' hV' hS.le
end
end MathGKM.Markov
'''.replace('EXPR',expr(P)).replace('LOWER',expr(L))
Path('research/MarkovWeakScalarM673.lean').write_text(s)
