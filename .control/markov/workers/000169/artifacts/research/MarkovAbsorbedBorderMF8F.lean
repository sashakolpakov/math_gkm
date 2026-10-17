import MarkovAbsorbedTwoTestsMF8F
/-! Machine-authored f8f306c0. Exact quantitative meaning of the remaining
single-coefficient border test. No lower bound is postulated. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem absorbed_gap_perturbationMF8F (d j t h : ℕ) (c : ℝ) (hh : h ≤ t) :
 absorbedGapMF8F d j t h c=liftCutGapM7E2 j t h+
 C (2*absorbedExtraM418 d (t+1) c)*X^(t+1)*liftCutM7E2 j (t+1) h-
 C (absorbedExtraM418 d t c)*X^t*liftCutM7E2 j (t+2) h-
 C (absorbedExtraM418 d (t+2) c)*X^(t+2)*liftCutM7E2 j t h+
 C ((absorbedExtraM418 d (t+1) c)^2-
   absorbedExtraM418 d t c*absorbedExtraM418 d (t+2) c)*X^(2*t+2) := by
 unfold absorbedGapMF8F
 rw [cut_absorbedM418 d j (t+1) h c (by omega),
   cut_absorbedM418 d j t h c hh,cut_absorbedM418 d j (t+2) h c (by omega)]
 unfold liftCutGapM7E2
 rw [show 2*t+2=t+t+2 by omega]
 simp only [pow_add,pow_one,C_mul,C_sub,C_pow,map_ofNat]
 ring

theorem monomial_lift_cut_lowMF8F (j s h n k : ℕ) (a : ℝ) (hk : k<n+h) :
 (C a*X^n*liftCutM7E2 j s h).coeff k=0 := by
 rw [mul_assoc,coeff_C_mul,coeff_X_pow_mul']
 split_ifs with hn
 · rw [lift_cut_coeffM7E2,if_neg (by omega),mul_zero]
 · exact mul_zero _

theorem absorbed_border_identityMF8F (d j t h : ℕ) (c : ℝ) (hh : h ≤ t) :
 (absorbedGapMF8F d j t h c).coeff (t+h)=
 (liftCutGapM7E2 j t h).coeff (t+h)-
 absorbedExtraM418 d t c*(liftTermMAE9 j (t+2) (t+2-h):ℝ) := by
 rw [absorbed_gap_perturbationMF8F d j t h c hh]
 simp only [coeff_add,coeff_sub]
 rw [monomial_lift_cut_lowMF8F j (t+1) h (t+1) (t+h) _ (by omega),
   monomial_lift_cut_lowMF8F j t h (t+2) (t+h) _ (by omega)]
 have ht : (C ((absorbedExtraM418 d (t+1) c)^2-
     absorbedExtraM418 d t c*absorbedExtraM418 d (t+2) c)*X^(2*t+2)).coeff (t+h)=0 := by
   rw [coeff_C_mul,coeff_X_pow]
   simp only [if_neg (show t+h≠2*t+2 by omega),mul_zero]
 rw [ht,add_zero,sub_zero,add_zero]
 congr 1
 rw [mul_assoc,coeff_C_mul,coeff_X_pow_mul',if_pos (by omega),
   show t+h-t=h by omega,lift_cut_coeffM7E2,if_pos (le_refl h),
   lift_poly_coeffM7E2,reverseLiftMAE9,if_pos (by omega)]

def AbsorbedBorderMarginMF8F : Prop := ∀ d t h : ℕ, ∀ r : Bool,
 4 ≤ t → t<d → h<t →
 absorbedExtraM418 d t (correctionConstantMDB2 r)*
   (liftTermMAE9 (absorbedSourceJM418 d r) (t+2) (t+2-h):ℝ) ≤
 (liftCutGapM7E2 (absorbedSourceJM418 d r) t h).coeff (t+h)

theorem absorbed_border_iff_marginMF8F : AbsorbedBorderMF8F ↔ AbsorbedBorderMarginMF8F := by
 constructor
 · intro H d t h r ht hd hh
   have hv := H d t h r ht hd hh
   rw [absorbed_border_identityMF8F _ _ _ _ _ (by omega)] at hv
   exact sub_nonneg.mp hv
 · intro H d t h r ht hd hh
   rw [absorbed_border_identityMF8F _ _ _ _ _ (by omega)]
   exact sub_nonneg.mpr (H d t h r ht hd hh)

theorem absorbed_middle_iff_uncut_marginMF8F :
 AbsorbedMiddleM418 ↔ AbsorbedUncutMF8F ∧ AbsorbedBorderMarginMF8F := by
 rw [absorbed_middle_iff_two_testsMF8F,absorbed_border_iff_marginMF8F]

end
end MathGKM.Markov
