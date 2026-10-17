import MarkovCenteredScalarME87
/-! Machine-authored e8743310. Attach the centered variance estimate to
the actual template weights, including their modified endpoint. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem centered_drift_large_columnME87 (d i r : ℕ) (hi : 10 ≤ i) (hr : 3 ≤ r) :
 0 ≤ weakDriftM673 d (i+r) i := by
 have h2 := actual_deficit_secondM41B d (i+r) i (by omega)
 have hV := top_variance_centeredME87 d (i+r) i
 have cast_le (a b : ℤ) (h : a ≤ b) : (a:ℝ) ≤ (b:ℝ) := by exact_mod_cast h
 have h2R := cast_le _ _ h2
 have hVR := cast_le _ _ hV
 unfold topEigenM55C at hVR
 push_cast at h2R hVR
 have z := centered_controlME87 (i:ℝ) (r:ℝ) (2*i+r+d+9)
   (topMassM55C d (i+r) i:ℝ) (topExcessM55C d (i+r) i:ℝ)
   (topVarianceNumerM55C d (i+r) i:ℝ) (topDeficitM41B d (i+r) i 2:ℝ)
   (by exact_mod_cast hi) (by exact_mod_cast hr) (by linarith)
   (by exact_mod_cast top_mass_nonnegM55C d (i+r) i)
   (by unfold deficitSecondM41B; convert h2R using 1 <;> ring)
   (by convert hVR using 1 <;> ring)
 unfold weakDriftM673
 have zz : (0:ℝ) ≤ (15*(i:ℝ)+47)*(topExcessM55C d (i+r) i:ℝ)^2+
   ((i:ℝ)+1)*(8*((i:ℝ)+4)+1)*(2*i+d+10)*(topMassM55C d (i+r) i:ℝ)*(topExcessM55C d (i+r) i:ℝ)-
   ((i:ℝ)+1)*(8*((i:ℝ)+4)+1)*(topVarianceNumerM55C d (i+r) i:ℝ) := by
   convert z using 1 <;> ring
 exact_mod_cast zz

theorem template_centered_largeME87 (d T c : ℕ) (hc : 10 ≤ c) (hT : c+3 ≤ T) :
 (8*((c:ℤ)+4)+1)*topMassM55C d T c*topMassM55C d T (c+2) ≤
 8*((c:ℤ)+4)*topMassM55C d T (c+1)^2 := by
 apply (weak_gap_iffM673 d T c).mpr
 have h := centered_drift_large_columnME87 d c (T-c) hc (by omega)
 simpa only [Nat.add_sub_of_le (by omega : c ≤ T)] using h

theorem middle_gap_centeredME87 (x k c : ℕ) (r : Bool) (hc : 10 ≤ c) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hT : c+3 ≤ x+3*k+middleBaseMD02 r
 · apply middle_gap_of_weakM673 x k c r (by omega)
   unfold middleTemplateMD02
   simp only [←top_mass_short_sumMEB6]
   exact template_centered_largeME87 x (x+3*k+middleBaseMD02 r) c hc hT
 by_cases he : x+3*k+middleBaseMD02 r=c+2
 · exact middle_gap_lastM41B x k c r he
 · unfold middleGapMD02
   rw [middle_support_zeroM9DB x k (c+2) r (by omega),mul_zero,sub_zero]
   exact sq_nonneg _

end
end MathGKM.Markov
