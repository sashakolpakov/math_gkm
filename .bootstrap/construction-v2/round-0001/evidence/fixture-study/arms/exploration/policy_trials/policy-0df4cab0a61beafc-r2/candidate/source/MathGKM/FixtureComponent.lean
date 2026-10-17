import Lean
namespace FixtureComponent
def value (n : Nat) : Nat := n
theorem use (n : Nat) : value n = n := rfl
end FixtureComponent
