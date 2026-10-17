import MarkovTemplateStrongMomentM41B
/-! Machine-authored 41b38611. Scalar certificate for a proposed deficit
moment route. Its actual-weight moment attachment is a separate obligation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
def deficitLowerM41B (i r H : ℝ) : ℝ := (i+1)*(r-1)*H-r*(2*r+i+1)
def deficitSecondM41B (i r : ℝ) : ℝ := i*(i+1)+6*r*(i+1)+6*r^2
def deficitScalarM41B (i r H : ℝ) : ℝ :=
 deficitLowerM41B i r H^2*(i+4)+
 (H-r+1)*deficitLowerM41B i r H*(i+1)*(i+3)*(i+4)-
 (H+r)^2*deficitSecondM41B i r*(i+1)*(i+3)
theorem deficit_scalar_shiftM41B (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < deficitScalarM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) := by
 have he : deficitScalarM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) = 4*x^6*y+4*x^6+6*x^5*y^2+4*x^5*y*z+714*x^5*y+4*x^5*z+666*x^5+4*x^4*y^3+5*x^4*y^2*z+842*x^4*y^2+1*x^4*y*z^2+587*x^4*y*z+52694*x^4*y+1*x^4*z^2+547*x^4*z+45353*x^4+1*x^3*y^4+2*x^3*y^3*z+402*x^3*y^3+1*x^3*y^2*z^2+553*x^3*y^2*z+46395*x^3*y^2+115*x^3*y*z^2+34193*x^3*y*z+2055764*x^3*y+107*x^3*z^2+29369*x^3*z+1607342*x^3+59*x^2*y^4+146*x^2*y^3*z+14326*x^2*y^3+81*x^2*y^2*z^2+22578*x^2*y^2*z+1248319*x^2*y^2+4926*x^2*y*z^2+987360*x^2*y*z+44651942*x^2*y+4220*x^2*z^2+769508*x^2*z+30976391*x^2+896*x*y^4+3412*x*y^3*z+206916*x*y^3+2172*x*y^2*z^2+402044*x*y^2*z+16272292*x*y^2+93112*x*y*z^2+14117772*x*y*z+511013148*x*y+72356*x*z^2+9751284*x*z+302789460*x+796*y^4+24976*y^3*z+928288*y^3+19264*y^2*z^2+2622256*y^2*z+81127624*y^2+654976*y*z^2+79850512*y*z+2401336512*y+451696*z^2+47074608*z+1135037196 := by
   unfold deficitScalarM41B deficitLowerM41B deficitSecondM41B
   ring
 rw [he]
 positivity
theorem deficit_lower_shiftM41B (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < deficitLowerM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) := by
 have he : deficitLowerM41B (x+27) (y+3) ((y+3)+2*(x+27)+9+z) = 2*x^2*y+4*x^2+1*x*y^2+1*x*y*z+123*x*y+2*x*z+241*x+26*y^2+28*y*z+1864*y+56*z+3594 := by
   unfold deficitLowerM41B
   ring
 rw [he]
 positivity
theorem deficit_scalar_positiveM41B (i r H : ℝ) (hi : 27 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < deficitScalarM41B i r H := by
 have h := deficit_scalar_shiftM41B (i-27) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
theorem deficit_lower_positiveM41B (i r H : ℝ) (hi : 27 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < deficitLowerM41B i r H := by
 have h := deficit_lower_shiftM41B (i-27) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
