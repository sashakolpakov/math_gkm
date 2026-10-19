import MathGKM.MarkovSubleading
import MathGKM.Markov
def MathGKM.Target83728fd4a693cb3b2ee42a35.Interface :=
  (
    True
  )
def MathGKM.Target83728fd4a693cb3b2ee42a35.Transport (StudyInterface : MathGKM.Target83728fd4a693cb3b2ee42a35.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target83728fd4a693cb3b2ee42a35.Goal (StudyInterface : MathGKM.Target83728fd4a693cb3b2ee42a35.Interface) : Prop :=
  (
    ∀ path : List Bool,
        let m := (MathGKM.Markov.frame path).mid
        let d := m.a+m.b-1
        MathGKM.Markov.totalComponent m.p (d-1) =
          (((m.b-1:ℕ):ℤ) • MathGKM.Markov.U + ((m.a-1:ℕ):ℤ) • MathGKM.Markov.V)*
          (MathGKM.Markov.U+MathGKM.Markov.V)^(d-2)
  )
