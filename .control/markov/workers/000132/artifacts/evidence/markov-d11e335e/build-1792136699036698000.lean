import MarkovStripGapMD11
/-! Machine-authored d11e335e. Adjacent slope-cone strip certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 16000
def stripMiddleIMD11 (a k l t : ℝ) : ℝ :=
 (k+1)*stripIMD11 a k l+96*t*(l-3)*(l-4)*(l-5)*(l-6)*(l-7)
def stripMiddleGapMD11 (a k l t : ℝ) : ℝ :=
 4*(k+l-5)*(k+l-6)*(l-1)*(k+1)*(stripHMB9D a k l)^2-
 3*(k+l-3)*(k+l-4)*(l-2)*stripJMB9D a k l*stripMiddleIMD11 a k l t

theorem stripMiddle_largeMD11 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapMD11 ((k+(l+7)+2+t)/4) k (l+7) t := by
 unfold stripMiddleGapMD11 stripMiddleIMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem stripMiddle_threeMD11 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapMD11 (((k+4)+3+2+t)/4) (k+4) 3 t := by
 unfold stripMiddleGapMD11 stripMiddleIMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem stripMiddle_fourMD11 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapMD11 (((k+3)+4+2+t)/4) (k+3) 4 t := by
 unfold stripMiddleGapMD11 stripMiddleIMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem stripMiddle_fiveMD11 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapMD11 (((k+2)+5+2+t)/4) (k+2) 5 t := by
 unfold stripMiddleGapMD11 stripMiddleIMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

theorem stripMiddle_sixMD11 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripMiddleGapMD11 (((k+1)+6+2+t)/4) (k+1) 6 t := by
 unfold stripMiddleGapMD11 stripMiddleIMD11 stripIMD11 stripJMB9D stripHMB9D
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity

end
end MathGKM.Markov
