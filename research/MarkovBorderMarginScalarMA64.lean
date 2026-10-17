import MarkovBorderScalarMA64
import MarkovBorderRatioMA64
import MarkovQuantitativeCutMA64
/-! Machine-authored a646848d. Exact transport of the scalar border certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem border_kernel_scalar_rationalMA64 (j t : ℕ) (ht : 4 ≤ t) (hj : t+3 ≤ j) :
 (8*((j:ℚ)-t-2)/(t+1))*((j:ℚ)*(t+j+5)/(t+5))*(liftTermMAE9 j (t+1) 0:ℚ)^2 ≤
 (((t+1+j+3).choose j:ℚ)^2-((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ))*
   (liftTermMAE9 j (t+1) 1:ℚ) := by
 let B : ℚ := ((t+j+3).choose j:ℚ)
 let F : ℚ := B^2*j*(t+j+4)^2/((t+1)*(t+4)^3*(t+5)^3*(t+6)^2*(t+7))
 have hF : 0 ≤ F := by dsimp [F]; positivity
 have hs := border_scalar_nonnegMA64 t j B
   (by exact_mod_cast ht) (by exact_mod_cast hj) (base_choose_fiveMA64 j t (by omega))
 have hp := mul_nonneg hF hs
 rcases cut_kernel_valuesMFEE j t (by omega) with ⟨_,h10,h11,_,_⟩
 have h1 := base_choose_stepMFEE j t
 have h2 := base_choose_twoMFEE j t
 have he : (((t+1+j+3).choose j:ℚ)^2-
   ((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ))*(liftTermMAE9 j (t+1) 1:ℚ)-
   (8*((j:ℚ)-t-2)/(t+1))*((j:ℚ)*(t+j+5)/(t+5))*(liftTermMAE9 j (t+1) 0:ℚ)^2=
   F*borderScalarMA64 t j B := by
   rw [h10,h11,h1,h2]
   dsimp [F,B,borderScalarMA64,cutNext0MFEE,cutNext1MFEE,liftWeightMAE9,liftDenMAE9]
   field_simp
   <;> ring
 linarith

theorem border_kernel_scalarMA64 (j t : ℕ) (ht : 4 ≤ t) (hj : t+3 ≤ j) :
 perturbBoundMA64 j t*borderRatioMA64 j t*kernelScaleMA64 j t ≤
 topGapMA64 j t*(liftTermMAE9 j (t+1) 1:ℝ) := by
 unfold perturbBoundMA64 borderRatioMA64 kernelScaleMA64 topGapMA64
 rw [complete_coeffMA64]
 have he := (Rat.cast_le (K:=ℝ)).mpr (border_kernel_scalar_rationalMA64 j t ht hj)
 push_cast at he
 exact he

end
end MathGKM.Markov
