import MarkovAbsorbedKernelM418
import MarkovCorrectionRootM418
/-! Machine-authored 418bcc64. Exact conditional route from a new absorbed
kernel criterion to the entire first correction row. The criterion is open. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem absorbed_coeff_tailM418 (d j t k : ℕ) (c : ℝ) (hk : t<k) :
 (absorbedLiftM418 d j c t).coeff k=0 := by
 simp [absorbedLiftM418,coeff_add,lift_poly_coeffM7E2,reverseLiftMAE9,
   show ¬k ≤ t by omega,coeff_C_mul,coeff_X_pow,show k≠t by omega]

theorem absorbed_cut_zeroM418 (d j t h : ℕ) (c : ℝ) (ht : t<h) :
 cutPolyMFEE h (absorbedLiftM418 d j c t)=0 := by
 ext k
 rw [cut_poly_coeffMFEE,coeff_zero]
 split_ifs with hk
 · exact absorbed_coeff_tailM418 d j t k c (by omega)
 · rfl

theorem absorbed_cut_highM418 (d j t h k : ℕ) (c : ℝ) (hc : 0 ≤ c) (ht : t<h) :
 0 ≤ ((cutPolyMFEE h (absorbedLiftM418 d j c (t+1)))^2-
   cutPolyMFEE h (absorbedLiftM418 d j c t)*
     cutPolyMFEE h (absorbedLiftM418 d j c (t+2))).coeff k := by
 rw [absorbed_cut_zeroM418 d j t h c ht,zero_mul,sub_zero,pow_two,coeff_mul]
 apply sum_nonneg
 intro p hp
 have hn (m : ℕ) : 0 ≤ (cutPolyMFEE h (absorbedLiftM418 d j c (t+1))).coeff m := by
   rw [cut_poly_coeffMFEE]
   split_ifs
   · exact absorbed_nonnegM418 d j (t+1) m c hc
   · exact le_rfl
 exact mul_nonneg (hn _) (hn _)

theorem absorbed_cut_tailM418 (d j t h k : ℕ) (c : ℝ) (ht : d ≤ t) :
 0 ≤ ((cutPolyMFEE h (absorbedLiftM418 d j c (t+1)))^2-
   cutPolyMFEE h (absorbedLiftM418 d j c t)*
     cutPolyMFEE h (absorbedLiftM418 d j c (t+2))).coeff k := by
 rw [absorbed_tailM418 d j (t+1) c (by omega),absorbed_tailM418 d j t c ht,
   absorbed_tailM418 d j (t+2) c (by omega)]
 simpa only [cut_lift_identityMFEE,liftCutGapM7E2] using lift_all_cutsM7A3 j t h k

def absorbedSourceJM418 (d : ℕ) (r : Bool) : ℕ := d+(if r then 3 else 2)

def AbsorbedMiddleM418 : Prop := ∀ d t h k : ℕ, ∀ r : Bool,
 4 ≤ t → t<d → h ≤ t →
 0 ≤ ((cutPolyMFEE h (absorbedLiftM418 d (absorbedSourceJM418 d r)
     (correctionConstantMDB2 r) (t+1)))^2-
   cutPolyMFEE h (absorbedLiftM418 d (absorbedSourceJM418 d r)
     (correctionConstantMDB2 r) t)*
   cutPolyMFEE h (absorbedLiftM418 d (absorbedSourceJM418 d r)
     (correctionConstantMDB2 r) (t+2))).coeff k

theorem absorbed_source_output_lcM418 (H : AbsorbedMiddleM418) (d t : ℕ)
 (r : Bool) (ht : 4 ≤ t) :
 augmentedOutputM7A3 d (absorbedSourceJM418 d r) (correctionConstantMDB2 r) (t+1)*
   augmentedOutputM7A3 d (absorbedSourceJM418 d r) (correctionConstantMDB2 r) (t+3) ≤
 augmentedOutputM7A3 d (absorbedSourceJM418 d r) (correctionConstantMDB2 r) (t+2)^2 := by
 apply absorbed_output_lc_of_cutsM418
 intro h k
 by_cases hd : d ≤ t
 · exact absorbed_cut_tailM418 _ _ _ _ _ _ hd
 by_cases hh : h ≤ t
 · exact H d t h k r ht (by omega) hh
 · apply absorbed_cut_highM418
   · cases r <;> norm_num [correctionConstantMDB2]
   · omega

theorem first_window_of_absorbedM418 (H : AbsorbedMiddleM418) : FirstCorrectionWindowM418 := by
 intro q hq r i hi _
 have hj : absorbedSourceJM418 (correctionExponentMDB2 q r) r=q+1 := by
   cases r <;> simp only [absorbedSourceJM418,correctionExponentMDB2,
     Bool.false_eq_true,if_false,if_true] <;> omega
 have hh := absorbed_source_output_lcM418 H (correctionExponentMDB2 q r) (i-3) r (by omega)
 rw [hj,←source_correction_outputM7A3 q (i-3+1) r hq,
   ←source_correction_outputM7A3 q (i-3+3) r hq,
   ←source_correction_outputM7A3 q (i-3+2) r hq] at hh
 convert hh using 1 <;> congr 2 <;> omega

theorem all_first_correction_of_absorbedM418 (H : AbsorbedMiddleM418)
 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
   threeRawM9E2 q r (i+1) (q+1)^2 :=
 first_correction_all_iff_windowM418.mpr (first_window_of_absorbedM418 H) q hq r i

theorem root_of_absorbed_and_remainingM418 (H : AbsorbedMiddleM418)
 (hb : ThreeBeyondCorrectionM418) (h4 : OtherFourM9E2) : Conjecture63 :=
 root_iff_correction_windowM418.mpr ⟨first_window_of_absorbedM418 H,hb,h4⟩

end
end MathGKM.Markov
