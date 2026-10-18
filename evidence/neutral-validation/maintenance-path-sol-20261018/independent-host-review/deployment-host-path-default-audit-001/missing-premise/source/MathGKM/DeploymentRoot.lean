import MathGKM.ResearchSemantics
namespace MathGKM.DeploymentRoot
def Root : Prop := ∀ n : Nat, n = n
theorem identity (n : Nat) : n = n := rfl
end MathGKM.DeploymentRoot
