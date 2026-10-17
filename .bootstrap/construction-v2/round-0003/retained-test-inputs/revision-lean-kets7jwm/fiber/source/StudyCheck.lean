import MathGKM.Target7b3f400027b237a9d5afad71
import MathGKM.ResearchSemantics
import Lean
def StudyInterface : MathGKM.Target7b3f400027b237a9d5afad71.Interface := MathGKM.ResearchSemantics.pushLift (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (n : Nat) => n)
theorem StudyTransport : MathGKM.Target7b3f400027b237a9d5afad71.Transport StudyInterface := MathGKM.ResearchSemantics.push_beta (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (n : Nat) => n)
theorem StudyObligation : MathGKM.Target7b3f400027b237a9d5afad71.Goal StudyInterface := MathGKM.ResearchSemantics.push_unique (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (n : Nat) => n)
