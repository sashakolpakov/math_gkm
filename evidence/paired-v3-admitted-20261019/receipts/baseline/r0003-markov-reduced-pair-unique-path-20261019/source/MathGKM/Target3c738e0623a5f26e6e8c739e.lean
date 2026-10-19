import MathGKM.MarkovIndexR0003
import MathGKM.Markov
def MathGKM.Target3c738e0623a5f26e6e8c739e.Interface :=
  (
    True
  )
def MathGKM.Target3c738e0623a5f26e6e8c739e.Transport (StudyInterface : MathGKM.Target3c738e0623a5f26e6e8c739e.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3c738e0623a5f26e6e8c739e.Goal (StudyInterface : MathGKM.Target3c738e0623a5f26e6e8c739e.Interface) : Prop :=
  (
    ∀ a b : ℕ, 0 < a → a < b → Nat.Coprime a b → ∃! p : List Bool, (MathGKM.Markov.frame p).mid.a = a ∧ (MathGKM.Markov.frame p).mid.b = b
  )
