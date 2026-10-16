import MarkovStripGapMB9D
import MarkovHorizontalFourthSeedM511
/-! Machine-authored d11e335e. Low-cone next vertical strip algebra. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
def stripQuarticMD11 {R : Type*} [CommRing R] (a b : R) : R[X] :=
 C (h4c3M511 a b 0 0 0 0 0 0)+C (h4c4M511 a b 0 0 0 0 0 0)*X+
 C (h4c5M511 a b 0 0 0 0 0 0)*X^2+C (h4c6M511 a b 0 0 0 0 0 0)*X^3+
 C (h4c7M511 a b 0 0 0 0 0 0)*X^4
def stripIMD11 (a k l : ℝ) : ℝ :=
 h4c3M511 a (k+l+2) 0 0 0 0 0 0*(l-3)*(l-4)*(l-5)*(l-6)+
 h4c4M511 a (k+l+2) 0 0 0 0 0 0*k*(l-3)*(l-4)*(l-5)+
 h4c5M511 a (k+l+2) 0 0 0 0 0 0*k*(k-1)*(l-3)*(l-4)+
 h4c6M511 a (k+l+2) 0 0 0 0 0 0*k*(k-1)*(k-2)*(l-3)+
 h4c7M511 a (k+l+2) 0 0 0 0 0 0*k*(k-1)*(k-2)*(k-3)
def stripGapMD11 (a k l : ℝ) : ℝ :=
 4*(k+l-5)*(k+l-6)*(l-1)*(stripHMB9D a k l)^2-
 3*(k+l-3)*(k+l-4)*(l-2)*stripJMB9D a k l*stripIMD11 a k l

theorem strip_largeMD11 (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMD11 (a+1) k (l+7) := by
 unfold stripGapMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem strip_threeMD11 (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMD11 (a+1) (k+4) 3 := by
 unfold stripGapMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem strip_fourMD11 (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMD11 (a+1) (k+3) 4 := by
 unfold stripGapMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem strip_fiveMD11 (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMD11 (a+1) (k+2) 5 := by
 unfold stripGapMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem strip_sixMD11 (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMD11 (a+1) (k+1) 6 := by
 unfold stripGapMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

end
end MathGKM.Markov
