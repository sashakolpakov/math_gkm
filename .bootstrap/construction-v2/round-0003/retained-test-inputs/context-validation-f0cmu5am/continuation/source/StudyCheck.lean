import MathGKM.Targetab207ffb7044b58f906eed00
import MathGKM.ContinuationObligations
import Lean
def StudyInterface : MathGKM.Targetab207ffb7044b58f906eed00.Interface := True.intro
theorem StudyTransport : MathGKM.Targetab207ffb7044b58f906eed00.Transport StudyInterface := True.intro
theorem StudyObligation : MathGKM.Targetab207ffb7044b58f906eed00.Goal StudyInterface := MathGKM.ContinuationObligations.continuation_eq_run
