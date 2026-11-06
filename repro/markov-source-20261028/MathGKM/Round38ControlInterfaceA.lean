import MathGKM.Round38ControlA

/-! Machine-authored exact round38 wrapper. Independent admission pending. -/
namespace Round38ControlInterfaceA
theorem checked :
  StateCrossR38.CoordinateInputs 1 StateCrossR38.auxB ∧
    (∀ i j : ℕ, 0 ≤ MathGKM.Markov.coeff ((MathGKM.Markov.U+MathGKM.Markov.V)^2) i j ∧ 0 ≤ MathGKM.Markov.coeff MathGKM.Markov.U i j ∧ 0 ≤ MathGKM.Markov.coeff MathGKM.Markov.V i j) ∧
    RenewalR28.state ((MathGKM.Markov.U+MathGKM.Markov.V)^2) MathGKM.Markov.U MathGKM.Markov.V 1 StateCrossR38.auxB 1=(StateCrossR38.auxA',StateCrossR38.auxB') ∧
    MathGKM.Markov.coeff StateCrossR38.auxA' 0 2=1 ∧ MathGKM.Markov.coeff StateCrossR38.auxA' 1 2=0 ∧ MathGKM.Markov.coeff StateCrossR38.auxA' 2 2=1 ∧
    MathGKM.Markov.coeff StateCrossR38.auxA' 0 2*MathGKM.Markov.coeff StateCrossR38.auxA' 2 2 > MathGKM.Markov.coeff StateCrossR38.auxA' 1 2^2 :=
  StateCrossR38.full_transfer_control
end Round38ControlInterfaceA

#print axioms Round38ControlInterfaceA.checked
