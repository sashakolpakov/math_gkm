import MathGKM.Round48SeparatorA
import MathGKM.Markov
def MathGKM.Target2181a744eaa98ae4c01b0533.Interface :=
  (
    True
  )
def MathGKM.Target2181a744eaa98ae4c01b0533.Transport (StudyInterface : MathGKM.Target2181a744eaa98ae4c01b0533.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2181a744eaa98ae4c01b0533.Goal (StudyInterface : MathGKM.Target2181a744eaa98ae4c01b0533.Interface) : Prop :=
  (
    (MathGKM.Markov.InPolygon 32 33 0 34 ∧ MathGKM.Markov.InPolygon 32 33 1 34 ∧ MathGKM.Markov.InPolygon 32 33 2 34 ∧
        (0+1)/2=0 ∧ (0+1+1)/2=1 ∧
        MidpointR36.W 32 0 34 0=31 ∧ MidpointR36.W 32 2 34 1=162400 ∧
        MidpointR36.W 32 1 34 0=2790 ∧ MidpointR36.W 32 1 34 1=1740 ∧
        MidpointR36.W 32 0 34 0 * MidpointR36.W 32 2 34 1 >
          MidpointR36.W 32 1 34 ((0+1)/2) * MidpointR36.W 32 1 34 ((0+1+1)/2)) ∧ (¬ (∀ n : ℕ, 1 ≤ n → ∀ i j : ℕ,
          MathGKM.Markov.InPolygon n (n+1) i j → MathGKM.Markov.InPolygon n (n+1) (i+1) j →
          MathGKM.Markov.InPolygon n (n+1) (i+2) j → ∀ s t : ℕ, s≤n → t≤n →
          MidpointR36.W n i j s * MidpointR36.W n (i+2) j t ≤
            MidpointR36.W n (i+1) j ((s+t)/2) * MidpointR36.W n (i+1) j ((s+t+1)/2)))
  )
