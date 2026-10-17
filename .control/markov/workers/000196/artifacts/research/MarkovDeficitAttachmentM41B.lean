import MarkovWeightedDeficitM41B
import MarkovDeficitControlM41B
/-! Machine-authored 41b38611. Algebraic attachment of actual deficit
moments to the quantitative template gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem top_linear_monoM41B (T : ℕ) (f g : ℕ → ℤ)
 (h : ∀ s, s ≤ T → f s ≤ g s) : topLinearM55C T f ≤ topLinearM55C T g := by
 unfold topLinearM55C
 apply add_le_add (h T le_rfl)
 apply mul_le_mul_of_nonneg_left _ (by norm_num)
 apply Finset.sum_le_sum
 intro s hs
 have hs' : s ≤ T := by have := Finset.mem_range.mp hs; omega
 exact mul_le_mul_of_nonneg_left (h s hs') (by omega)

theorem top_deficit_nonnegM41B (d T i j : ℕ) : 0 ≤ topDeficitM41B d T i j := by
 have h := top_linear_monoM41B T (fun _ => 0)
   (fun s => topKernelM55C d i s*((T:ℤ)-s)^j) (by
     intro s hs
     exact mul_nonneg (top_kernel_nonnegM55C _ _ _) (pow_nonneg (by omega) _))
 simpa only [topDeficitM41B,topLinearM55C,mul_zero,Finset.sum_const_zero,add_zero] using h

theorem top_excess_deficitM41B (d T i : ℕ) :
 topExcessM55C d T i=
 (topEigenM55C d T-topEigenM55C d i)*topMassM55C d T i-
 (2*(T:ℤ)+d+9)*topDeficitM41B d T i 1+topDeficitM41B d T i 2 := by
 have he : (fun s => topEigenM55C d s*topKernelM55C d i s)=
   (fun s => topEigenM55C d T*topKernelM55C d i s-
   (2*(T:ℤ)+d+9)*(topKernelM55C d i s*((T:ℤ)-s)^1)+
   topKernelM55C d i s*((T:ℤ)-s)^2) := by
   funext s
   unfold topEigenM55C
   ring
 unfold topExcessM55C topMomentM55C
 simp only [pow_one]
 rw [he,top_linear_addM55C,top_linear_subM55C,top_linear_smulM55C,top_linear_smulM55C]
 change topEigenM55C d T*topMassM55C d T i-
   (2*(T:ℤ)+d+9)*topDeficitM41B d T i 1+topDeficitM41B d T i 2-
   topEigenM55C d i*topMassM55C d T i=_
 ring

def topCenteredM41B (d T i : ℕ) : ℤ :=
 topLinearM55C T (fun s => (topEigenM55C d T-topEigenM55C d s)^2*topKernelM55C d i s)

theorem top_centered_identityM41B (d T i : ℕ) :
 topCenteredM41B d T i=topEigenM55C d T^2*topMassM55C d T i-
 2*topEigenM55C d T*topMomentM55C d T i 1+topMomentM55C d T i 2 := by
 have he : (fun s => (topEigenM55C d T-topEigenM55C d s)^2*topKernelM55C d i s)=
   (fun s => topEigenM55C d T^2*topKernelM55C d i s-
   (2*topEigenM55C d T)*(topEigenM55C d s^1*topKernelM55C d i s)+
   topEigenM55C d s^2*topKernelM55C d i s) := by funext s; ring
 rw [topCenteredM41B,he,top_linear_addM55C,top_linear_subM55C,
   top_linear_smulM55C,top_linear_smulM55C]
 rfl

theorem top_centered_boundM41B (d T i : ℕ) :
 topCenteredM41B d T i ≤ (2*(T:ℤ)+d+9)^2*topDeficitM41B d T i 2 := by
 rw [topCenteredM41B,topDeficitM41B,←top_linear_smulM55C]
 apply top_linear_monoM41B
 intro s hs
 have ht : (0:ℤ) ≤ T-s := by omega
 have hq : (0:ℤ) ≤ (T:ℤ)+s+d+9 := by positivity
 have hsq : ((T:ℤ)+s+d+9)^2 ≤ (2*(T:ℤ)+d+9)^2 := by
   apply (sq_le_sq₀ hq (by positivity)).mpr
   omega
 have hh := mul_le_mul_of_nonneg_right hsq
   (mul_nonneg (sq_nonneg ((T:ℤ)-s)) (top_kernel_nonnegM55C d i s))
 unfold topEigenM55C
 nlinarith only [hh]

theorem top_variance_deficitM41B (d T i : ℕ) :
 topVarianceNumerM55C d T i ≤
 (2*(T:ℤ)+d+9)^2*topMassM55C d T i*topDeficitM41B d T i 2 := by
 have h := mul_le_mul_of_nonneg_left (top_centered_boundM41B d T i) (top_mass_nonnegM55C d T i)
 rw [top_centered_identityM41B] at h
 unfold topVarianceNumerM55C
 nlinarith only [h,sq_nonneg (topEigenM55C d T*topMassM55C d T i-topMomentM55C d T i 1)]

theorem strong_drift_large_columnM41B (d i r : ℕ) (hi : 27 ≤ i) (hr : 3 ≤ r) :
 0 ≤ strongDriftM41B d (i+r) i := by
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
 have z := deficit_controlM41B (i:ℝ) (r:ℝ) (2*i+r+d+9)
   (topMassM55C d (i+r) i:ℝ) (topExcessM55C d (i+r) i:ℝ)
   (topVarianceNumerM55C d (i+r) i:ℝ) (topDeficitM41B d (i+r) i 1:ℝ)
   (topDeficitM41B d (i+r) i 2:ℝ)
   (by exact_mod_cast hi) (by exact_mod_cast hr) (by linarith)
   (by exact_mod_cast top_mass_nonnegM55C d (i+r) i)
   (by convert h1R using 1 <;> ring)
   (by unfold deficitSecondM41B; convert h2R using 1 <;> ring)
   (by convert hER using 1 <;> ring)
   (by convert hVR using 1 <;> ring)
 unfold strongDriftM41B
 have zz : (0:ℝ) ≤ (topExcessM55C d (i+r) i:ℝ)^2+
   ((i:ℝ)+1)*(2*i+d+10)*(topMassM55C d (i+r) i:ℝ)*(topExcessM55C d (i+r) i:ℝ)-
   ((i:ℝ)+1)*(topVarianceNumerM55C d (i+r) i:ℝ) := by
   convert z using 1 <;> ring
 exact_mod_cast zz

end
end MathGKM.Markov
