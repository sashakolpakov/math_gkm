import MathGKM.Target0104442e9dc16b0584931459
import MathGKM.LowDegreeSign
import Lean
def StudyInterface : MathGKM.Target0104442e9dc16b0584931459.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target0104442e9dc16b0584931459.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target0104442e9dc16b0584931459.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.LowDegree.quotient_coeff_nat
  )
