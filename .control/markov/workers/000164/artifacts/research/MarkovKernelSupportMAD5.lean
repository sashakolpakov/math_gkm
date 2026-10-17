import MarkovCenteredBridgeMAD5
import MarkovPairStepMAD5
/-! Machine-authored ad504da6. Exact interval support and endpoint-safe
kernel values for the centered pair route. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem lift_term_positiveMAD5 (j t m : ℕ) (hm : m ≤ j) : 0 < liftTermMAE9 j t m := by
 unfold liftTermMAE9
 have h1 : 0 < ((t+m+3).choose m:ℤ) := by exact_mod_cast Nat.choose_pos (by omega : m ≤ t+m+3)
 have h2 : 0 < ((t+j+3).choose (t+m+3):ℤ) := by exact_mod_cast Nat.choose_pos (by omega : t+m+3 ≤ t+j+3)
 apply mul_pos h1
 exact add_pos_of_pos_of_nonneg h2 (by positivity)

theorem e_coeff_positive_iffMAD5 (j t k : ℕ) :
 0 < (ePolyM7E2 j t).coeff k ↔ k ≤ j := by
 by_cases hk : k ≤ j
 · rw [e_poly_coeffM7E2 _ _ _ hk]
   have hh : 0 < (liftTermMAE9 j t (j-k):ℝ) := by exact_mod_cast lift_term_positiveMAD5 j t (j-k) (by omega)
   exact iff_of_true hh hk
 · rw [e_poly_tailM7E2 _ _ _ (by omega)]
   simp [hk]

theorem shifted_middle_supportMAD5 (j t k : ℕ) :
 0 < (X*ePolyM7E2 j (t+1)).coeff k ↔ 1 ≤ k ∧ k ≤ j+1 := by
 cases k with
 | zero => simp
 | succ k => rw [coeff_X_mul,e_coeff_positive_iffMAD5]; omega

theorem shifted_middle_nonnegMAD5 (j t k : ℕ) :
 0 ≤ (X*ePolyM7E2 j (t+1)).coeff k := by
 cases k with
 | zero => simp
 | succ k => rw [coeff_X_mul]; exact e_coeff_nonnegMFEE j (t+1) k

theorem shifted_right_nonnegMAD5 (j t k : ℕ) :
 0 ≤ (X^2*ePolyM7E2 j (t+2)).coeff k := by
 rw [coeff_X_pow_mul']
 split_ifs
 · exact e_coeff_nonnegMFEE j (t+2) _
 · exact le_rfl

def KernelPairStepMAD5 : Prop := ∀ j t i k, 1 ≤ i → k ≤ j+1 → i+2 ≤ k →
 pairGapMAD5 (ePolyM7E2 j t) (X*ePolyM7E2 j (t+1)) (X^2*ePolyM7E2 j (t+2)) (i,k)*
   pairDenMAD5 (X*ePolyM7E2 j (t+1)) (i+1,k-1) ≤
 pairGapMAD5 (ePolyM7E2 j t) (X*ePolyM7E2 j (t+1)) (X^2*ePolyM7E2 j (t+2)) (i+1,k-1)*
   pairDenMAD5 (X*ePolyM7E2 j (t+1)) (i,k)

theorem shifted_order_of_kernel_stepsMAD5 (hs : KernelPairStepMAD5) : ShiftedPairOrderMAD5 := by
 intro j t
 apply pair_order_of_stepsMAD5 _ _ _ 1 (j+1)
 · exact e_coeff_nonnegMFEE j t
 · exact shifted_middle_nonnegMAD5 j t
 · exact shifted_right_nonnegMAD5 j t
 · exact shifted_middle_supportMAD5 j t
 · exact hs j t

theorem lift_positive_of_kernel_stepsMAD5 (hs : KernelPairStepMAD5) : LiftLCPositiveM7E2 :=
 lift_positive_iff_middleMFEE.mpr (lift_middle_of_pair_orderMAD5 (shifted_order_of_kernel_stepsMAD5 hs))

end
end MathGKM.Markov
