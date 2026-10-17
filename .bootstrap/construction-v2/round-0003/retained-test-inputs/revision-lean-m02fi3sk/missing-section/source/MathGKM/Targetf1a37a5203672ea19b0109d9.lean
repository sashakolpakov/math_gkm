import MathGKM.ResearchSemantics
import MathGKM.HarnessFixture
def MathGKM.Targetf1a37a5203672ea19b0109d9.Interface := MathGKM.ResearchSemantics.ConservativeExtension (Nat) (Nat × Unit)
def MathGKM.Targetf1a37a5203672ea19b0109d9.Transport (StudyInterface : MathGKM.Targetf1a37a5203672ea19b0109d9.Interface) : Prop := ∀ b : (Nat), StudyInterface.forget (StudyInterface.extend b) = b
def MathGKM.Targetf1a37a5203672ea19b0109d9.Goal (StudyInterface : MathGKM.Targetf1a37a5203672ea19b0109d9.Interface) : Prop := ∀ e : (Nat × Unit), (fun n : Nat => n = n) (StudyInterface.forget e)
