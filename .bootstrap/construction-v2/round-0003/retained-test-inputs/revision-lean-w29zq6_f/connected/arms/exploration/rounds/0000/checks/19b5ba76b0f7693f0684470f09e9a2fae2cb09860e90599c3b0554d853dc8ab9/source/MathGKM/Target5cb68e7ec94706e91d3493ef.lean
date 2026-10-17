import MathGKM.ResearchSemantics
import MathGKM.HarnessFixture
namespace MathGKM.Target5cb68e7ec94706e91d3493ef
def Interface := ∀ j : (Nat), MathGKM.ResearchSemantics.Push (fun n : Nat => n) (fun _ : Nat => Nat) j → (fun _ : Nat => Nat) j
def Transport (StudyInterface : Interface) : Prop := ∀ (i : (Nat)) (x : (fun _ : Nat => Nat) i), StudyInterface ((fun n : Nat => n) i) (MathGKM.ResearchSemantics.pushUnit (fun n : Nat => n) (fun _ : Nat => Nat) i x) = (fun (_ : Nat) (n : Nat) => n) i x
def Goal (StudyInterface : Interface) : Prop := ∀ k : (∀ j : (Nat), MathGKM.ResearchSemantics.Push (fun n : Nat => n) (fun _ : Nat => Nat) j → (fun _ : Nat => Nat) j), (∀ (i : (Nat)) (x : (fun _ : Nat => Nat) i), k ((fun n : Nat => n) i) (MathGKM.ResearchSemantics.pushUnit (fun n : Nat => n) (fun _ : Nat => Nat) i x) = (fun (_ : Nat) (n : Nat) => n) i x) → k = StudyInterface
end MathGKM.Target5cb68e7ec94706e91d3493ef
