import MathGKM.Round39MixtureA

/-! Machine-authored exact proposal wrapper, round39. -/
namespace Round39MixtureInterfaceA
open scoped BigOperators
theorem checked : ∀ (ι : Type) (s : Finset ι) (f : ι → ℤ →₀ ℤ) (w : ι → ℕ),
    (∀ r ∈ s, ∀ x, 0 ≤ f r x) →
    (∀ r ∈ s, StateCrossR38.LC (f r)) →
    (∀ r ∈ s, ∀ q ∈ s, r ≠ q → StateCrossR38.Cross (f r) (f q)) →
    StateCrossR38.LC (fun x => ∑ r ∈ s, (w r : ℤ)*f r x) := by
  intro ι s f w
  exact ShiftedR39.finite_family s f w
end Round39MixtureInterfaceA
#print axioms ShiftedR39.family
#print axioms Round39MixtureInterfaceA.checked
