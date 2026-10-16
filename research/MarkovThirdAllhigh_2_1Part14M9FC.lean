import MarkovThirdSep12I14M9FCFinal
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_high_2_1_mid2M9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (5+v+u) (16+2*v+3*u-1)*vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (5+v+u) (16+2*v+3*u) := by
 exact sSep12I14FinalM9FC x y u v hx hy hu hv
end
end MathGKM.Markov
