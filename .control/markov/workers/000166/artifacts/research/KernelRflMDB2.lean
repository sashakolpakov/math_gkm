import Lean.Elab.Tactic.Decide
/-! Machine-authored db238071. This tactic proposes an ordinary reflexivity
term to mkAuxLemma. The kernel, not an external computation, checks conversion.
No new axiom, native evaluator, or oracle is used. -/
open Lean Meta Elab Tactic

elab "kernel_rfl_mdb2" : tactic => do
 closeMainGoalUsing `kernel_rfl_mdb2 fun expectedType _ => do
  let some (_, _, rhs) := expectedType.eq? | throwError "equality required"
  let pf ← mkEqRefl rhs
  let levelsInType := (collectLevelParams {} expectedType).params
  let lemmaLevels := (← Term.getLevelNames).reverse.filter levelsInType.contains
  let lemmaName ← withOptions (Elab.async.set · false) do
    mkAuxLemma lemmaLevels expectedType pf
  return mkConst lemmaName (lemmaLevels.map .param)

example : (123456789 : Nat) * 987654321 = 121932631112635269 := by kernel_rfl_mdb2
