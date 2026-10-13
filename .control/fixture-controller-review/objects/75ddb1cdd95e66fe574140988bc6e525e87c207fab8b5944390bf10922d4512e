-- Codex/Astra. Fixed generated validator; independent freeze still required.
import MathGKM.Gluing
import MathGKM.Protocol
import MathGKM.AgohExercise
import Lean

open Lean Elab Command in
run_cmd do
  let names := [``MathGKM.Gluing.square, ``MathGKM.Gluing.descend_left,
    ``MathGKM.Gluing.descend_right, ``MathGKM.Gluing.unique,
    ``MathGKM.Gluing.necessary, ``MathGKM.Gluing.conflicting_binding,
    ``MathGKM.Protocol.preserves_budget, ``MathGKM.Protocol.recorded_only_inflight,
    ``MathGKM.Protocol.no_replayed_claim,
    ``MathGKM.Agoh.eval_one, ``MathGKM.Agoh.first_order_factor,
    ``MathGKM.Agoh.clears_denominators, ``MathGKM.Agoh.denominator_at_one,
    ``MathGKM.Agoh.singular_counterexample, ``MathGKM.Agoh.zero_order, ``MathGKM.Agoh.missing_positive_n,
    ``MathGKM.Agoh.geometric_region_counterexample]
  for name in names do
    let info ← getConstInfo name
    let axs ← collectAxioms name
    for ax in axs do
      unless [``propext, ``Classical.choice, ``Quot.sound].contains ax do
        throwError "forbidden axiom {ax} in {name}"
    logInfo m!"DECLARATION {name}\nTYPE {info.type}\nAXIOMS {axs}"
    if let some value := info.value? (allowOpaque := true) then
      logInfo m!"DIRECT DEPENDENCIES {value.getUsedConstants}"
