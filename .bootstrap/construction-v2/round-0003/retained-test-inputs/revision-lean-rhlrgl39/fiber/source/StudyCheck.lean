import MathGKM.Target7b3f400027b237a9d5afad71
import MathGKM.ResearchSemantics
import Lean
def StudyInterface : MathGKM.Target7b3f400027b237a9d5afad71.Interface := MathGKM.ResearchSemantics.pushLift (fun (_ : Nat) (n : Nat) => n)
theorem StudyTransport : MathGKM.Target7b3f400027b237a9d5afad71.Transport StudyInterface := MathGKM.ResearchSemantics.push_beta (fun (_ : Nat) (n : Nat) => n)
theorem StudyObligation : MathGKM.Target7b3f400027b237a9d5afad71.Goal StudyInterface := MathGKM.ResearchSemantics.push_unique (fun (_ : Nat) (n : Nat) => n)
