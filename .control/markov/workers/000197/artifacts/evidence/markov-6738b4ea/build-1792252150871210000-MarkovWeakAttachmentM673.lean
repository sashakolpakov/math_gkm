import MarkovWeakScalarM673
/-! Machine-authored 6738b4ea. Actual-weight attachment of the weaker margin. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
theorem weak_drift_large_columnM673 (d i r : ℕ) (hi : 16 ≤ i) (hr : 3 ≤ r) :
 0 ≤ weakDriftM673 d (i+r) i := by
 have h1 := actual_deficit_firstM41B d (i+r) i (by omega)
 have h2 := actual_deficit_secondM41B d (i+r) i (by omega)
 have hE := top_excess_deficitM41B d (i+r) i
 have hG := top_deficit_nonnegM41B d (i+r) i 2
 have hV := top_variance_deficitM41B d (i+r) i
 have hE' : ((r:ℤ)*(2*i+r+d+9))*topMassM55C d (i+r) i-
   (2*(i+r:ℕ)+d+9:ℤ)*topDeficitM41B d (i+r) i 1 ≤ topExcessM55C d (i+r) i := by
   unfold topEigenM55C at hE
   push_cast at hE ⊢
   nlinarith only [hE,hG]
 have cast_le (a b : ℤ) (h : a ≤ b) : (a:ℝ) ≤ (b:ℝ) := by exact_mod_cast h
 have h1R := cast_le _ _ h1
 have h2R := cast_le _ _ h2
 have hER := cast_le _ _ hE'
 have hVR := cast_le _ _ hV
 push_cast at h1R h2R hER hVR
 have z := weak_controlM673 (i:ℝ) (r:ℝ) (2*i+r+d+9)
   (topMassM55C d (i+r) i:ℝ) (topExcessM55C d (i+r) i:ℝ)
   (topVarianceNumerM55C d (i+r) i:ℝ) (topDeficitM41B d (i+r) i 1:ℝ)
   (topDeficitM41B d (i+r) i 2:ℝ)
   (by exact_mod_cast hi) (by exact_mod_cast hr) (by linarith)
   (by exact_mod_cast top_mass_nonnegM55C d (i+r) i)
   (by convert h1R using 1 <;> ring)
   (by unfold deficitSecondM41B; convert h2R using 1 <;> ring)
   (by convert hER using 1 <;> ring)
   (by convert hVR using 1 <;> ring)
 unfold weakDriftM673
 have zz : (0:ℝ) ≤ (15*(i:ℝ)+47)*(topExcessM55C d (i+r) i:ℝ)^2+
   ((i:ℝ)+1)*(8*((i:ℝ)+4)+1)*(2*i+d+10)*(topMassM55C d (i+r) i:ℝ)*(topExcessM55C d (i+r) i:ℝ)-
   ((i:ℝ)+1)*(8*((i:ℝ)+4)+1)*(topVarianceNumerM55C d (i+r) i:ℝ) := by
   convert z using 1 <;> ring
 exact_mod_cast zz

end
end MathGKM.Markov
