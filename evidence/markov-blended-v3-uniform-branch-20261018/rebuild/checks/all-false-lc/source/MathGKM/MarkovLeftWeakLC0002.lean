import MathGKM.MarkovLeftFormulaLC0002
import MathGKM.Accepted95a4e0482c798d7a5531cd05

/-! Machine-authored round-0002 restricted consequence. The accepted export
and its complete source dependency closure were freshly rebuilt this round.
This is not full rational coverage or a proof of Conjecture63. -/
namespace MathGKM.Markov.LeftBranch0001

theorem restricted_weakLC : RestrictedWeakLC :=
  coefficient_targets_suffice coefficient_bridge formula_weakLC

theorem all_false_weakLC :
    ∀ k : ℕ, let m := (frame (List.replicate k false)).mid; WeakLC m.a m.b m.p := by
  intro k
  have h := Accepted95a4e0482c798d7a5531cd05.obligation k
  change WeakLC (frame (List.replicate k false)).mid.a
    (frame (List.replicate k false)).mid.b (frame (List.replicate k false)).mid.p
  rw [h.1, h.2.1, h.2.2]
  exact restricted_weakLC (k+2) (by omega)

#print axioms restricted_weakLC
#print axioms all_false_weakLC
end MathGKM.Markov.LeftBranch0001
