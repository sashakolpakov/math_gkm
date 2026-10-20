import MathGKM.Markov
def MathGKM.Target3c8d87a78ba7ff618caa9f8c.Interface :=
  (
    True
  )
def MathGKM.Target3c8d87a78ba7ff618caa9f8c.Transport (StudyInterface : MathGKM.Target3c8d87a78ba7ff618caa9f8c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3c8d87a78ba7ff618caa9f8c.Goal (StudyInterface : MathGKM.Target3c8d87a78ba7ff618caa9f8c.Interface) : Prop :=
  (
    ∀ path : List Bool,
        0 < (MathGKM.Markov.frame path).mid.a ∧ (MathGKM.Markov.frame path).mid.a < (MathGKM.Markov.frame path).mid.b ∧
        0 < (MathGKM.Markov.frame path).mid.b ∧ Nat.Coprime (MathGKM.Markov.frame path).mid.a (MathGKM.Markov.frame path).mid.b
  )
