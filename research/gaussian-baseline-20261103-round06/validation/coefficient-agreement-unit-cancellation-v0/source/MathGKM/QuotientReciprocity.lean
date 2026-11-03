import MathGKM.Targete13e9693bc94b526e6f70e79
import Mathlib.Algebra.Polynomial.Reverse

noncomputable section
open scoped BigOperators
namespace MathGKM.GaussianQuotient.Reciprocity
open Polynomial
open MathGKM.GaussianQuotient
open MathGKM.GaussianQuotient.Integrality

/-- The common, nonzero reversal scalar cancels from a polynomial quotient. -/
theorem quotient_reverse_of_common_scalar (D N H : Polynomial ℚ) (c : ℚ)
    (hD : D ≠ 0) (hc : c ≠ 0)
    (hDr : D.reverse = C c * D) (hNr : N.reverse = C c * N)
    (hHD : H * D = N) : H.reverse = H := by
  apply mul_right_cancel₀ hD
  apply mul_left_cancel₀ (show C c ≠ (0 : Polynomial ℚ) by simpa using hc)
  calc
    C c * (H.reverse * D) = H.reverse * (C c * D) := by ring
    _ = H.reverse * D.reverse := by rw [hDr]
    _ = (H * D).reverse := (reverse_mul_of_domain H D).symm
    _ = N.reverse := by rw [hHD]
    _ = C c * N := hNr
    _ = C c * (H * D) := by rw [hHD]

theorem reverse_one_sub_X_pow (a : ℕ) (ha : 0 < a) :
    (1 - (X : Polynomial ℚ)^a).reverse = C (-1) * (1 - X^a) := by
  have hdeg : (1 - (X : Polynomial ℚ)^a).natDegree = a := by
    rw [natDegree_sub_eq_right_of_natDegree_lt (by simpa using ha)]
    simp
  rw [reverse, hdeg, reflect_sub, reflect_one, reflect_monomial, revAt_le le_rfl]
  simp

theorem reverse_S (m : ℕ) : (S m).reverse = C ((-1 : ℚ)^m) * S m := by
  induction m with
  | zero =>
    simpa only [S, Finset.range_zero, Finset.prod_empty, pow_zero, C_1, mul_one]
      using (reverse_C (1 : ℚ))
  | succ m ih =>
    have hs : S (m+1) = S m * (1 - (X : Polynomial ℚ)^(m+1)) := by
      simp only [S, Finset.prod_range_succ]
    rw [hs, reverse_mul_of_domain, ih, reverse_one_sub_X_pow (m+1) (by omega),
      show (-1 : ℚ)^(m+1) = (-1 : ℚ)^m * (-1) from pow_succ _ _, map_mul]
    ring

theorem reverse_S_pair (n j : ℕ) (hj : j ≤ n) :
    (S j * S (n-j)).reverse = C ((-1 : ℚ)^n) * (S j * S (n-j)) := by
  rw [reverse_mul_of_domain, reverse_S, reverse_S]
  have he : (-1 : ℚ)^n = (-1 : ℚ)^j * (-1 : ℚ)^(n-j) := by
    rw [← pow_add, Nat.add_sub_of_le hj]
  rw [he, map_mul]
  ring

/-- Reciprocity under exactly the two original polynomial-quotient premises. -/
theorem quotient_reverse (n k l : ℕ) (H : Polynomial ℚ)
    (hB : B n l ≠ 0) (hH : B n k = B n l * iota H) : H.reverse = H := by
  have hln : l ≤ n := by
    by_contra hn
    exact hB (by simp [B, hn])
  by_cases hkn : k ≤ n
  · have hcross : T n * (T l * T (n-l)) =
        (T n * iota H) * (T k * T (n-k)) := by
      simp only [B, if_pos hkn, if_pos hln] at hH
      rw [div_mul_eq_mul_div] at hH
      exact (div_eq_div_iff
        (mul_ne_zero (Matching.T_ne_zero k) (Matching.T_ne_zero (n-k)))
        (mul_ne_zero (Matching.T_ne_zero l) (Matching.T_ne_zero (n-l)))).mp hH
    have hcancel : iota H * (T k * T (n-k)) = T l * T (n-l) := by
      apply mul_left_cancel₀ (Matching.T_ne_zero n)
      simpa only [mul_assoc] using hcross.symm
    have hpoly : H * (S k * S (n-k)) = S l * S (n-l) := by
      apply Matching.iota_injective
      simpa only [map_mul, iota_S] using hcancel
    have hD : S k * S (n-k) ≠ 0 := by
      intro hz
      have hcoeff := congrArg (fun P : Polynomial ℚ => P.coeff 0) hz
      simpa [mul_coeff_zero, S_coeff_zero] using hcoeff
    exact quotient_reverse_of_common_scalar _ _ H ((-1 : ℚ)^n) hD
      (pow_ne_zero n (by norm_num)) (reverse_S_pair n k hkn)
      (reverse_S_pair n l hln) hpoly
  · have hi : iota H = 0 := by
      have hz : B n l * iota H = 0 := by simpa [B, hkn] using hH.symm
      exact (mul_eq_zero.mp hz).resolve_left hB
    have hzero : H = 0 := Matching.iota_injective (by simpa using hi)
    simp [hzero]

/-- The complete new sign obligation; it is not assumed anywhere in reciprocity. -/
def LowerHalfNonnegativity : Prop :=
  ∀ n k l : ℕ, ∀ H : Polynomial ℚ,
    B n l ≠ 0 → B n k = B n l * iota H →
    ∀ d : ℕ, 2*d ≤ H.natDegree → 0 ≤ H.coeff d

theorem coeff_reflection (n k l : ℕ) (H : Polynomial ℚ)
    (hB : B n l ≠ 0) (hH : B n k = B n l * iota H)
    (d : ℕ) (hd : d ≤ H.natDegree) :
    H.coeff d = H.coeff (H.natDegree-d) := by
  have hr := congrArg (fun P : Polynomial ℚ => P.coeff d)
    (quotient_reverse n k l H hB hH)
  rw [coeff_reverse, revAt_le hd] at hr
  exact hr.symm

/-- Targets the unchanged existing residual and retains the whole lower-half
statement as its antecedent. Zero and constant polynomials are included. -/
theorem nonnegativity_of_lower_half (hlower : LowerHalfNonnegativity) :
    MathGKM.Targete13e9693bc94b526e6f70e79.Residual0 := by
  intro n k l H hB hH d
  by_cases hzero : H = 0
  · simp [hzero]
  by_cases hconstant : H.natDegree = 0
  · by_cases hd : d = 0
    · subst d
      exact hlower n k l H hB hH 0 (by omega)
    · rw [coeff_eq_zero_of_natDegree_lt (by omega : H.natDegree < d)]
  by_cases hd : d ≤ H.natDegree
  · by_cases hhalf : 2*d ≤ H.natDegree
    · exact hlower n k l H hB hH d hhalf
    · have hmid : 2*(H.natDegree-d) ≤ H.natDegree := by omega
      rw [coeff_reflection n k l H hB hH d hd]
      exact hlower n k l H hB hH (H.natDegree-d) hmid
  · rw [coeff_eq_zero_of_natDegree_lt (by omega : H.natDegree < d)]

end MathGKM.GaussianQuotient.Reciprocity
