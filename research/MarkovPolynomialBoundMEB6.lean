import Mathlib
/-! Machine-authored eb6a9001. An explicit rational coefficient bound.
Only negative coefficients enter the threshold; evaluation stays exact. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def negativeMassMEB6 (P : Polynomial ℚ) : ℚ :=
 ∑ k ∈ range P.natDegree, max 0 (-P.coeff k)

def positiveThresholdMEB6 (P : Polynomial ℚ) : ℕ :=
 Nat.ceil (negativeMassMEB6 P/P.leadingCoeff)+1

theorem polynomial_positive_afterMEB6 (P : Polynomial ℚ)
 (hP : 0 < P.leadingCoeff) (n : ℕ) (hn : positiveThresholdMEB6 P ≤ n) :
 0 < P.eval (n:ℚ) := by
 have hn1 : 1 ≤ n := by unfold positiveThresholdMEB6 at hn; omega
 have hx : (1:ℚ) ≤ n := by exact_mod_cast hn1
 have hx0 : (0:ℚ) < n := lt_of_lt_of_le zero_lt_one hx
 have hceil := Nat.le_ceil (negativeMassMEB6 P/P.leadingCoeff)
 have hcast : ((Nat.ceil (negativeMassMEB6 P/P.leadingCoeff):ℕ):ℚ)+1 ≤ n := by
   exact_mod_cast hn
 have hratio : negativeMassMEB6 P/P.leadingCoeff < (n:ℚ) := by linarith
 have hdom : negativeMassMEB6 P < (n:ℚ)*P.leadingCoeff := (div_lt_iff₀ hP).mp hratio
 by_cases hd : P.natDegree=0
 · rw [eq_C_of_natDegree_eq_zero hd,eval_C]
   simpa [leadingCoeff,hd] using hP
 · have hdegree : P.natDegree-1+1=P.natDegree := by omega
   have hsum : -(negativeMassMEB6 P*(n:ℚ)^(P.natDegree-1)) ≤
     ∑ k ∈ range P.natDegree, P.coeff k*(n:ℚ)^k := by
     rw [negativeMassMEB6,sum_mul,←sum_neg_distrib]
     apply sum_le_sum
     intro k hk
     have hk' : k ≤ P.natDegree-1 := by have := mem_range.mp hk; omega
     have hp : (n:ℚ)^k ≤ (n:ℚ)^(P.natDegree-1) := pow_le_pow_right₀ hx hk'
     have hm : 0 ≤ max 0 (-P.coeff k) := le_max_left _ _
     have hc : -P.coeff k ≤ max 0 (-P.coeff k) := le_max_right _ _
     have h1 := mul_le_mul_of_nonneg_left hp hm
     have h2 := mul_le_mul_of_nonneg_right hc (pow_nonneg hx0.le k)
     nlinarith
   have hpoweq : (n:ℚ)^P.natDegree=(n:ℚ)^(P.natDegree-1)*n := by
     conv_lhs => rw [←hdegree,pow_succ]
   rw [eval_eq_sum_range,sum_range_succ,coeff_natDegree,hpoweq]
   have hpow : 0 < (n:ℚ)^(P.natDegree-1) := pow_pos hx0 _
   have hh := mul_pos hpow (sub_pos.mpr hdom)
   nlinarith

end
end MathGKM.Markov
