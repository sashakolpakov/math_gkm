import MathGKM.Markov
def MathGKM.Target620c1a4edec04bcccc604a17.Interface :=
  (
    True
  )
def MathGKM.Target620c1a4edec04bcccc604a17.Transport (StudyInterface : MathGKM.Target620c1a4edec04bcccc604a17.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target620c1a4edec04bcccc604a17.Goal (StudyInterface : MathGKM.Target620c1a4edec04bcccc604a17.Interface) : Prop :=
  (
    ∀ a b : ℕ,
        Nat.Coprime a b → 0 < a → a < b →
        ∃ path : List Bool, (MathGKM.Markov.frame path).mid.a = a ∧ (MathGKM.Markov.frame path).mid.b = b
  )
