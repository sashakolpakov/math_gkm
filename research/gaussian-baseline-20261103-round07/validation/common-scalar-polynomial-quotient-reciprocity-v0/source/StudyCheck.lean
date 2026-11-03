import MathGKM.Targetd1b53a4b3e7ee2403f57a51b
import MathGKM.QuotientReciprocity
import Lean
def StudyInterface : MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetd1b53a4b3e7ee2403f57a51b.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.Reciprocity.quotient_reverse_of_common_scalar
  )
