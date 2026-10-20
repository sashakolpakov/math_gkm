-- Machine-authored dependency audit. Output is evidence, not a trust axiom.
import MathGKM
import Lean

open Lean Elab Command in
run_cmd do
  let names := [``MathGKM.attachment_conservative, ``MathGKM.sequential_extension,
    ``MathGKM.inconsistent_attachment, ``MathGKM.transport,
    ``MathGKM.collision_obstruction, ``MathGKM.lossy_bool,
    ``MathGKM.Machine.dispatch_state, ``MathGKM.Machine.dispatch_cost,
    ``MathGKM.Machine.continuation_preserves, ``MathGKM.Machine.continuation_cost,
    ``MathGKM.Machine.concrete_switch, ``MathGKM.Machine.overhead_removes_gain,
    ``MathGKM.Machine.deadline_counterexample,
    ``MathGKM.Machine.frozen_incumbent_counterexample,
    ``MathGKM.Machine.time_dependent_response_counterexample]
  for name in names do
    let info ← getConstInfo name
    let axs ← collectAxioms name
    for ax in axs do
      unless [``propext, ``Classical.choice, ``Quot.sound].contains ax do
        throwError "forbidden axiom {ax} in {name}"
    logInfo m!"DECLARATION {name}\nTYPE {info.type}"
    if let some value := info.value? (allowOpaque := true) then
      logInfo m!"DIRECT PROOF DEPENDENCIES {value.getUsedConstants}"

#print axioms MathGKM.attachment_conservative
#print axioms MathGKM.sequential_extension
#print axioms MathGKM.inconsistent_attachment
#print axioms MathGKM.transport
#print axioms MathGKM.collision_obstruction
#print axioms MathGKM.lossy_bool
#print axioms MathGKM.Machine.dispatch_state
#print axioms MathGKM.Machine.dispatch_cost
#print axioms MathGKM.Machine.continuation_preserves
#print axioms MathGKM.Machine.continuation_cost
#print axioms MathGKM.Machine.concrete_switch
#print axioms MathGKM.Machine.overhead_removes_gain
#print axioms MathGKM.Machine.deadline_counterexample
#print axioms MathGKM.Machine.frozen_incumbent_counterexample
#print axioms MathGKM.Machine.time_dependent_response_counterexample
