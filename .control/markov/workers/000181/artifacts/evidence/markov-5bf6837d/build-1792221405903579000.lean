import MarkovDriftClosedM5BF
/-! Machine-authored 5bf6837d. Strictness of the universal auxiliary drift,
provided by the two explicitly retained external endpoints. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem outward_tail_positiveM5BF (j s H : ℕ) (hH : H<j) :
 0<outwardTailM5BF j s H := by
 unfold outwardTailM5BF
 exact mul_pos (mul_pos (by positivity) (reverse_kernel_positiveM1C6 j s 0 (by omega)))
   (reverse_kernel_positiveM1C6 j s (H+1) (by omega))

theorem previous_moment_strict_boundM5BF (j s H : ℕ) (hH : H ≤ j) :
 reverseMomentM1C6 j s H<reverseConvMBEC j s s H*((H:ℝ)/2+1)^2 := by
 have hp := reverse_mass_positiveM1C6 j s H hH
 have hv := reverse_variance_upperM1C6 j s H hH
 unfold reverseVarianceM1C6 at hv
 have he := (div_le_iff₀ hp).mp hv
 have hb : (H:ℝ)^2/4<((H:ℝ)/2+1)^2 := by
   have hn : (0:ℝ) ≤ H := Nat.cast_nonneg H
   nlinarith
 nlinarith only [he,mul_lt_mul_of_pos_left hb hp]

theorem variance_drift_positiveM5BF (j s h : ℕ) (h0 : 1 ≤ h) (hh : h ≤ j) :
 0<varianceDriftM1C6 j s h := by
 obtain ⟨H,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : h≠0)
 have hc := rate_covarianceM5BF j s H (by omega)
 have hb := mul_lt_mul_of_pos_right (previous_moment_strict_boundM5BF j s H (by omega))
   (outward_tail_positiveM5BF j s H (by omega))
 have hm := outward_massM5BF j s H (by omega)
 have ht := outward_momentM5BF j s H (by omega)
 have hg : 0<momentDriftM1C6 j s (H+1) := by
   unfold momentDriftM1C6
   rw [show H+1-1=H by omega]
   nlinarith only [hc,hb,
     congrArg (fun x : ℝ => reverseMomentM1C6 j s H*x) hm,
     congrArg (fun x : ℝ => reverseConvMBEC j s s H*x) ht]
 rw [moment_variance_driftM1C6 j s (H+1) (by omega)] at hg
 exact (mul_pos_iff_of_pos_left (mul_pos
   (reverse_mass_positiveM1C6 j s (H+1) (by omega))
   (reverse_mass_positiveM1C6 j s (H+1-1) (by omega)))).mp hg

theorem reverse_adjacent_strictM5BF (j s h : ℕ) (h0 : 1 ≤ h) (hh : h ≤ j) :
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1)<
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h := by
 have he := reverse_gap_driftM1C6 j s h h0 hh
 rw [moment_variance_driftM1C6 j s h hh] at he
 have hp : 0<(s+j+4:ℝ)^3*(s+j+5) := by positivity
 have hc := reverse_center_positiveM1C6 j s h hh
 have hm := mul_pos (reverse_mass_positiveM1C6 j s h hh)
   (reverse_mass_positiveM1C6 j s (h-1) (by omega))
 have H := mul_pos (show 0<2*reverseCenterM1C6 j s h+1 by linarith)
   (mul_pos hm (variance_drift_positiveM5BF j s h h0 hh))
 rw [←mul_assoc,←he] at H
 exact sub_pos.mp ((mul_pos_iff_of_pos_left hp).mp H)

end
end MathGKM.Markov
