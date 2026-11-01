import MathGKM.Targetc4df071d1acda856f9857e5d
import MathGKM.SeparatedResidualR0002
import Lean
def StudyInterface : MathGKM.Targetc4df071d1acda856f9857e5d.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetc4df071d1acda856f9857e5d.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetc4df071d1acda856f9857e5d.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.SeparatedResidualR0002.full_iff_higher
  )
