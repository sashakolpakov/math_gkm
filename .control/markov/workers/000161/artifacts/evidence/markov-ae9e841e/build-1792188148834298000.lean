import MarkovHorizontalFourAllM9E1
import MarkovColumnPolynomialMAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
theorem three_small_horizontalMAE9 (q i j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hj : j ≤ 4) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 have h := horizontal_first_fiveM9E1 (threePathM9E2 n r) i j hj
 rw [three_path_polynomialM9E2] at h
 simpa only [three_raw_formulaM9E2] using h
end
end MathGKM.Markov
