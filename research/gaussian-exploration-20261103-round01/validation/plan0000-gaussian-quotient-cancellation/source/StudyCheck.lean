import MathGKM.Target70293b9cb1c6a5ccae6550bd
import MathGKM.Plan0000UnitLeadingTransport
import Lean
def StudyInterface : MathGKM.Target70293b9cb1c6a5ccae6550bd.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target70293b9cb1c6a5ccae6550bd.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target70293b9cb1c6a5ccae6550bd.Goal StudyInterface :=
  (
    MathGKM.Plan0000UnitLeadingTransport.quotient_cross_multiply
  )
