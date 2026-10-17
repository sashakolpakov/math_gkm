-- Machine-authored neutral mechanism fixture. Not a research-target result.
-- VALIDATION NOT YET RUN.
import Lean
namespace MathGKM.HarnessFixture
def Root : Prop := ∀ n : Nat, n = n
theorem identity (n : Nat) : n = n := rfl
end MathGKM.HarnessFixture
