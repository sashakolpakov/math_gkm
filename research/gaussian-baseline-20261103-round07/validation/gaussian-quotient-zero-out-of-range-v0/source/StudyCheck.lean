import MathGKM.Target7149dd16fa1a0e0f9941cd7d
import MathGKM.IndexNormalization
import Lean
def StudyInterface : MathGKM.Target7149dd16fa1a0e0f9941cd7d.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target7149dd16fa1a0e0f9941cd7d.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target7149dd16fa1a0e0f9941cd7d.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.IndexNormalization.quotient_zero_out_of_range
  )
