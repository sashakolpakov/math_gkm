import MathGKM.Target999b1e6ee47d74823a3b42bc
import MathGKM.LowDegreeSign
import Lean
def StudyInterface : MathGKM.Target999b1e6ee47d74823a3b42bc.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target999b1e6ee47d74823a3b42bc.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target999b1e6ee47d74823a3b42bc.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.LowDegree.quotient_coeff_eq_geom
  )
