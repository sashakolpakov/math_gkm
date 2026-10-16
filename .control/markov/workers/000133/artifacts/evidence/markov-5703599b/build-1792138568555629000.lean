import MarkovNextDefsM570
/-! Machine-authored 5703599b. Next-cone split certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
theorem next_small3M570 (a k t : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripNextGapM570 (a+1) (k+4) 3 t := by
 unfold stripNextGapM570 stripNextIM570 stripHMCE8 stripHMB9D stripJMB9D stripIMD11
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity
theorem next_small4M570 (a k t : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripNextGapM570 (a+1) (k+3) 4 t := by
 unfold stripNextGapM570 stripNextIM570 stripHMCE8 stripHMB9D stripJMB9D stripIMD11
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity
theorem next_small5M570 (a k t : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripNextGapM570 (a+1) (k+2) 5 t := by
 unfold stripNextGapM570 stripNextIM570 stripHMCE8 stripHMB9D stripJMB9D stripIMD11
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity
theorem next_small6M570 (a k t : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripNextGapM570 (a+1) (k+1) 6 t := by
 unfold stripNextGapM570 stripNextIM570 stripHMCE8 stripHMB9D stripJMB9D stripIMD11
 unfold h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511
 ring_nf
 positivity
end
end MathGKM.Markov
