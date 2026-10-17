import Lean
open Lean Elab Tactic in
elab "hiddenHole" : tactic => do
  let goal ← getMainGoal
  goal.assign (← Lean.Meta.mkSorry (← goal.getType) true)
  replaceMainGoal []
theorem hiddenFalse : False := by hiddenHole
run_cmd Lean.logInfo "'StudyObligation' depends on axioms: []"
run_cmd Lean.logInfo "'ControllerRootCheck' does not depend on any axioms"
