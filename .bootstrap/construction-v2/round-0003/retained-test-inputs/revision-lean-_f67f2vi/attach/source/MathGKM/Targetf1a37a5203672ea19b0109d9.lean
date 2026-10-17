import MathGKM.ResearchSemantics
import MathGKM.HarnessFixture
namespace MathGKM.Targetf1a37a5203672ea19b0109d9
def Interface := MathGKM.ResearchSemantics.ConservativeExtension (Nat) (Nat × Unit)
def Transport (StudyInterface : Interface) : Prop := ∀ b : (Nat), StudyInterface.forget (StudyInterface.extend b) = b
def Goal (StudyInterface : Interface) : Prop := ∀ e : (Nat × Unit), (fun n : Nat => n = n) (StudyInterface.forget e)
end MathGKM.Targetf1a37a5203672ea19b0109d9
