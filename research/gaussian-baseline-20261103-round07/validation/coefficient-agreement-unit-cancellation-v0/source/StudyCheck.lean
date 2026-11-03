import MathGKM.Targetee7d759cf4d55624e993c69a
import MathGKM.LowDegreeSign
import Lean
def StudyInterface : MathGKM.Targetee7d759cf4d55624e993c69a.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetee7d759cf4d55624e993c69a.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetee7d759cf4d55624e993c69a.Goal StudyInterface :=
  (
    fun d D P Q => @MathGKM.GaussianQuotient.LowDegree.agree_cancel d D P Q
  )
