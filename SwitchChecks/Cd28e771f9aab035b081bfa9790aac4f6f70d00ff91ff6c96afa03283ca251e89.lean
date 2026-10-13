-- Machine-generated concrete model certificate; Codex/Astra.
import MathGKM.Machine
import Lean
open MathGKM.Machine
theorem model_switch : ∀ (s : State) (env : Nat → Input),
    (run 8 .candidate s env).state = (run 8 .reference s env).state ∧
    3 + (run 8 .candidate s env).cost <
      (run 8 .reference s env).cost := by
  intro s env
  exact concrete_switch 8 3 s env (by decide)
#print axioms model_switch
open Lean Elab Command in
run_cmd do
  for ax in (← collectAxioms ``model_switch) do
    unless [``propext, ``Classical.choice, ``Quot.sound].contains ax do
      throwError "forbidden axiom in model certificate"
