import MarkovTransposedBoundsMBE3
/-! Machine-authored be355177. Sharp coefficientwise relative bound, attained
at the top coefficient. No log-concavity assumption enters this theorem. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def bandJMBE3 (d k : ℕ) (r : Bool) : ℕ := d+3*k+(if r then 3 else 2)
def bandBaseMBE3 (d k s : ℕ) (r : Bool) : ℝ :=
 (liftTermMAE9 (bandJMBE3 d k r) s 0:ℝ)
def bandTopMBE3 (d k s : ℕ) (r : Bool) : ℝ :=
 bandBaseMBE3 d k s r+transposedBudgetMBE3 d k s r

theorem band_base_posMBE3 (d k s : ℕ) (r : Bool) : 0 < bandBaseMBE3 d k s r := by
 unfold bandBaseMBE3
 exact_mod_cast lift_term_positiveMAD5 (bandJMBE3 d k r) s 0 (by omega)

theorem transposed_budget_nonnegMBE3 (d k s : ℕ) (r : Bool) :
 0 ≤ transposedBudgetMBE3 d k s r := by
 unfold transposedBudgetMBE3 absorbedExtraM418
 exact add_nonneg
   (div_nonneg (mul_nonneg (correction_term_nonnegMBE3 _ _ _ _) (by positivity)) (by positivity))
   (correction_term_nonnegMBE3 _ _ _ _)

theorem band_top_posMBE3 (d k s : ℕ) (r : Bool) : 0 < bandTopMBE3 d k s r :=
 add_pos_of_pos_of_nonneg (band_base_posMBE3 d k s r) (transposed_budget_nonnegMBE3 d k s r)

theorem band_kernel_topMBE3 (d k s : ℕ) (r : Bool) :
 (bandKernelM657 d k s r).coeff s=bandTopMBE3 d k s r := by
 rw [band_kernel_coeffM657]
 simp only [reverseLiftMAE9,le_refl,ite_true,Nat.sub_self,zero_add]
 simp only [bandTopMBE3,bandBaseMBE3,bandJMBE3,transposedBudgetMBE3,add_assoc]

theorem band_kernel_tailMBE3 (d k s h : ℕ) (r : Bool) (hh : s<h) :
 (bandKernelM657 d k s r).coeff h=0 := by
 rw [band_kernel_coeffM657]
 simp [reverseLiftMAE9,show ¬h ≤ s by omega,show h≠s by omega]

theorem band_kernel_ge_lowerMBE3 (d k s h : ℕ) (r : Bool) :
 (liftPolyM7E2 (bandJMBE3 d k r) s).coeff h ≤ (bandKernelM657 d k s r).coeff h := by
 rw [band_kernel_coeffM657,lift_poly_coeffM7E2]
 change (reverseLiftMAE9 (bandJMBE3 d k r) s h:ℝ) ≤
   (reverseLiftMAE9 (bandJMBE3 d k r) s h:ℝ)+_+_
 have ha : 0 ≤ absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r) := by
   unfold absorbedExtraM418
   exact div_nonneg (mul_nonneg (correction_term_nonnegMBE3 _ _ _ _) (by positivity)) (by positivity)
 split_ifs <;> linarith [correction_term_nonnegMBE3 k (s+1) (s-h+1) r]

theorem band_kernel_scaledMBE3 (d k s h : ℕ) (r : Bool) :
 bandBaseMBE3 d k s r*(bandKernelM657 d k s r).coeff h ≤
 bandTopMBE3 d k s r*(liftPolyM7E2 (bandJMBE3 d k r) s).coeff h := by
 by_cases hh : h ≤ s
 · by_cases he : h=s
   · subst h
     rw [band_kernel_topMBE3,lift_poly_coeffM7E2]
     simp only [reverseLiftMAE9,le_refl,ite_true,Nat.sub_self]
     change bandBaseMBE3 d k s r*bandTopMBE3 d k s r ≤
       bandTopMBE3 d k s r*bandBaseMBE3 d k s r
     exact le_of_eq (mul_comm _ _)
   · have hkj : k ≤ bandJMBE3 d k r := by unfold bandJMBE3; split_ifs <;> omega
     have hr := correction_relativeMBE3 (bandJMBE3 d k r) k s (s-h) r hkj
     have hn : 0 ≤ (liftTermMAE9 (bandJMBE3 d k r) s (s-h):ℝ) := by
       unfold liftTermMAE9; positivity
     have ha : 0 ≤ absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r) := by
       unfold absorbedExtraM418
       exact div_nonneg (mul_nonneg (correction_term_nonnegMBE3 _ _ _ _) (by positivity)) (by positivity)
     rw [band_kernel_coeffM657,lift_poly_coeffM7E2]
     simp only [reverseLiftMAE9,if_pos hh,if_neg he,add_zero]
     change bandBaseMBE3 d k s r*((liftTermMAE9 (bandJMBE3 d k r) s (s-h):ℝ)+
       (correctionTermM657 k (s+1) (s-h+1) r:ℝ)) ≤
       bandTopMBE3 d k s r*(liftTermMAE9 (bandJMBE3 d k r) s (s-h):ℝ)
     unfold bandTopMBE3 bandBaseMBE3 transposedBudgetMBE3
     nlinarith only [hr,mul_nonneg ha hn]
 · rw [band_kernel_tailMBE3 _ _ _ _ _ (by omega),lift_poly_coeffM7E2]
   simp [reverseLiftMAE9,hh]

/-- The displayed scaling is optimal among coefficientwise factors. -/
theorem band_kernel_bound_iffMBE3 (d k s : ℕ) (r : Bool) (v : ℝ) :
 (∀ h, (bandKernelM657 d k s r).coeff h ≤
   v*(liftPolyM7E2 (bandJMBE3 d k r) s).coeff h) ↔
 bandTopMBE3 d k s r ≤ v*bandBaseMBE3 d k s r := by
 constructor
 · intro H
   have h := H s
   rw [band_kernel_topMBE3,lift_poly_coeffM7E2] at h
   simpa only [reverseLiftMAE9,le_refl,ite_true,Nat.sub_self,bandBaseMBE3] using h
 · intro H h
   have hp := band_base_posMBE3 d k s r
   have hn := lift_nonnegM964 (bandJMBE3 d k r) s h
   have hv := mul_le_mul_of_nonneg_right H hn
   have hs := band_kernel_scaledMBE3 d k s h r
   apply (mul_le_mul_iff_of_pos_left hp).mp
   nlinarith only [hv,hs]

end
end MathGKM.Markov
