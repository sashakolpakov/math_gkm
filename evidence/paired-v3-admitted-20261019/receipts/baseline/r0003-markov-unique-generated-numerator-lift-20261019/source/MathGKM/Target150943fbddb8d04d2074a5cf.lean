import MathGKM.MarkovCoverageR0000
import MathGKM.Markov
def MathGKM.Target150943fbddb8d04d2074a5cf.Interface :=
  (
    True
  )
def MathGKM.Target150943fbddb8d04d2074a5cf.Transport (StudyInterface : MathGKM.Target150943fbddb8d04d2074a5cf.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target150943fbddb8d04d2074a5cf.Goal (StudyInterface : MathGKM.Target150943fbddb8d04d2074a5cf.Interface) : Prop :=
  (
    ∀ a b : ℕ, 0 < a → a ≤ b → Nat.Coprime a b → ((a = 1 ∧ b = 1) ∨ ∃ p : List Bool, (MathGKM.Markov.frame p).mid.a = a ∧ (MathGKM.Markov.frame p).mid.b = b)
  )
