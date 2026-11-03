import MathGKM.Targeta3757690fbcee939416ce24b
import MathGKM.IndexNormalization
import Lean
def StudyInterface : MathGKM.Targeta3757690fbcee939416ce24b.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targeta3757690fbcee939416ce24b.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targeta3757690fbcee939416ce24b.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.IndexNormalization.quotient_product
  )
