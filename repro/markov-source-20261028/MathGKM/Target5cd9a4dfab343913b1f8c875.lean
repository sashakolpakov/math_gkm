import MathGKM.Round38ControlInterfaceA
import MathGKM.Markov
def MathGKM.Target5cd9a4dfab343913b1f8c875.Interface :=
  (
    True
  )
def MathGKM.Target5cd9a4dfab343913b1f8c875.Transport (StudyInterface : MathGKM.Target5cd9a4dfab343913b1f8c875.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5cd9a4dfab343913b1f8c875.Goal (StudyInterface : MathGKM.Target5cd9a4dfab343913b1f8c875.Interface) : Prop :=
  (
    StateCrossR38.CoordinateInputs 1 StateCrossR38.auxB ∧
        (∀ i j : ℕ, 0 ≤ MathGKM.Markov.coeff ((MathGKM.Markov.U+MathGKM.Markov.V)^2) i j ∧ 0 ≤ MathGKM.Markov.coeff MathGKM.Markov.U i j ∧ 0 ≤ MathGKM.Markov.coeff MathGKM.Markov.V i j) ∧
        RenewalR28.state ((MathGKM.Markov.U+MathGKM.Markov.V)^2) MathGKM.Markov.U MathGKM.Markov.V 1 StateCrossR38.auxB 1=(StateCrossR38.auxA',StateCrossR38.auxB') ∧
        MathGKM.Markov.coeff StateCrossR38.auxA' 0 2=1 ∧ MathGKM.Markov.coeff StateCrossR38.auxA' 1 2=0 ∧ MathGKM.Markov.coeff StateCrossR38.auxA' 2 2=1 ∧
        MathGKM.Markov.coeff StateCrossR38.auxA' 0 2*MathGKM.Markov.coeff StateCrossR38.auxA' 2 2 > MathGKM.Markov.coeff StateCrossR38.auxA' 1 2^2
  )
