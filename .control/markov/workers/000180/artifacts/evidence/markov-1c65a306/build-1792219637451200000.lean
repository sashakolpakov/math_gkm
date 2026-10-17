import MarkovReverseMomentsM1C6
/-! Machine-authored 1c65a306. Exact variance-drift characterization of the
upper adjacent gap; positivity is not asserted. All masses are positive. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def reverseCenterM1C6 (j s h : ℕ) : ℝ := (s:ℝ)+j+4-(h:ℝ)/2

def momentDriftM1C6 (j s h : ℕ) : ℝ :=
 (reverseCenterM1C6 j s h+1)*reverseMomentM1C6 j s h*reverseConvMBEC j s s (h-1)-
 reverseCenterM1C6 j s h*reverseMomentM1C6 j s (h-1)*reverseConvMBEC j s s h+
 reverseCenterM1C6 j s h/4*reverseConvMBEC j s s h*reverseConvMBEC j s s (h-1)

def varianceDriftM1C6 (j s h : ℕ) : ℝ :=
 (reverseCenterM1C6 j s h+1)*reverseVarianceM1C6 j s h-
 reverseCenterM1C6 j s h*reverseVarianceM1C6 j s (h-1)+reverseCenterM1C6 j s h/4

theorem reverse_center_positiveM1C6 (j s h : ℕ) (hh : h ≤ j) :
 0 < reverseCenterM1C6 j s h := by
 have hh' : (h:ℝ)≤j := by exact_mod_cast hh
 unfold reverseCenterM1C6
 positivity

theorem reverse_gap_driftM1C6 (j s h : ℕ) (h0 : 1 ≤ h) (hh : h ≤ j) :
 (s+j+4:ℝ)^3*(s+j+5)*
  (reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h-
   reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1))=
 (2*reverseCenterM1C6 j s h+1)*momentDriftM1C6 j s h := by
 have hm : h-1 ≤ j := by omega
 calc
  _ = ((s+j+4:ℝ)^2*reverseConvMBEC j (s+1) (s+1) (h-1))*
       ((s+j+4:ℝ)*(s+j+5)*reverseConvMBEC j s (s+2) h)-
      ((s+j+4:ℝ)^2*reverseConvMBEC j (s+1) (s+1) h)*
       ((s+j+4:ℝ)*(s+j+5)*reverseConvMBEC j s (s+2) (h-1)) := by ring
  _ = _ := by
   rw [reverse_balanced_momentM1C6 j s (h-1) hm,
     reverse_unbalanced_momentM1C6 j s h hh,
     reverse_balanced_momentM1C6 j s h hh,
     reverse_unbalanced_momentM1C6 j s (h-1) hm]
   unfold reverseCenterM1C6 momentDriftM1C6
   rw [Nat.cast_sub h0]
   norm_num only [Nat.cast_one]
   unfold reverseCenterM1C6
   ring

theorem moment_variance_driftM1C6 (j s h : ℕ) (hh : h ≤ j) :
 momentDriftM1C6 j s h=reverseConvMBEC j s s h*reverseConvMBEC j s s (h-1)*
   varianceDriftM1C6 j s h := by
 have hp := ne_of_gt (reverse_mass_positiveM1C6 j s h hh)
 have hq := ne_of_gt (reverse_mass_positiveM1C6 j s (h-1) (by omega))
 unfold momentDriftM1C6 varianceDriftM1C6 reverseVarianceM1C6
 field_simp
 <;> ring

theorem reverse_adjacent_drift_iffM1C6 (j s h : ℕ) (h0 : 1 ≤ h) (hh : h ≤ j) :
 (reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1) ≤
  reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h) ↔
 0 ≤ varianceDriftM1C6 j s h := by
 have he := reverse_gap_driftM1C6 j s h h0 hh
 rw [moment_variance_driftM1C6 j s h hh] at he
 have hp : 0 < (s+j+4:ℝ)^3*(s+j+5) := by positivity
 have hc := reverse_center_positiveM1C6 j s h hh
 have hq : 0 < (2*reverseCenterM1C6 j s h+1)*
   (reverseConvMBEC j s s h*reverseConvMBEC j s s (h-1)) := by
   exact mul_pos (by linarith) (mul_pos (reverse_mass_positiveM1C6 j s h hh)
     (reverse_mass_positiveM1C6 j s (h-1) (by omega)))
 constructor
 · intro H
   have H' := mul_nonneg hp.le (sub_nonneg.mpr H)
   rw [he] at H'
   rw [←mul_assoc] at H'
   exact (mul_nonneg_iff_of_pos_left hq).mp H'
 · intro H
   have H' := mul_nonneg hq.le H
   rw [mul_assoc,←he] at H'
   exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hp).mp H')

theorem reverse_adjacent_of_variance_monoM1C6 (j s h : ℕ) (h0 : 1 ≤ h) (hh : h ≤ j)
 (H : reverseVarianceM1C6 j s (h-1) ≤ reverseVarianceM1C6 j s h) :
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1) ≤
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h := by
 apply (reverse_adjacent_drift_iffM1C6 j s h h0 hh).mpr
 have hp := reverse_center_positiveM1C6 j s h hh
 have hn := reverse_variance_nonnegM1C6 j s h hh
 have hd := mul_nonneg hp.le (sub_nonneg.mpr H)
 unfold varianceDriftM1C6
 nlinarith

end
end MathGKM.Markov
