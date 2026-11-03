import MathGKM.LowDegreeSign
import MathGKM.GaussianQuotient
def MathGKM.Targetee7d759cf4d55624e993c69a.Interface :=
  (
    True
  )
def MathGKM.Targetee7d759cf4d55624e993c69a.Transport (StudyInterface : MathGKM.Targetee7d759cf4d55624e993c69a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetee7d759cf4d55624e993c69a.Goal (StudyInterface : MathGKM.Targetee7d759cf4d55624e993c69a.Interface) : Prop :=
  (
    ∀ (d : ℕ) (D P Q : Polynomial ℚ), D.coeff 0 = 1 → MathGKM.GaussianQuotient.LowDegree.Agree d (P*D) (Q*D) → MathGKM.GaussianQuotient.LowDegree.Agree d P Q
  )
