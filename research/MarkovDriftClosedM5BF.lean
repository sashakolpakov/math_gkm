import MarkovOutwardMomentsM5BF
import MarkovFixedZeroClosedM1C6
/-! Machine-authored 5bf6837d. Universal variance drift and the complete
auxiliary convolution-ratio inequality. No full-root closure is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

theorem outward_tail_nonnegM5BF (j s H : ℕ) (hH : H<j) :
 0 ≤ outwardTailM5BF j s H := by
 unfold outwardTailM5BF
 exact mul_nonneg (mul_nonneg (by positivity)
   (reverse_kernel_positiveM1C6 j s 0 (by omega)).le)
   (reverse_kernel_positiveM1C6 j s (H+1) (by omega)).le

theorem previous_moment_boundM5BF (j s H : ℕ) (hH : H ≤ j) :
 reverseMomentM1C6 j s H ≤ reverseConvMBEC j s s H*((H:ℝ)/2+1)^2 := by
 have hp := reverse_mass_positiveM1C6 j s H hH
 have hv := reverse_variance_upperM1C6 j s H hH
 unfold reverseVarianceM1C6 at hv
 have he := (div_le_iff₀ hp).mp hv
 have hb : (H:ℝ)^2/4 ≤ ((H:ℝ)/2+1)^2 := by
   have hn := Nat.cast_nonneg (α:=ℝ) H
   nlinarith
 nlinarith only [he,mul_le_mul_of_nonneg_left hb hp.le]

theorem variance_drift_succM5BF (j s H : ℕ) (hH : H<j) :
 0 ≤ varianceDriftM1C6 j s (H+1) := by
 have hc := rate_covarianceM5BF j s H (by omega)
 have hb := mul_le_mul_of_nonneg_right (previous_moment_boundM5BF j s H (by omega))
   (outward_tail_nonnegM5BF j s H hH)
 have hm := outward_massM5BF j s H hH
 have ht := outward_momentM5BF j s H hH
 have hg : 0 ≤ momentDriftM1C6 j s (H+1) := by
   unfold momentDriftM1C6
   rw [show H+1-1=H by omega]
   nlinarith only [hc,hb,
     congrArg (fun x : ℝ => reverseMomentM1C6 j s H*x) hm,
     congrArg (fun x : ℝ => reverseConvMBEC j s s H*x) ht]
 rw [moment_variance_driftM1C6 j s (H+1) (by omega)] at hg
 exact (mul_nonneg_iff_of_pos_left (mul_pos
   (reverse_mass_positiveM1C6 j s (H+1) (by omega))
   (reverse_mass_positiveM1C6 j s (H+1-1) (by omega)))).mp hg

theorem variance_drift_nonnegM5BF (j s h : ℕ) (h0 : 1 ≤ h) (hh : h ≤ j) :
 0 ≤ varianceDriftM1C6 j s h := by
 obtain ⟨H,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : h≠0)
 exact variance_drift_succM5BF j s H (by omega)

theorem positive_parameter_tail_closedM5BF : PositiveParameterTailM1C6 := by
 intro j s h hs h0 hh
 exact variance_drift_nonnegM5BF j s h (by omega) hh

theorem upper_adjacent_closedM5BF : UpperAdjacentMA45 :=
 positive_parameter_tail_iffM1C6.mp positive_parameter_tail_closedM5BF

theorem unshifted_adjacent_closedM5BF : UnshiftedAdjacentM09F :=
 upper_adjacent_iffMA45.mp upper_adjacent_closedM5BF

theorem unshifted_ratio_closedM5BF : UnshiftedRatioM09F :=
 upper_ratio_iffMA45.mp upper_adjacent_closedM5BF

theorem sharp_complete_margin_closedM5BF : SharpCompleteMarginMBE3 :=
 sharp_margin_of_upperMA45 upper_adjacent_closedM5BF

theorem source_band_allM5BF (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤ 
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_upperMA45 upper_adjacent_closedM5BF q k i r hq hn

end
end MathGKM.Markov
