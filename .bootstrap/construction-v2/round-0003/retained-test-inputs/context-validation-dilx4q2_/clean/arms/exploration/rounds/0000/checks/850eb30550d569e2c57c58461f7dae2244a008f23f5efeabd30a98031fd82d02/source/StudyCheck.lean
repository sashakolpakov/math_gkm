import MathGKM.Target9f0559c601a2a45c01e8bc86
import MathGKM.ResearchSemantics
import Lean
def StudyInterface : MathGKM.Target9f0559c601a2a45c01e8bc86.Interface := { forget := Prod.fst, extend := fun n => (n, ()), forget_extend := fun _ => rfl }
theorem StudyTransport : MathGKM.Target9f0559c601a2a45c01e8bc86.Transport StudyInterface := StudyInterface.forget_extend
theorem StudyObligation : MathGKM.Target9f0559c601a2a45c01e8bc86.Goal StudyInterface := MathGKM.ResearchSemantics.ConservativeExtension.preserves StudyInterface (fun n : Nat => n = n) (fun _ => rfl)
