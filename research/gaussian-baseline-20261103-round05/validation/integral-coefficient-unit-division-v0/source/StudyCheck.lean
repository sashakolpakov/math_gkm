import MathGKM.Target9bcffed5f4c233c04d40d577
import MathGKM.QuotientIntegrality
import Lean
def StudyInterface : MathGKM.Target9bcffed5f4c233c04d40d577.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target9bcffed5f4c233c04d40d577.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target9bcffed5f4c233c04d40d577.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.Integrality.integral_of_mul
  )
