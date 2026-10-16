import MarkovCutBoundaryMFEE
/-! Machine-authored fee405c8. At the opposite boundary, truncation removes
one nonnegative left-factor term. This improves the already positive full gap. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem e_coeff_nonnegMFEE (j t k : ℕ) : 0 ≤ (ePolyM7E2 j t).coeff k := by
 by_cases hk : k ≤ j
 · rw [e_poly_coeffM7E2 j t k hk]
   unfold liftTermMAE9
   positivity
 · rw [e_poly_tailM7E2 j t k (by omega)]

theorem lift_cut_outer_leftMFEE (j t h : ℕ) (ht : t+1=j+h) :
 X*liftCutM7E2 j t h=X^h*(ePolyM7E2 j t-C (ePolyM7E2 j t).coeff 0) := by
 ext k
 cases k with
 | zero =>
   rw [coeff_X_mul_zero,coeff_X_pow_mul']
   split_ifs with hh
   · have he : h=0 := by omega
     subst h
     simp
   · rfl
 | succ k =>
   rw [coeff_X_mul,lift_cut_coeffM7E2,lift_poly_coeffM7E2,coeff_X_pow_mul']
   by_cases hk : h ≤ k
   · rw [if_pos hk,if_pos (by omega)]
     simp only [coeff_sub,coeff_C,show k+1-h≠0 by omega,if_false,sub_zero]
     by_cases hkt : k ≤ t
     · rw [reverseLiftMAE9,if_pos hkt,e_poly_coeffM7E2 j t (k+1-h) (by omega)]
       congr 2
       omega
     · rw [reverseLiftMAE9,if_neg hkt,e_poly_tailM7E2 j t (k+1-h) (by omega)]
       simp
   · rw [if_neg hk]
     by_cases hh : h ≤ k+1
     · have he : k+1=h := by omega
       rw [if_pos hh,he,Nat.sub_self,coeff_sub,coeff_C]
       simp
     · rw [if_neg hh]

theorem lift_cut_outer_identityMFEE (j t h : ℕ) (ht : t+1=j+h) :
 liftCutGapM7E2 j t h=X^(2*h)*(
   ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)+
   C ((ePolyM7E2 j t).coeff 0)*ePolyM7E2 j (t+2)) := by
 have h1 : liftCutM7E2 j (t+1) h=X^h*ePolyM7E2 j (t+1) := by
   rw [lift_cut_noneM7E2 j (t+1) h (by omega),lift_poly_shiftM7E2 j (t+1) (by omega),
     show t+1-j=h by omega]
 have h2 : liftCutM7E2 j (t+2) h=X^(h+1)*ePolyM7E2 j (t+2) := by
   rw [lift_cut_noneM7E2 j (t+2) h (by omega),lift_poly_shiftM7E2 j (t+2) (by omega),
     show t+2-j=h+1 by omega]
 apply mul_left_cancel₀ (show (X:ℝ[X])≠0 from X_ne_zero)
 rw [liftCutGapM7E2,h1,h2]
 have hl := lift_cut_outer_leftMFEE j t h ht
 rw [show 2*h=h+h by omega,pow_add,pow_succ]
 linear_combination -(X^h*ePolyM7E2 j (t+2))*hl

theorem lift_cut_outer_nonnegMFEE (j t h k : ℕ) (ht : t+1=j+h) :
 0 ≤ (liftCutGapM7E2 j t h).coeff k := by
 rw [lift_cut_outer_identityMFEE j t h ht,coeff_X_pow_mul']
 split_ifs
 · rw [coeff_add,coeff_C_mul]
   exact add_nonneg (e_gap_nonnegM7E2 j t _) (mul_nonneg
     (e_coeff_nonnegMFEE j t 0) (e_coeff_nonnegMFEE j (t+2) _))
 · exact le_rfl

def LiftMiddleMFEE : Prop := ∀ j t h k, h<t → t+1<j+h →
 0 ≤ (liftCutGapM7E2 j t h).coeff k

theorem lift_interior_iff_middleMFEE : LiftInteriorMFEE ↔ LiftMiddleMFEE := by
 constructor
 · intro H j t h k ht hj
   exact H j t h k ht (by omega)
 · intro H j t h k ht hj
   by_cases he : t+1=j+h
   · exact lift_cut_outer_nonnegMFEE j t h k he
   · exact H j t h k ht (by omega)

theorem lift_positive_iff_middleMFEE : LiftLCPositiveM7E2 ↔ LiftMiddleMFEE := by
 rw [lift_positive_iff_interiorMFEE,lift_interior_iff_middleMFEE]

theorem lift_cut_small_jMFEE (j t h k : ℕ) (hj : j ≤ 2) :
 0 ≤ (liftCutGapM7E2 j t h).coeff k := by
 by_cases h0 : t<h
 · exact lift_cut_highM7E2 j t h k h0
 by_cases h1 : j+h ≤ t
 · exact lift_cut_tailM7E2 j t h k h1
 by_cases h2 : h=t
 · subst h
   exact lift_cut_boundary_nonnegMFEE j t k
 · exact lift_cut_outer_nonnegMFEE j t h k (by omega)

end
end MathGKM.Markov
