import MathGKM.ContinuationObligations
import MathGKM.HarnessFixture
namespace MathGKM.Targetab207ffb7044b58f906eed00
def Interface := True
def Transport (StudyInterface : Interface) : Prop := True
def Goal (StudyInterface : Interface) : Prop := ∀ (sem : MathGKM.ContinuationObligations.WholeSemantics) (s : MathGKM.ContinuationObligations.State) (env : Nat → MathGKM.ContinuationObligations.Input) (n : Nat), sem.continue s env n = MathGKM.ContinuationObligations.run n s env
end MathGKM.Targetab207ffb7044b58f906eed00
