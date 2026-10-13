-- Machine-generated closed AST, provisional boundary check.
import Lean
theorem accepted : True := True.intro
open Lean Elab Command in
run_cmd do
  unless (← collectAxioms ``accepted).isEmpty do
    throwError "nonempty axiom dependencies"
