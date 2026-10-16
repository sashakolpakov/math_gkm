import MarkovThirdSep4I9M9FCFinal
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_midhigh_0_4_mid1M9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u-1)*vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u) := by
 exact sSep4I9FinalM9FC x y u v hx hy hu hv
end
end MathGKM.Markov
