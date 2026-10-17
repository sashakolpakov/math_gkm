import MathGKM.Target5cb68e7ec94706e91d3493ef
import MathGKM.ResearchSemantics
import Lean
def StudyInterface : MathGKM.Target5cb68e7ec94706e91d3493ef.Interface := MathGKM.ResearchSemantics.pushLift (fun (_ : Nat) (n : Nat) => n)
theorem StudyTransport : MathGKM.Target5cb68e7ec94706e91d3493ef.Transport StudyInterface := MathGKM.ResearchSemantics.push_beta (fun (_ : Nat) (n : Nat) => n)
theorem StudyObligation : MathGKM.Target5cb68e7ec94706e91d3493ef.Goal StudyInterface := MathGKM.ResearchSemantics.push_unique (fun (_ : Nat) (n : Nat) => n)
