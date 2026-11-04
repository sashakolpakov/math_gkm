import MathGKM.Plan0000UnitLeadingTransport

/-! Full arithmetic consequence, with the original two premises and all indices. -/

set_option autoImplicit false
noncomputable section

namespace MathGKM.Plan0001FullIntegrality

open Polynomial MathGKM.GaussianQuotient MathGKM.Plan0000UnitLeadingTransport

theorem full_integrality :
    ∀ (n k l : ℕ) (H : Polynomial ℚ),
      B n l ≠ 0 → B n k = B n l * iota H →
      ∀ d : ℕ, ∃ z : ℤ, H.coeff d = (z : ℚ) := by
  intro n k l H hl he
  have hln : l ≤ n := (B_ne_zero_iff n l).1 hl
  by_cases hk : k ≤ n
  · obtain ⟨K, hK⟩ := fraction_field_integer_lift
      (intT l * intT (n - l)) (intT k * intT (n - k)) H
      (intT_mul_unit_leading k (n - k))
      (quotient_cross_multiply n k l H hk hln he)
    intro d
    refine ⟨K.coeff d, ?_⟩
    simp [hK]
  · have hz : B n k = 0 := by simp [B, hk]
    have hi : iota H = 0 := (mul_eq_zero.mp (he.symm.trans hz)).resolve_left hl
    have hH : H = 0 := iota_injective (by simpa using hi)
    intro d
    exact ⟨0, by simp [hH]⟩

end MathGKM.Plan0001FullIntegrality
