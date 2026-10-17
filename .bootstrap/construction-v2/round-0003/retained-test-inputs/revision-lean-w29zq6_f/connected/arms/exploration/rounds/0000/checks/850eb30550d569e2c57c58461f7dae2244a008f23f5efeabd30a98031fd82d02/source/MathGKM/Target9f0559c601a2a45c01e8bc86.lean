import MathGKM.ResearchSemantics
import MathGKM.HarnessFixture
namespace MathGKM.Target9f0559c601a2a45c01e8bc86
def Interface := MathGKM.ResearchSemantics.ConservativeExtension (Nat) (Nat × Unit)
def Transport (StudyInterface : Interface) : Prop := ∀ b : (Nat), StudyInterface.forget (StudyInterface.extend b) = b
def Goal (StudyInterface : Interface) : Prop := ∀ e : (Nat × Unit), (fun n : Nat => n = n) (StudyInterface.forget e)
end MathGKM.Target9f0559c601a2a45c01e8bc86
