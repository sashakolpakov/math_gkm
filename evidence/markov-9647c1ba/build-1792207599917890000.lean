import MarkovCorrectionBudgetM964
/-! Machine-authored 9647c1ba. A general factored-row criterion. Its source
identity, coefficient budget and scalar margin are explicit hypotheses. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem budget_monoM964 (j s : ℕ) (u v : ℝ) (R : ℝ[X])
 (h : LiftBudgetM964 j s u R) (huv : u ≤ v) : LiftBudgetM964 j s v R := by
 intro k
 refine ⟨(h k).1,(h k).2.trans ?_⟩
 split_ifs
 · exact mul_le_mul_of_nonneg_right huv (by positivity)
 · exact le_rfl

def factoredValueM964 (d j s : ℕ) (Q : ℝ[X]) : ℝ :=
 (liftOutputMAE9 d j s:ℝ)+(X^2*((X+1)^d*Q)).coeff (s+3)

theorem factored_value_lcM964 (d j s : ℕ) (Q : ℝ[X]) (c : ℝ)
 (hs : s ≤ j) (hc : 0 ≤ c) (hQ : ∀ k, 0 ≤ Q.coeff k)
 (hcoeff : ∀ m, Q.coeff (m+1) ≤ c*(j.choose m:ℝ))
 (hmargin : let B : ℝ := (s+j+3).choose j
   let U := Q.coeff 0*d/(s+1)+c
   (B+U)^2*kernelScaleMA64 j s ≤ B^2*kernelScaleMA64 j s+(B+U)^2*topGapMA64 j s) :
 factoredValueM964 d j s Q*factoredValueM964 d j (s+2) Q ≤
 factoredValueM964 d j (s+1) Q^2 := by
 let B : ℝ := (s+j+3).choose j
 let U := Q.coeff 0*d/(s+1)+c
 have hB : 0 < B := by
   dsimp [B]; exact_mod_cast Nat.choose_pos (show j ≤ s+j+3 by omega)
 have hU : 0 ≤ U := add_nonneg (div_nonneg (mul_nonneg (hQ 0) (by positivity)) (by positivity)) hc
 have hR2 : LiftBudgetM964 j (s+2) U (correctionKernelM964 d (s+2) Q) := by
   apply budget_monoM964 _ _ _ _ _ (correction_kernel_budgetM964 d j (s+2) Q c hQ hc hcoeff)
   dsimp [U]
   apply add_le_add _ le_rfl
   apply div_le_div_of_nonneg_left (mul_nonneg (hQ 0) (by positivity)) (by positivity)
   push_cast; linarith
 have hf : CrossLC (zchooseM37B d) := by
   have he : zchooseM37B d=CoeffSeq ((1+X)^d) := by ext k; exact zchoose_coeffM37B d k
   rw [he]; exact crossLC_binomial d
 have hp (k : ℤ) : 0 ≤ zchooseM37B d k := by unfold zchooseM37B; split_ifs <;> positivity
 have h := budget_weighted_lcM964 j s B U
   (correctionKernelM964 d s Q) (correctionKernelM964 d (s+1) Q) (correctionKernelM964 d (s+2) Q)
   hs hB hU le_rfl (correction_kernel_budgetM964 d j s Q c hQ hc hcoeff)
   (fun k => correction_kernel_nonnegM964 d (s+1) k Q hQ) hR2 hmargin (zchooseM37B d) hf hp
 simpa only [correction_row_weightM964,factoredValueM964] using h

theorem source_factored_row_lcM964 (P : BiPoly) (row d j s : ℕ) (Q : ℝ[X]) (c : ℝ)
 (hsource : ∀ n, (coeff P (n+3) row:ℝ)=factoredValueM964 d j n Q)
 (hs : s ≤ j) (hc : 0 ≤ c) (hQ : ∀ k, 0 ≤ Q.coeff k)
 (hcoeff : ∀ m, Q.coeff (m+1) ≤ c*(j.choose m:ℝ))
 (hmargin : let B : ℝ := (s+j+3).choose j
   let U := Q.coeff 0*d/(s+1)+c
   (B+U)^2*kernelScaleMA64 j s ≤ B^2*kernelScaleMA64 j s+(B+U)^2*topGapMA64 j s) :
 coeff P (s+3) row*coeff P (s+5) row ≤ coeff P (s+4) row^2 := by
 have h := factored_value_lcM964 d j s Q c hs hc hQ hcoeff hmargin
 rw [←hsource,←hsource,←hsource] at h
 norm_num only [show s+2+3=s+5 by omega,show s+1+3=s+4 by omega] at h
 exact_mod_cast h

end
end MathGKM.Markov
