import MathGKM.IndexNormalization
import MathGKM.GaussianQuotient
def MathGKM.Target7149dd16fa1a0e0f9941cd7d.Interface :=
  (
    True
  )
def MathGKM.Target7149dd16fa1a0e0f9941cd7d.Transport (StudyInterface : MathGKM.Target7149dd16fa1a0e0f9941cd7d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target7149dd16fa1a0e0f9941cd7d.Goal (StudyInterface : MathGKM.Target7149dd16fa1a0e0f9941cd7d.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), n < k → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → H = 0
  )
