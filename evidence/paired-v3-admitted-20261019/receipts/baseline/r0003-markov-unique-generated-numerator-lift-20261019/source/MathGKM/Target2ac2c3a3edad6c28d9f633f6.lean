import MathGKM.MarkovIndexR0003
import MathGKM.Markov
def MathGKM.Target2ac2c3a3edad6c28d9f633f6.Interface :=
  (
    True
  )
def MathGKM.Target2ac2c3a3edad6c28d9f633f6.Transport (StudyInterface : MathGKM.Target2ac2c3a3edad6c28d9f633f6.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2ac2c3a3edad6c28d9f633f6.Goal (StudyInterface : MathGKM.Target2ac2c3a3edad6c28d9f633f6.Interface) : Prop :=
  (
    ∀ a b : ℕ, 0 < a → a ≤ b → Nat.Coprime a b → ∃! T : MathGKM.Markov.TriPoly, MathGKM.Markov.GeneratedNumerator a b T ∧ ∀ p : List Bool, (MathGKM.Markov.frame p).mid.a = a → (MathGKM.Markov.frame p).mid.b = b → T = MathGKM.Markov.liftHomogeneous (MathGKM.Markov.frame p).mid.p (a+b-1)
  )
