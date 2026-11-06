import MathGKM.Round49DiagonalA
import MathGKM.Markov
def MathGKM.Target7b1cfbcc8e1b31d75afef96d.Interface :=
  (
    True
  )
def MathGKM.Target7b1cfbcc8e1b31d75afef96d.Transport (StudyInterface : MathGKM.Target7b1cfbcc8e1b31d75afef96d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target7b1cfbcc8e1b31d75afef96d.Goal (StudyInterface : MathGKM.Target7b1cfbcc8e1b31d75afef96d.Interface) : Prop :=
  (
    ∀ (n : ℕ), 1 ≤ n → ∀ (i j : ℕ), MathGKM.Markov.InPolygon n (n+1) i (j+2) → MathGKM.Markov.InPolygon n (n+1) (i+1) (j+1) → MathGKM.Markov.InPolygon n (n+1) (i+2) j → ∀ (s t : ℕ), s ≤ n → t ≤ n → MidpointR36.W n i (j+2) s * MidpointR36.W n (i+2) j t ≤ MidpointR36.W n (i+1) (j+1) ((s+t)/2) * MidpointR36.W n (i+1) (j+1) ((s+t+1)/2)
  )
