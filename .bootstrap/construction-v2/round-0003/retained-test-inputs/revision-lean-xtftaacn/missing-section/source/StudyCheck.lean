import MathGKM.Targetf1a37a5203672ea19b0109d9
import MathGKM.ResearchSemantics
import Lean
def StudyInterface : MathGKM.Targetf1a37a5203672ea19b0109d9.Interface := { forget := Prod.fst, extend := fun _ => (0, ()), forget_extend := fun _ => rfl }
theorem StudyTransport : MathGKM.Targetf1a37a5203672ea19b0109d9.Transport StudyInterface := StudyInterface.forget_extend
theorem StudyObligation : MathGKM.Targetf1a37a5203672ea19b0109d9.Goal StudyInterface := MathGKM.ResearchSemantics.ConservativeExtension.preserves StudyInterface (fun n : Nat => n = n) (fun _ => rfl)
