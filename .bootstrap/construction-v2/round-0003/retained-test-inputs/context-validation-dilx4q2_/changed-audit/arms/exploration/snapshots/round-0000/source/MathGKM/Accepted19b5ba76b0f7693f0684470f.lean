import MathGKM.Target5cb68e7ec94706e91d3493ef
import MathGKM.ResearchSemantics
import Lean
def Accepted19b5ba76b0f7693f0684470f.interface : MathGKM.Target5cb68e7ec94706e91d3493ef.Interface := MathGKM.ResearchSemantics.pushLift (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (n : Nat) => n)
theorem Accepted19b5ba76b0f7693f0684470f.transport : MathGKM.Target5cb68e7ec94706e91d3493ef.Transport Accepted19b5ba76b0f7693f0684470f.interface := MathGKM.ResearchSemantics.push_beta (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (n : Nat) => n)
theorem Accepted19b5ba76b0f7693f0684470f.obligation : MathGKM.Target5cb68e7ec94706e91d3493ef.Goal Accepted19b5ba76b0f7693f0684470f.interface := MathGKM.ResearchSemantics.push_unique (f := (fun n : Nat => n)) (F := (fun _ : Nat => Nat)) (G := (fun _ : Nat => Nat)) (fun (_ : Nat) (n : Nat) => n)
