import MathGKM.Round38MixtureA

/-! Machine-authored exact round38 wrapper. Independent admission pending. -/
namespace Round38MixtureInterfaceA
theorem checked :
  ∀ (a b : ℤ →₀ ℤ) (α β : ℕ),
  (∀ x, 0 ≤ a x) → (∀ x, 0 ≤ b x) →
  (∀ x, a x*a (x+2) ≤ a (x+1)^2) →
  (∀ x, b x*b (x+2) ≤ b (x+1)^2) →
  (∀ x, a x*b (x+2) ≤ a (x+1)*b (x+1) ∧
    b x*a (x+2) ≤ a (x+1)*b (x+1)) →
  ∀ x, ((α : ℤ)*a x+(β : ℤ)*b x)*((α : ℤ)*a (x+2)+(β : ℤ)*b (x+2)) ≤
    ((α : ℤ)*a (x+1)+(β : ℤ)*b (x+1))^2 :=
  StateCrossR38.finite_mixture
end Round38MixtureInterfaceA

#print axioms Round38MixtureInterfaceA.checked
