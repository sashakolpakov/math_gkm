import MathGKM.MarkovDescent
import MathGKM.Markov
def MathGKM.Target505682d9e644003e4799fdc0.Interface :=
  (
    True
  )
def MathGKM.Target505682d9e644003e4799fdc0.Transport (StudyInterface : MathGKM.Target505682d9e644003e4799fdc0.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target505682d9e644003e4799fdc0.Goal (StudyInterface : MathGKM.Target505682d9e644003e4799fdc0.Interface) : Prop :=
  (
    ∀ a b : ℕ, 0 < a → a ≤ b → Nat.Coprime a b → (a = 1 ∧ b = 1) ∨ ∃ path : List Bool, (MathGKM.Markov.frame path).mid.a = a ∧ (MathGKM.Markov.frame path).mid.b = b
  )
