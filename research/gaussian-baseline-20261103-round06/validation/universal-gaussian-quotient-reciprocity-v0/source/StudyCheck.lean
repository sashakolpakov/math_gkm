import MathGKM.Target2fdf850f377242b7e261ad69
import MathGKM.QuotientReciprocity
import Lean
def StudyInterface : MathGKM.Target2fdf850f377242b7e261ad69.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target2fdf850f377242b7e261ad69.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target2fdf850f377242b7e261ad69.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.Reciprocity.quotient_reverse
  )
