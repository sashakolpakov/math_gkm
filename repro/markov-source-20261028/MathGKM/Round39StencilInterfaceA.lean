import MathGKM.Round39StencilA

/-! Machine-authored exact conditional stencil bundle, round39. -/
namespace Round39StencilInterfaceA
open MathGKM.Markov
open scoped BigOperators
theorem checked :
    (∀ (mid : Bool) (P Q : BiPoly) (i j dx dy t : ℤ),
      StateCrossR38.zcoeff (ShiftedR39.output mid P Q) (i+t*dx) (j+t*dy)=
        ∑ r : Fin 5, (ShiftedR39.weights mid r : ℤ)*ShiftedR39.f P Q i j dx dy r t) ∧
    (∀ P Q : BiPoly, ShiftedR39.Premises P Q →
      ShiftedR39.CoordLC (ShiftedR39.output true P Q) ∧
      ShiftedR39.CoordLC (ShiftedR39.output false P Q)) ∧
    (∀ k : ℕ,
      RightR30.M (k+1)=ShiftedR39.output true (RightR30.M k) (RightR30.G k) ∧
      RightR30.G (k+1)=ShiftedR39.output false (RightR30.M k) (RightR30.G k)) ∧
    (∀ k : ℕ, ShiftedR39.Premises (RightR30.M k) (RightR30.G k) →
      ShiftedR39.CoordLC (RightR30.M (k+1)) ∧ ShiftedR39.CoordLC (RightR30.G (k+1))) :=
  ⟨ShiftedR39.stencil,ShiftedR39.conditional_transfer,ShiftedR39.actual_step,
    ShiftedR39.actual_conditional⟩
end Round39StencilInterfaceA
#print axioms ShiftedR39.zshift
#print axioms ShiftedR39.conditional_transfer
#print axioms Round39StencilInterfaceA.checked
