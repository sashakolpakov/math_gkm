import MathGKM.Plan0001FullIntegrality
import MathGKM.GaussianQuotient
def MathGKM.Targetcf9c8f40194ae37521a54e7c.Interface :=
  (
    True
  )
def MathGKM.Targetcf9c8f40194ae37521a54e7c.Transport (StudyInterface : MathGKM.Targetcf9c8f40194ae37521a54e7c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetcf9c8f40194ae37521a54e7c.Goal (StudyInterface : MathGKM.Targetcf9c8f40194ae37521a54e7c.Interface) : Prop :=
  (
    ∀ (n k l : ℕ) (H : Polynomial ℚ), MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → ∀ d : ℕ, ∃ z : ℤ, H.coeff d = (z : ℚ)
  )
