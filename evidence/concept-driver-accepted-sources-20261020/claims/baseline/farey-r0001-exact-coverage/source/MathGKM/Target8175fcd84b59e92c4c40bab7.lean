import MathGKM.Markov
def MathGKM.Target8175fcd84b59e92c4c40bab7.Interface :=
  (
    True
  )
def MathGKM.Target8175fcd84b59e92c4c40bab7.Transport (StudyInterface : MathGKM.Target8175fcd84b59e92c4c40bab7.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target8175fcd84b59e92c4c40bab7.Goal (StudyInterface : MathGKM.Target8175fcd84b59e92c4c40bab7.Interface) : Prop :=
  (
    ∀ a b : ℕ, 0 < a → a < b → Nat.Coprime a b →
        ∃ p : List Bool, (MathGKM.Markov.frame p).mid.a = a ∧ (MathGKM.Markov.frame p).mid.b = b
  )
