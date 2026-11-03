import MathGKM.Target583c980af89cca9b8a1681a7
import MathGKM.MatchingSufficiency
import Lean
def StudyInterface : MathGKM.Target583c980af89cca9b8a1681a7.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target583c980af89cca9b8a1681a7.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target583c980af89cca9b8a1681a7.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.Matching.matching_certificate
  )
