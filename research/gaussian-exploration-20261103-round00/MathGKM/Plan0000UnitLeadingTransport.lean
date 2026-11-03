import MathGKM.Plan0000UnitLeading
import MathGKM.GaussianQuotient
import Mathlib.Algebra.Polynomial.BigOperators

/-! Arithmetic bridge ingredients for the unchanged Gaussian definitions. -/

noncomputable section

namespace MathGKM.Plan0000UnitLeadingTransport

open Polynomial MathGKM.GaussianQuotient

/-- Integer polynomial model of the protected factorial product. -/
def intT (m : ℕ) : Polynomial ℤ :=
  ∏ i ∈ Finset.range m, (1 - X ^ (i + 1))

theorem factor_leadingCoeff (j : ℕ) :
    (1 - X ^ (j + 1) : Polynomial ℤ).leadingCoeff = -1 := by
  have hm : (X ^ (j + 1) - 1 : Polynomial ℤ).Monic := by
    simpa using Polynomial.monic_X_pow_sub_C (1 : ℤ) (Nat.succ_ne_zero j)
  have he : (1 - X ^ (j + 1) : Polynomial ℤ) = -(X ^ (j + 1) - 1) := by ring
  rw [he, Polynomial.leadingCoeff_neg, hm.leadingCoeff]

theorem intT_leadingCoeff (m : ℕ) : (intT m).leadingCoeff = (-1 : ℤ) ^ m := by
  simp [intT, Polynomial.leadingCoeff_prod, factor_leadingCoeff]

theorem intT_unit_leading (m : ℕ) :
    (intT m).leadingCoeff = 1 ∨ (intT m).leadingCoeff = -1 := by
  rw [intT_leadingCoeff]
  exact neg_one_pow_eq_or ℤ m

theorem intT_ne_zero (m : ℕ) : intT m ≠ 0 := by
  intro hz
  have hc := intT_leadingCoeff m
  rw [hz, Polynomial.leadingCoeff_zero] at hc
  exact (pow_ne_zero m (by norm_num : (-1 : ℤ) ≠ 0)) hc.symm

theorem iota_injective : Function.Injective iota :=
  RatFunc.algebraMap_injective ℚ

theorem iota_intT (m : ℕ) : iota ((intT m).map (Int.castRingHom ℚ)) = T m := by
  simp [intT, T, q, Polynomial.map_prod, map_prod, Polynomial.map_sub,
    Polynomial.map_pow, Polynomial.map_X]

theorem T_ne_zero (m : ℕ) : T m ≠ 0 := by
  rw [← iota_intT]
  apply (map_ne_zero_iff iota iota_injective).2
  exact fun hz => intT_ne_zero m
    (Polynomial.map_injective (Int.castRingHom ℚ) Int.cast_injective
      (by simpa using hz))

theorem fraction_field_integer_lift (P Q : Polynomial ℤ) (H : Polynomial ℚ)
    (hQ : Q.leadingCoeff = 1 ∨ Q.leadingCoeff = -1)
    (he : iota (P.map (Int.castRingHom ℚ)) =
      iota (Q.map (Int.castRingHom ℚ)) * iota H) :
    ∃ K : Polynomial ℤ, H = K.map (Int.castRingHom ℚ) := by
  apply MathGKM.Plan0000UnitLeading.unit_leading_integer_lift P Q H hQ
  apply iota_injective
  simpa using he

theorem intT_mul_unit_leading (a b : ℕ) :
    (intT a * intT b).leadingCoeff = 1 ∨
      (intT a * intT b).leadingCoeff = -1 := by
  rw [Polynomial.leadingCoeff_mul, intT_leadingCoeff, intT_leadingCoeff,
    ← pow_add]
  exact neg_one_pow_eq_or ℤ (a + b)

theorem B_ne_zero_iff (n k : ℕ) : B n k ≠ 0 ↔ k ≤ n := by
  by_cases hk : k ≤ n
  · simp [B, hk, T_ne_zero]
  · simp [B, hk]

/-- Exact cancellation bridge, only in the range where both factorial formulas apply. -/
theorem quotient_cross_multiply (n k l : ℕ) (H : Polynomial ℚ)
    (hk : k ≤ n) (hl : l ≤ n)
    (he : B n k = B n l * iota H) :
    iota (((intT l * intT (n - l))).map (Int.castRingHom ℚ)) =
      iota (((intT k * intT (n - k))).map (Int.castRingHom ℚ)) * iota H := by
  simp only [Polynomial.map_mul, map_mul, iota_intT]
  simp only [B, if_pos hk, if_pos hl] at he
  have hn := T_ne_zero n
  have hk0 := T_ne_zero k
  have hnk0 := T_ne_zero (n - k)
  have hl0 := T_ne_zero l
  have hnl0 := T_ne_zero (n - l)
  field_simp at he
  exact he

end MathGKM.Plan0000UnitLeadingTransport
