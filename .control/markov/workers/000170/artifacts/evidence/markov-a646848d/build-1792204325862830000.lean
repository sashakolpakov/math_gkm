import MarkovAbsorbedHighMA64
import MarkovLiftMarginMA64
import MarkovBorderMarginScalarMA64
/-! Machine-authored a646848d. Universal first correction row and exact
remaining root scope. No claim about later rows or other directions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem absorbed_border_generalMA64 (d j t h : ℕ) (c : ℝ)
 (ht : 4 ≤ t) (hd : t<d) (hj : d+2 ≤ j) (hh : h ≤ t) (hc : 0 ≤ c) (hc8 : c ≤ 8) :
 absorbedExtraM418 d t c*(liftTermMAE9 j (t+2) (t+2-h):ℝ) ≤
 (liftCutGapM7E2 j t h).coeff (t+h) := by
 have hn : 1 ≤ t+1-h := by omega
 have hnj : t+1-h ≤ j := by omega
 have hC := lift_right_upperMA64 j t (t+1-h) hn hnj
 rw [show t+1-h+1=t+2-h by omega] at hC
 have ha := absorbed_extra_boundMA64 d j t 0 c hc hc8 (by omega) hj
 simp only [Nat.add_zero] at ha
 have hu : 0 ≤ perturbBoundMA64 j t := by
   unfold perturbBoundMA64
   have htr : (t:ℝ)+3 ≤ j := by exact_mod_cast (show t+3 ≤ j by omega)
   have : 0 ≤ (j:ℝ)-t-2 := by linarith
   positivity
 have hCn : (0:ℝ) ≤ liftTermMAE9 j (t+2) (t+2-h) := by
   exact_mod_cast (lift_term_positiveMAD5 j (t+2) (t+2-h) (by omega)).le
 have hBn : (0:ℝ) ≤ liftTermMAE9 j (t+1) (t+1-h) := by
   exact_mod_cast (lift_term_positiveMAD5 j (t+1) (t+1-h) hnj).le
 have hM : 0 < kernelScaleMA64 j t := by
   unfold kernelScaleMA64
   rw [complete_coeffMA64]
   have hp : (0:ℝ) < liftTermMAE9 j (t+1) 0 := by
     exact_mod_cast lift_term_positiveMAD5 j (t+1) 0 (by omega)
   positivity
 have hprod := mul_le_mul ha hC hCn hu
 have hprodM := mul_le_mul_of_nonneg_right hprod hM.le
 have hscalar := mul_le_mul_of_nonneg_right
   (border_kernel_scalarMA64 j t ht (by omega)) hBn
 have hgap := lift_border_lowerMA64 j t h hh (by omega)
 apply (mul_le_mul_iff_of_pos_right hM).mp
 nlinarith only [hprodM,hscalar,hgap]

theorem absorbed_border_closedMA64 : AbsorbedBorderMarginMF8F := by
 intro d t h r ht hd hh
 apply absorbed_border_generalMA64 d (absorbedSourceJM418 d r) t h
   (correctionConstantMDB2 r) ht hd
 · cases r <;> simp [absorbedSourceJM418]
 · omega
 · cases r <;> norm_num [correctionConstantMDB2]
 · cases r <;> norm_num [correctionConstantMDB2]

theorem absorbed_middle_closedMA64 : AbsorbedMiddleM418 :=
 absorbed_middle_iff_borderMA64.mpr absorbed_border_closedMA64

theorem absorbed_uncut_closedMA64 : AbsorbedUncutMF8F :=
 (absorbed_middle_iff_two_testsMF8F.mp absorbed_middle_closedMA64).1

theorem first_correction_closedMA64 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
 threeRawM9E2 q r (i+1) (q+1)^2 :=
 all_first_correction_of_absorbedM418 absorbed_middle_closedMA64 q i r hq

theorem lower_and_first_correctionMA64 (q i j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hj : j ≤ q+1) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases he : j=q+1
 · subst j; exact first_correction_closedMA64 q i r hq
 · exact source_lower_horizontalM7A3 q i j r (by omega)

/-- Actual path coefficients, no normalization and no omitted zero columns.
The row bound extends the previously closed lower region by one full row. -/
theorem source_lower_first_pathMA64 (path : List Bool)
 (ha : (frame path).mid.a=3) (i j : ℕ) (hj : 3*j ≤ (frame path).mid.b+3) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : j ≤ q+1 := by
   rw [hb] at hj
   split_ifs at hj <;> omega
 simp only [hp]
 exact lower_and_first_correctionMA64 q i j r hq hjq

theorem root_iff_beyond_correctionMA64 :
 Conjecture63 ↔ ThreeBeyondCorrectionM418 ∧ OtherFourM9E2 := by
 constructor
 · intro h
   exact (root_iff_correction_windowM418.mp h).2
 · rintro ⟨h3,h4⟩
   exact root_iff_correction_windowM418.mpr
     ⟨first_window_of_absorbedM418 absorbed_middle_closedMA64,h3,h4⟩

end
end MathGKM.Markov
