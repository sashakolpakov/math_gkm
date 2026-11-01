import MathGKM.Target5cca97da915770ba864fe568
import MathGKM.IntervalBridgeR0000
import Lean
def StudyInterface : MathGKM.Target5cca97da915770ba864fe568.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target5cca97da915770ba864fe568.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target5cca97da915770ba864fe568.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.IntervalBridgeR0000.boundary_transport
  )
