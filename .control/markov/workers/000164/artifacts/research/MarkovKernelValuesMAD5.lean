import MarkovKernelSupportMAD5
import MarkovPairRatiosMAD5
/-! Machine-authored ad504da6. No support endpoint is lost when the shifted
polynomial coefficients are written as scalar kernel values. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem shifted_kernel_valuesMAD5 (j t i : ℕ) (hi : 1 ≤ i) (hij : i ≤ j+1) :
 (ePolyM7E2 j t).coeff i=(leftTermMAD5 j t (j+1-i):ℝ) ∧
 (X*ePolyM7E2 j (t+1)).coeff i=(liftTermMAE9 j (t+1) (j+1-i):ℝ) ∧
 (X^2*ePolyM7E2 j (t+2)).coeff i=(liftTermMAE9 j (t+2) (j+1-i+1):ℝ) := by
 refine ⟨?_,?_,?_⟩
 · by_cases he : i=j+1
   · subst i
     rw [e_poly_tailM7E2 _ _ _ (by omega)]
     simp [leftTermMAD5]
   · rw [e_poly_coeffM7E2 _ _ _ (by omega),leftTermMAD5,if_neg (by omega)]
     congr 2
     omega
 · obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hi
   rw [show 1+k=k+1 by omega,coeff_X_mul,e_poly_coeffM7E2 _ _ _ (by omega)]
   congr 2
   omega
 · rw [coeff_X_pow_mul']
   by_cases h2 : 2 ≤ i
   · rw [if_pos h2,e_poly_coeffM7E2 _ _ _ (by omega)]
     congr 2
     omega
   · rw [if_neg h2,lift_term_tailM7E2 _ _ _ (by omega)]
     simp

end
end MathGKM.Markov
