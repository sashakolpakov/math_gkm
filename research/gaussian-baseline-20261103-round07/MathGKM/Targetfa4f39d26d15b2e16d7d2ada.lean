import MathGKM.QuotientIntegrality
import MathGKM.GaussianQuotient
def MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Interface :=
  (
    True
  )
def MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Transport (StudyInterface : MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Goal (StudyInterface : MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Interface) : Prop :=
  (
    ∀ n k l : ℕ, ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → ∀ d : ℕ, ∃ z : ℤ, H.coeff d = (z : ℚ)
  )
