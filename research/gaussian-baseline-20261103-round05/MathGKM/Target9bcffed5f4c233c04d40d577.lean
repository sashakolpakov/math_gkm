import MathGKM.QuotientIntegrality
import MathGKM.GaussianQuotient
def MathGKM.Target9bcffed5f4c233c04d40d577.Interface :=
  (
    True
  )
def MathGKM.Target9bcffed5f4c233c04d40d577.Transport (StudyInterface : MathGKM.Target9bcffed5f4c233c04d40d577.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target9bcffed5f4c233c04d40d577.Goal (StudyInterface : MathGKM.Target9bcffed5f4c233c04d40d577.Interface) : Prop :=
  (
    ∀ D H : Polynomial ℚ, (∀ d : ℕ, ∃ z : ℤ, D.coeff d = (z : ℚ)) → (∀ d : ℕ, ∃ z : ℤ, (H * D).coeff d = (z : ℚ)) → D.coeff 0 = 1 → ∀ d : ℕ, ∃ z : ℤ, H.coeff d = (z : ℚ)
  )
