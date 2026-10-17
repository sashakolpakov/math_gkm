import MarkovCenteredScalarME10
import MarkovShiftMarginME10
/-! Machine-authored e108e0e2. Attach the centered variance estimate to
the actual template weights, including their modified endpoint. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem centered_drift_large_columnME10 (d i r : ℕ) (hi : 10 ≤ i) (hr : 3 ≤ r) :
 0 ≤ weakDriftME10 d (i+r) i := by
 have h2 := actual_deficit_secondME10 d (i+r) i (by omega)
 have hV := top_variance_centeredME10 d (i+r) i
 have cast_le (a b : ℤ) (h : a ≤ b) : (a:ℝ) ≤ (b:ℝ) := by exact_mod_cast h
 have h2R := cast_le _ _ h2
 have hVR := cast_le _ _ hV
 unfold topEigenME10 at hVR
 push_cast at h2R hVR
 have z := centered_controlME10 (i:ℝ) (r:ℝ) (2*i+r+d+5)
   (topMassME10 d (i+r) i:ℝ) (topExcessME10 d (i+r) i:ℝ)
   (topVarianceNumerME10 d (i+r) i:ℝ) (topDeficitME10 d (i+r) i 2:ℝ)
   (by exact_mod_cast hi) (by exact_mod_cast hr) (by linarith)
   (by exact_mod_cast top_shift_nonnegME10 d (i+r) i)
   (by unfold deficitSecondM41B; convert h2R using 1 <;> ring)
   (by convert hVR using 1 <;> ring)
 unfold weakDriftME10
 have zz : (0:ℝ) ≤ (15*(i:ℝ)+47)*(topExcessME10 d (i+r) i:ℝ)^2+
   ((i:ℝ)+1)*(8*((i:ℝ)+4)+1)*(2*i+d+6)*(topMassME10 d (i+r) i:ℝ)*(topExcessME10 d (i+r) i:ℝ)-
   ((i:ℝ)+1)*(8*((i:ℝ)+4)+1)*(topVarianceNumerME10 d (i+r) i:ℝ) := by
   convert z using 1 <;> ring
 exact_mod_cast zz

theorem template_centered_largeME10 (d T c : ℕ) (hc : 10 ≤ c) (hT : c+3 ≤ T) :
 (8*((c:ℤ)+4)+1)*topMassME10 d T c*topMassME10 d T (c+2) ≤
 8*((c:ℤ)+4)*topMassME10 d T (c+1)^2 := by
 apply (weak_gap_iffME10 d T c).mpr
 have h := centered_drift_large_columnME10 d c (T-c) hc (by omega)
 simpa only [Nat.add_sub_of_le (by omega : c ≤ T)] using h


end
end MathGKM.Markov
