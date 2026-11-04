import MathGKM.Plan0007QIntegerClassification
import MathGKM.Plan0006AdjacentRecovery

set_option autoImplicit false
noncomputable section

namespace MathGKM.Plan0007AdjacentClassification

open Polynomial MathGKM.GaussianQuotient
open MathGKM.Plan0000UnitLeadingTransport
open MathGKM.Plan0006AdjacentRecovery
open MathGKM.Plan0007QIntegerClassification

theorem adjacent_classification :
    ∀ (n l : ℕ) (H : Polynomial ℚ),
      B n l ≠ 0 → B n (l + 1) = B n l * iota H →
      (l + 1) ∣ (n - l) ∧
      H = ∑ j ∈ Finset.range ((n - l) / (l + 1)),
        (Polynomial.X : Polynomial ℚ) ^ ((l + 1) * j) := by
  intro n l H hl he
  have hln : l ≤ n := (B_ne_zero_iff n l).1 hl
  by_cases hlt : l < n
  · exact qinteger_classification (n-l) (l+1) H (by omega)
      (adjacent_qinteger_identity n l H hlt he)
  · have hn : n = l := by omega
    have hz : B n (l+1) = 0 := by simp [B, hn]
    have hi : iota H = 0 := (mul_eq_zero.mp (he.symm.trans hz)).resolve_left hl
    have hH : H = 0 := iota_injective (by simpa using hi)
    simp [hn, hH]

end MathGKM.Plan0007AdjacentClassification
