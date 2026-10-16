import MarkovThirdSep7I9MAE2Final
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_midlow_2_1_mid1MAE2 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (4+v+u) (9+v+2*u-1)*vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (4+v+u) (9+v+2*u+1) ≤ vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (4+v+u) (9+v+2*u) := by
 exact sSep7I9FinalMAE2 x y u v hx hy hu hv
end
end MathGKM.Markov
