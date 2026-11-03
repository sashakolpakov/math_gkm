import MathGKM.Target7f02c13d60d04e5f47d4377b
import MathGKM.IndexNormalization
import Lean
def StudyInterface : MathGKM.Target7f02c13d60d04e5f47d4377b.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target7f02c13d60d04e5f47d4377b.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target7f02c13d60d04e5f47d4377b.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.IndexNormalization.B_symm
  )
