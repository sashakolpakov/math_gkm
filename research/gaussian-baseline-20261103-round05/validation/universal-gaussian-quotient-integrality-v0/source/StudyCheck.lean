import MathGKM.Targetfa4f39d26d15b2e16d7d2ada
import MathGKM.QuotientIntegrality
import Lean
def StudyInterface : MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetfa4f39d26d15b2e16d7d2ada.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.Integrality.quotient_integral
  )
