import MathGKM.Targetb2f9acbe28ebcb0330e6bfcb
import MathGKM.IndexNormalization
import Lean
def StudyInterface : MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Goal StudyInterface :=
  (
    MathGKM.GaussianQuotient.IndexNormalization.normalize
  )
