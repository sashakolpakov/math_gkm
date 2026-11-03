import MathGKM.Targetb813d299f003eeaf015fdd49
import MathGKM.QuotientReciprocity
import Lean
def StudyInterface : MathGKM.Targetb813d299f003eeaf015fdd49.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetb813d299f003eeaf015fdd49.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetb813d299f003eeaf015fdd49.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.Reciprocity.nonnegativity_of_lower_half
  )
