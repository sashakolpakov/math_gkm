import MathGKM.IntervalBridgeR0000
import MathGKM.GaussianQuotient
def MathGKM.Target5cca97da915770ba864fe568.Interface :=
  (
    True
  )
def MathGKM.Target5cca97da915770ba864fe568.Transport (StudyInterface : MathGKM.Target5cca97da915770ba864fe568.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5cca97da915770ba864fe568.Goal (StudyInterface : MathGKM.Target5cca97da915770ba864fe568.Interface) : Prop :=
  (
    ∀ (n k l : ℕ) (H : Polynomial ℚ), MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → (n < k ∨ k = l ∨ (l ≤ n ∧ k = n-l)) → MathGKM.GaussianQuotient.NatCoeffs H
  )
