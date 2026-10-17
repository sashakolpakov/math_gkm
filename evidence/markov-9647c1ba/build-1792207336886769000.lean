import MarkovTwinKernelM964
/-! Machine-authored 9647c1ba. A general perturbation budget for arbitrary
polynomials, not just one or two slots. Its source application stays explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def LiftBudgetM964 (j s : ℕ) (U : ℝ) (R : ℝ[X]) : Prop :=
 ∀ k, 0 ≤ R.coeff k ∧ R.coeff k ≤ if k ≤ s then U*(j.choose (s-k):ℝ) else 0

theorem budget_scaledM964 (j s : ℕ) (B U : ℝ) (R : ℝ[X])
 (hB : 0 ≤ B) (hU : 0 ≤ U) (hbase : B ≤ ((s+j+3).choose j:ℝ))
 (hR : LiftBudgetM964 j s U R) (k : ℕ) :
 B*(liftPolyM7E2 j s+R).coeff k ≤ (B+U)*(liftPolyM7E2 j s).coeff k := by
 rw [coeff_add]
 have hn := lift_nonnegM964 j s k
 have hr := (hR k).2
 by_cases hk : k ≤ s
 · rw [if_pos hk] at hr
   have hl : B*(j.choose (s-k):ℝ) ≤ (liftPolyM7E2 j s).coeff k := by
     rw [lift_poly_coeffM7E2,reverseLiftMAE9,if_pos hk]
     exact (mul_le_mul_of_nonneg_right hbase (by positivity)).trans (lift_binomial_lowerM964 j s (s-k))
   have h0 := mul_le_mul_of_nonneg_left hr hB
   have h1 := mul_le_mul_of_nonneg_left hl hU
   nlinarith only [h0,h1]
 · rw [if_neg hk] at hr
   have hz : R.coeff k=0 := le_antisymm hr (hR k).1
   rw [hz,add_zero]
   have h0 := mul_nonneg hU hn
   nlinarith only [h0]

theorem budget_all_cutsM964 (j s : ℕ) (B U : ℝ) (R0 R1 R2 : ℝ[X])
 (hs : s ≤ j) (hB : 0 < B) (hU : 0 ≤ U)
 (hbase : B ≤ ((s+j+3).choose j:ℝ))
 (hR0 : LiftBudgetM964 j s U R0) (hR1 : ∀ k, 0 ≤ R1.coeff k)
 (hR2 : LiftBudgetM964 j (s+2) U R2)
 (hmargin : (B+U)^2*kernelScaleMA64 j s ≤
   B^2*kernelScaleMA64 j s+(B+U)^2*topGapMA64 j s)
 (h k : ℕ) :
 0 ≤ ((cutPolyMFEE h (liftPolyM7E2 j (s+1)+R1))^2-
   cutPolyMFEE h (liftPolyM7E2 j s+R0)*cutPolyMFEE h (liftPolyM7E2 j (s+2)+R2)).coeff k := by
 have hM : 0 < kernelScaleMA64 j s := by
   unfold kernelScaleMA64; rw [complete_coeffMA64]
   have hp : (0:ℝ) < liftTermMAE9 j (s+1) 0 := by
     exact_mod_cast lift_term_positiveMAD5 j (s+1) 0 (by omega)
   positivity
 apply robust_cutM964 (liftPolyM7E2 j s) (liftPolyM7E2 j (s+1)) (liftPolyM7E2 j (s+2))
   _ _ _ (kernelScaleMA64 j s) (topGapMA64 j s) B (B+U) hM hB (by linarith)
 · intro k; rw [coeff_add]; exact add_nonneg (lift_nonnegM964 j s k) (hR0 k).1
 · exact lift_nonnegM964 j (s+1)
 · exact lift_nonnegM964 j (s+2)
 · exact budget_scaledM964 j s B U R0 hB.le hU hbase hR0
 · intro k; rw [coeff_add]; linarith [hR1 k]
 · apply budget_scaledM964 j (s+2) B U R2 hB.le hU _ hR2
   exact hbase.trans (by exact_mod_cast Nat.choose_le_choose j (show s+j+3 ≤ s+2+j+3 by omega))
 · exact hmargin
 · intro h k
   simpa only [cut_lift_identityMFEE,liftCutGapM7E2] using lift_cut_marginMA64 j s h k hs

theorem budget_weighted_lcM964 (j s : ℕ) (B U : ℝ) (R0 R1 R2 : ℝ[X])
 (hs : s ≤ j) (hB : 0 < B) (hU : 0 ≤ U)
 (hbase : B ≤ ((s+j+3).choose j:ℝ))
 (hR0 : LiftBudgetM964 j s U R0) (hR1 : ∀ k, 0 ≤ R1.coeff k)
 (hR2 : LiftBudgetM964 j (s+2) U R2)
 (hmargin : (B+U)^2*kernelScaleMA64 j s ≤
   B^2*kernelScaleMA64 j s+(B+U)^2*topGapMA64 j s)
 (f : ℤ → ℝ) (hf : CrossLC f) (hp : ∀ k, 0 ≤ f k) :
 (weightPolyMFEE (fun k => f k) (liftPolyM7E2 j s+R0)).eval 1*
 (weightPolyMFEE (fun k => f k) (liftPolyM7E2 j (s+2)+R2)).eval 1 ≤
 (weightPolyMFEE (fun k => f k) (liftPolyM7E2 j (s+1)+R1)).eval 1^2 :=
 weighted_value_lcMFEE _ _ _
   (budget_all_cutsM964 j s B U R0 R1 R2 hs hB hU hbase hR0 hR1 hR2 hmargin) f hf hp

end
end MathGKM.Markov
