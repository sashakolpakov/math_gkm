import MarkovCutValuesMFEE
import MarkovCutShiftMFEE
/-! Machine-authored fee405c8. The full h=t truncation band, and the exact
remaining open auxiliary domain. This does not prove all truncations. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem lift_one_valuesMFEE (t : ℕ) :
 liftTermMAE9 1 t 0=(t:ℤ)+8 ∧ liftTermMAE9 1 t 1=(t:ℤ)+4 := by
 constructor
 · simp only [liftTermMAE9,Nat.choose_zero_right,Nat.cast_one,one_mul,
     show t+1+3=(t+3)+1 by omega,show t+1+4=t+0+5 by omega,
     Nat.choose_self,Nat.choose_succ_self_right,Nat.add_zero]
   push_cast
   ring
 · simp only [liftTermMAE9,Nat.choose_one_right,Nat.choose_self,Nat.cast_one,
     Nat.choose_eq_zero_of_lt (by omega : t+1+4<t+1+5),Nat.cast_zero,mul_zero,add_zero,mul_one]
   push_cast
   ring

theorem cut_kernel_allMFEE (j t : ℕ) :
 liftTermMAE9 j t 0*liftTermMAE9 j (t+2) 2 ≤ liftTermMAE9 j (t+1) 1^2 ∧
 liftTermMAE9 j t 0*liftTermMAE9 j (t+2) 1 ≤
   2*liftTermMAE9 j (t+1) 1*liftTermMAE9 j (t+1) 0 := by
 by_cases hj : 2 ≤ j
 · exact ⟨cut_kernel_zeroMFEE j t hj,cut_kernel_oneMFEE j t hj⟩
 interval_cases j
 · rw [lift_term_tailM7E2 0 (t+2) 2 (by omega),lift_term_tailM7E2 0 (t+2) 1 (by omega),
     lift_term_tailM7E2 0 (t+1) 1 (by omega)]
   norm_num
 · rw [lift_term_tailM7E2 1 (t+2) 2 (by omega),mul_zero]
   refine ⟨sq_nonneg _,?_⟩
   rw [(lift_one_valuesMFEE t).1,(lift_one_valuesMFEE (t+2)).2,
     (lift_one_valuesMFEE (t+1)).1,(lift_one_valuesMFEE (t+1)).2]
   push_cast
   nlinarith [sq_nonneg (t:ℤ)]

theorem lift_cut_boundary_nonnegMFEE (j t k : ℕ) :
 0 ≤ (liftCutGapM7E2 j t t).coeff k := by
 have h0 : 0 ≤ (liftTermMAE9 j (t+1) 1:ℝ)^2-
   (liftTermMAE9 j t 0:ℝ)*(liftTermMAE9 j (t+2) 2:ℝ) := by
   exact_mod_cast sub_nonneg.mpr (cut_kernel_allMFEE j t).1
 have h1 : 0 ≤ 2*(liftTermMAE9 j (t+1) 1:ℝ)*(liftTermMAE9 j (t+1) 0:ℝ)-
   (liftTermMAE9 j t 0:ℝ)*(liftTermMAE9 j (t+2) 1:ℝ) := by
   exact_mod_cast sub_nonneg.mpr (cut_kernel_allMFEE j t).2
 have h2 : 0 ≤ (liftTermMAE9 j (t+1) 0:ℝ)^2-
   (liftTermMAE9 j t 0:ℝ)*(liftTermMAE9 j (t+2) 0:ℝ) := by
   exact_mod_cast sub_nonneg.mpr (lift_zero_column_lcMFEE j t)
 rw [lift_cut_boundary_identityMFEE,coeff_X_pow_mul']
 split_ifs
 · simp only [coeff_add,coeff_C,coeff_C_mul,coeff_X,coeff_X_pow]
   split_ifs <;> simp_all <;> positivity
 · exact le_rfl

def LiftInteriorMFEE : Prop := ∀ j t h k, h<t → t<j+h →
 0 ≤ (liftCutGapM7E2 j t h).coeff k

theorem lift_boundary_iff_interiorMFEE : LiftBoundaryM7E2 ↔ LiftInteriorMFEE := by
 constructor
 · intro H j t h k ht hj
   exact H j t h k (by omega) hj
 · intro H j t h k ht hj
   by_cases he : h=t
   · subst h
     exact lift_cut_boundary_nonnegMFEE j t k
   · exact H j t h k (by omega) hj

theorem lift_positive_iff_interiorMFEE : LiftLCPositiveM7E2 ↔ LiftInteriorMFEE := by
 rw [lift_positive_iff_boundaryM7E2,lift_boundary_iff_interiorMFEE]

end
end MathGKM.Markov
