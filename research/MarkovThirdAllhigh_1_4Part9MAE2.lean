import MarkovThirdSep11I9MAE2Final
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_high_1_4_mid1MAE2 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u-1)*vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u+1) ≤ vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u) := by
 exact sSep11I9FinalMAE2 x y u v hx hy hu hv
end
end MathGKM.Markov
