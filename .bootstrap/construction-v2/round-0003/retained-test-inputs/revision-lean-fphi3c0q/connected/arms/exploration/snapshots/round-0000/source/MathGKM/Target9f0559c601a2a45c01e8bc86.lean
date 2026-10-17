import MathGKM.ResearchSemantics
import MathGKM.HarnessFixture
def MathGKM.Target9f0559c601a2a45c01e8bc86.Interface := MathGKM.ResearchSemantics.ConservativeExtension (Nat) (Nat × Unit)
def MathGKM.Target9f0559c601a2a45c01e8bc86.Transport (StudyInterface : MathGKM.Target9f0559c601a2a45c01e8bc86.Interface) : Prop := ∀ b : (Nat), StudyInterface.forget (StudyInterface.extend b) = b
def MathGKM.Target9f0559c601a2a45c01e8bc86.Goal (StudyInterface : MathGKM.Target9f0559c601a2a45c01e8bc86.Interface) : Prop := ∀ e : (Nat × Unit), (fun n : Nat => n = n) (StudyInterface.forget e)
