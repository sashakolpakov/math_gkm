import MarkovTransposedKernelM657
/-! Machine-authored 6576ccc5. A termwise mixed-gap shortcut is false for
the new exact kernel, even though its complete gap coefficient is positive.
These are auxiliary kernel coefficients, not reversed source inequalities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000
set_option maxRecDepth 4096

def kernelCorrectionM657 (d k s : ℕ) (r : Bool) : ℝ[X] :=
 bandKernelM657 d k s r-liftPolyM7E2 (d+3*k+(if r then 3 else 2)) s

theorem transposed_mixed_negativeM657 :
 (2*liftPolyM7E2 5 4*kernelCorrectionM657 0 1 4 false-
   liftPolyM7E2 5 3*kernelCorrectionM657 0 1 5 false-
   kernelCorrectionM657 0 1 3 false*liftPolyM7E2 5 5).coeff 3 = -30888 := by
 simp only [kernelCorrectionM657,coeff_sub,coeff_mul,coeff_ofNat_mul,
   Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 norm_num [sum_range_succ,band_kernel_coeffM657,lift_poly_coeffM7E2,
   reverseLiftMAE9,liftTermMAE9,correctionTermM657,absorbedExtraM418]

theorem transposed_complete_positiveM657 :
 ((bandKernelM657 0 1 4 false)^2-
   bandKernelM657 0 1 3 false*bandKernelM657 0 1 5 false).coeff 3=87742248 := by
 simp only [pow_two,coeff_sub,coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 norm_num [sum_range_succ,band_kernel_coeffM657,lift_poly_coeffM7E2,
   reverseLiftMAE9,liftTermMAE9,correctionTermM657,absorbedExtraM418]

end
end MathGKM.Markov
