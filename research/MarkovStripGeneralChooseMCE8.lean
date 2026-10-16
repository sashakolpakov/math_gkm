import MarkovStripChooseMCE8
/-! Machine-authored ce882be3. Two-shift and cubic binomial corrections. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem strip_choose_correction_twoMCE8 (k l : ℕ) (hN : 5 ≤ k+l) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*(k+2)*
 ((k+l-5).choose (k+2):ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*(l-3)*(l-4)*(l-5)*(l-6) := by
 have h := strip_choose_correctionMCE8 k l hN
 have h1 := bc_lower6 (k+l-5) (k+1)
 unfold bc6 at h1
 push_cast [Nat.cast_sub hN] at h1
 linear_combination ((l:ℝ)-6)*h+
   ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*h1

theorem strip_choose_correction_threeMCE8 (k l : ℕ) (hN : 3 ≤ k+l) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+1)*((k+l-3).choose (k+1):ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*(l-3) := by
 have h := next_coeff_zero7955 k l hN
 rw [Polynomial.coeff_one_add_X_pow] at h
 have h1 := bc_lower6 (k+l-3) k
 unfold bc6 at h1
 push_cast [Nat.cast_sub hN] at h1
 linear_combination ((l:ℝ)-3)*h+((k:ℝ)+l)*(k+l-1)*(k+l-2)*h1
end
end MathGKM.Markov
