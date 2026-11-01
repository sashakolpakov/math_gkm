import MathGKM.Target5b937df8f25c060df43e0388
import MathGKM.IntervalBridgeR0000
import Lean
def StudyInterface : MathGKM.Target5b937df8f25c060df43e0388.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target5b937df8f25c060df43e0388.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target5b937df8f25c060df43e0388.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.IntervalBridgeR0000.interval_correspondence
  )
