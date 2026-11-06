import MathGKM.Round37MarginalA

/-! Machine-authored round37 exact generic marginalization wrapper.
This proposition is conditional on midpoint compatibility; it supplies no
unconditional Markov coefficient inequality. -/
namespace MidpointMarginalInterfaceR37
theorem marginalization : ∀ f g b : ℤ →₀ ℤ,
    MidpointMarginalR36.Compatible f g b →
    MidpointMarginalR36.mass f*MidpointMarginalR36.mass g ≤
      MidpointMarginalR36.mass b^2 := MidpointMarginalR37.marginalization
end MidpointMarginalInterfaceR37

#print axioms MidpointMarginalInterfaceR37.marginalization
