-- Machine-generated closed AST, provisional boundary check.
import Lean
theorem accepted : (∀ n0 : Nat, ((n0 : Nat) = n0)) := (fun h0 => rfl)
open Lean Elab Command in
run_cmd do
  unless (← collectAxioms ``accepted).isEmpty do
    throwError "nonempty axiom dependencies"
