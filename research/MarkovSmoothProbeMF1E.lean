import Mathlib
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 200000
theorem smooth_probeMF1E (P : ℤ[X]) (n k : ℕ)
 (hP : ∀ r, 0 ≤ P.coeff r) :
 P.coeff k ≤ (((1+X)^n*P):ℤ[X]).coeff k := by
 rw [Polynomial.coeff_mul]
 have h := Finset.single_le_sum
   (f := fun z : ℕ×ℕ => ((1+(X:ℤ[X]))^n).coeff z.1*P.coeff z.2)
   (s := Finset.HasAntidiagonal.antidiagonal k) (a := (0,k))
   (fun z _ => mul_nonneg (by rw [Polynomial.coeff_one_add_X_pow]; positivity) (hP z.2))
   (by simp)
 simpa only [Polynomial.coeff_one_add_X_pow,Nat.choose_zero_right,Nat.cast_one,one_mul] using h


end
end MathGKM.Markov
