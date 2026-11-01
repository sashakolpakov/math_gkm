import MathGKM.SeparatedResidualR0002
import MathGKM.GaussianQuotient
def MathGKM.Targetc4df071d1acda856f9857e5d.Interface :=
  (
    True
  )
def MathGKM.Targetc4df071d1acda856f9857e5d.Transport (StudyInterface : MathGKM.Targetc4df071d1acda856f9857e5d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetc4df071d1acda856f9857e5d.Goal (StudyInterface : MathGKM.Targetc4df071d1acda856f9857e5d.Interface) : Prop :=
  (
    MathGKM.GaussianQuotient.FullPositivity ↔ (∀ (a b r : ℕ) (H : Polynomial ℚ), a+r ≤ b → 3 ≤ r → MathGKM.GaussianQuotient.IntervalBridgeR0000.F a b r = MathGKM.GaussianQuotient.iota H → MathGKM.GaussianQuotient.NatCoeffs H)
  )
