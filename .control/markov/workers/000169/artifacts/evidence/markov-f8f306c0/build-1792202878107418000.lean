import MarkovAbsorbedBorderMF8F
/-! Machine-authored f8f306c0. A source-independent quantitative lift-kernel
candidate propagates the proved outer border to every inner border. The
candidate is explicit and remains unproved. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def BorderDominanceMF8F : Prop := ∀ j t h : ℕ,
 4 ≤ t → t+3 ≤ j → h ≤ t →
 (liftCutGapM7E2 j t t).coeff (t+t)*(liftTermMAE9 j (t+2) (t+2-h):ℝ) ≤
 (liftCutGapM7E2 j t h).coeff (t+h)*(liftTermMAE9 j (t+2) 2:ℝ)

theorem absorbed_border_of_dominanceMF8F (H : BorderDominanceMF8F) :
 AbsorbedBorderMarginMF8F := by
 intro d t h r ht hd hh
 let j := absorbedSourceJM418 d r
 have hj : t+3 ≤ j := by
   dsimp [j,absorbedSourceJM418]
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> omega
 have hp : (0:ℝ) < liftTermMAE9 j (t+2) 2 := by
   exact_mod_cast lift_term_positiveMAD5 j (t+2) 2 (by omega)
 have hm : (0:ℝ) ≤ liftTermMAE9 j (t+2) (t+2-h) := by
   exact_mod_cast (lift_term_positiveMAD5 j (t+2) (t+2-h) (by omega)).le
 have hb := absorbed_boundary_sourceMF8F d t (t+t) r ht hd
 rw [absorbed_border_identityMF8F _ _ _ _ _ (le_refl t),
   show t+2-t=2 by omega] at hb
 have hb' := mul_le_mul_of_nonneg_right (sub_nonneg.mp hb) hm
 have hD := H j t h ht hj (by omega)
 apply (mul_le_mul_iff_of_pos_right hp).mp
 change (absorbedExtraM418 d t (correctionConstantMDB2 r)*
   (liftTermMAE9 j (t+2) (t+2-h):ℝ))*(liftTermMAE9 j (t+2) 2:ℝ) ≤ _
 calc
  _ = (absorbedExtraM418 d t (correctionConstantMDB2 r)*
      (liftTermMAE9 j (t+2) 2:ℝ))*(liftTermMAE9 j (t+2) (t+2-h):ℝ) := by ring
  _ ≤ (liftCutGapM7E2 j t t).coeff (t+t)*
      (liftTermMAE9 j (t+2) (t+2-h):ℝ) := hb'
  _ ≤ _ := hD

theorem absorbed_middle_of_uncut_dominanceMF8F
 (HU : AbsorbedUncutMF8F) (HD : BorderDominanceMF8F) : AbsorbedMiddleM418 :=
 absorbed_middle_iff_uncut_marginMF8F.mpr ⟨HU,absorbed_border_of_dominanceMF8F HD⟩

theorem first_correction_of_uncut_dominanceMF8F
 (HU : AbsorbedUncutMF8F) (HD : BorderDominanceMF8F)
 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
 threeRawM9E2 q r (i+1) (q+1)^2 :=
 all_first_correction_of_absorbedM418
   (absorbed_middle_of_uncut_dominanceMF8F HU HD) q i r hq

theorem root_of_uncut_dominance_remainingMF8F
 (HU : AbsorbedUncutMF8F) (HD : BorderDominanceMF8F)
 (hb : ThreeBeyondCorrectionM418) (h4 : OtherFourM9E2) : Conjecture63 :=
 root_of_absorbed_and_remainingM418
   (absorbed_middle_of_uncut_dominanceMF8F HU HD) hb h4

end
end MathGKM.Markov
