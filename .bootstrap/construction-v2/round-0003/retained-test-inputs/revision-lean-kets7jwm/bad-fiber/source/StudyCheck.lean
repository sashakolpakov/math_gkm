import MathGKM.Target3366e9579a34aa13a3097d8d
import MathGKM.ResearchSemantics
import Lean
def StudyInterface : MathGKM.Target3366e9579a34aa13a3097d8d.Interface := MathGKM.ResearchSemantics.pushLift (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (_ : Nat) => True.intro)
theorem StudyTransport : MathGKM.Target3366e9579a34aa13a3097d8d.Transport StudyInterface := MathGKM.ResearchSemantics.push_beta (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (_ : Nat) => True.intro)
theorem StudyObligation : MathGKM.Target3366e9579a34aa13a3097d8d.Goal StudyInterface := MathGKM.ResearchSemantics.push_unique (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (_ : Nat) => True.intro)
