import MarkovLiftBudgetM964
import MarkovThirdOutputM964
/-! Machine-authored 9647c1ba. General exact transport for a factored
correction polynomial. No universal source factorization is postulated. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def correctionKernelM964 (d s : ℕ) (Q : ℝ[X]) : ℝ[X] :=
 C (absorbedExtraM418 d s (Q.coeff 0))*X^s+
 ∑ k ∈ range (s+1), C (Q.coeff (s-k+1))*X^k

theorem weight_sumM964 (w : ℕ → ℝ) (I : Finset ℕ) (P : ℕ → ℝ[X]) :
 weightPolyMFEE w (∑ k ∈ I, P k)=∑ k ∈ I, weightPolyMFEE w (P k) := by
 ext k
 simp [weight_poly_coeffMFEE,finsetSum_coeff,mul_sum]

theorem correction_kernel_coeffM964 (d s k : ℕ) (Q : ℝ[X]) :
 (correctionKernelM964 d s Q).coeff k=
 (if k=s then absorbedExtraM418 d s (Q.coeff 0) else 0)+
 (if k ≤ s then Q.coeff (s-k+1) else 0) := by
 simp only [correctionKernelM964,coeff_add,coeff_C_mul,coeff_X_pow,finsetSum_coeff]
 simp only [mul_ite,mul_one,mul_zero]
 rw [sum_ite_eq']
 simp [mem_range,Nat.lt_succ_iff]

theorem correction_kernel_weightM964 (d s : ℕ) (Q : ℝ[X]) :
 (weightPolyMFEE (fun k => zchooseM37B d k) (correctionKernelM964 d s Q)).eval 1=
 ((X+1)^d*Q).coeff (s+1) := by
 rw [correctionKernelM964,weight_addM418,weight_sumM964,eval_add,eval_finset_sum,
   weight_monomialM418]
 simp only [eval_mul,eval_C,eval_pow,eval_X,one_pow,mul_one,zchoose_natM37B]
 rw [absorbed_chooseM418,coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
   sum_range_succ]
 simp only [coeff_X_add_one_pow,Nat.sub_self]
 have he : (∑ k ∈ range (s+1),
     (weightPolyMFEE (fun k => zchooseM37B d k) (C (Q.coeff (s-k+1))*X^k)).eval 1)=
   ∑ k ∈ range (s+1), (d.choose k:ℝ)*Q.coeff (s+1-k) := by
   apply sum_congr rfl
   intro k hk
   rw [weight_monomialM418]
   simp only [eval_mul,eval_C,eval_pow,eval_X,one_pow,mul_one,zchoose_natM37B]
   rw [show s-k+1=s+1-k by have hh:=mem_range.mp hk; omega]
 rw [he]
 ring

theorem correction_kernel_budgetM964 (d j s : ℕ) (Q : ℝ[X]) (c : ℝ)
 (hQ : ∀ k, 0 ≤ Q.coeff k) (hc : 0 ≤ c)
 (hcoeff : ∀ m, Q.coeff (m+1) ≤ c*(j.choose m:ℝ)) :
 LiftBudgetM964 j s (Q.coeff 0*d/(s+1)+c) (correctionKernelM964 d s Q) := by
 intro k
 rw [correction_kernel_coeffM964]
 have ha : 0 ≤ absorbedExtraM418 d s (Q.coeff 0) := by unfold absorbedExtraM418; exact div_nonneg (mul_nonneg (hQ 0) (by positivity)) (by positivity)
 have hb : absorbedExtraM418 d s (Q.coeff 0) ≤ Q.coeff 0*d/(s+1) := by
   unfold absorbedExtraM418
   apply div_le_div_of_nonneg_right _ (by positivity)
   exact mul_le_mul_of_nonneg_left (by exact_mod_cast Nat.sub_le d s) (hQ 0)
 have hu : 0 ≤ Q.coeff 0*d/(s+1) := by exact div_nonneg (mul_nonneg (hQ 0) (by positivity)) (by positivity)
 by_cases hk : k=s
 · subst k
   simp only [ite_true,Nat.sub_self,zero_add,Nat.choose_zero_right,Nat.cast_one,mul_one]
   have h1 := hcoeff 0
   simp only [zero_add,Nat.choose_zero_right,Nat.cast_one,mul_one] at h1
   exact ⟨add_nonneg ha (hQ 1),add_le_add hb h1⟩
 · rw [if_neg hk,zero_add]
   by_cases hks : k ≤ s
   · rw [if_pos hks]
     refine ⟨hQ _,?_⟩
     have h1 := hcoeff (s-k)
     have hp := mul_nonneg hu (show (0:ℝ) ≤ j.choose (s-k) by positivity)
     nlinarith only [h1,hp]
   · simp [hks]

theorem correction_kernel_nonnegM964 (d s k : ℕ) (Q : ℝ[X])
 (hQ : ∀ k, 0 ≤ Q.coeff k) : 0 ≤ (correctionKernelM964 d s Q).coeff k := by
 rw [correction_kernel_coeffM964]
 have ha : 0 ≤ absorbedExtraM418 d s (Q.coeff 0) := by
   unfold absorbedExtraM418
   exact div_nonneg (mul_nonneg (hQ 0) (by positivity)) (by positivity)
 split_ifs <;> nlinarith [hQ (s-k+1)]

theorem correction_row_weightM964 (d j s : ℕ) (Q : ℝ[X]) :
 (weightPolyMFEE (fun k => zchooseM37B d k)
   (liftPolyM7E2 j s+correctionKernelM964 d s Q)).eval 1=
 (liftOutputMAE9 d j s:ℝ)+(X^2*((X+1)^d*Q)).coeff (s+3) := by
 rw [weight_addM418,eval_add,weighted_lift_outputMFEE,correction_kernel_weightM964,
   coeff_X_pow_mul',if_pos (by omega),show s+3-2=s+1 by omega]

end
end MathGKM.Markov
