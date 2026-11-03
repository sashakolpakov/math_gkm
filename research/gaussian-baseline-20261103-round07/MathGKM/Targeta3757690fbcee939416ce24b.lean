import MathGKM.IndexNormalization
import MathGKM.GaussianQuotient
def MathGKM.Targeta3757690fbcee939416ce24b.Interface :=
  (
    True
  )
def MathGKM.Targeta3757690fbcee939416ce24b.Transport (StudyInterface : MathGKM.Targeta3757690fbcee939416ce24b.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targeta3757690fbcee939416ce24b.Goal (StudyInterface : MathGKM.Targeta3757690fbcee939416ce24b.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), k ≤ n → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → H * (MathGKM.GaussianQuotient.Integrality.S k * MathGKM.GaussianQuotient.Integrality.S (n-k)) = MathGKM.GaussianQuotient.Integrality.S l * MathGKM.GaussianQuotient.Integrality.S (n-l)
  )
