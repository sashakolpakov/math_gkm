import MathGKM.ContinuationObligations
import MathGKM.HarnessFixture
def MathGKM.Target94afe328af2b18eb1a5e06b9.Interface := True
def MathGKM.Target94afe328af2b18eb1a5e06b9.Transport (StudyInterface : MathGKM.Target94afe328af2b18eb1a5e06b9.Interface) : Prop := True
def MathGKM.Target94afe328af2b18eb1a5e06b9.Goal (StudyInterface : MathGKM.Target94afe328af2b18eb1a5e06b9.Interface) : Prop := ∀ (sem : MathGKM.ContinuationObligations.WholeSemantics) (s : MathGKM.ContinuationObligations.State) (env : Nat → MathGKM.ContinuationObligations.Input) (n : Nat), sem.trace s env n = MathGKM.ContinuationObligations.run n s env
