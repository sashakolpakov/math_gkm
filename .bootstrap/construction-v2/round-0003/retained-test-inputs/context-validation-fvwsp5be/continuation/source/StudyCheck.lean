import MathGKM.Target94afe328af2b18eb1a5e06b9
import MathGKM.ContinuationObligations
import Lean
def StudyInterface : MathGKM.Target94afe328af2b18eb1a5e06b9.Interface := True.intro
theorem StudyTransport : MathGKM.Target94afe328af2b18eb1a5e06b9.Transport StudyInterface := True.intro
theorem StudyObligation : MathGKM.Target94afe328af2b18eb1a5e06b9.Goal StudyInterface := MathGKM.ContinuationObligations.continuation_eq_run
