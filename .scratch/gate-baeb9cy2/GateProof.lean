-- Machine-generated closed AST, provisional boundary check.
import Lean
theorem accepted : (¬ False) := (fun h0 => h0)
open Lean Elab Command in
run_cmd do
  unless (← collectAxioms ``accepted).isEmpty do
    throwError "nonempty axiom dependencies"
