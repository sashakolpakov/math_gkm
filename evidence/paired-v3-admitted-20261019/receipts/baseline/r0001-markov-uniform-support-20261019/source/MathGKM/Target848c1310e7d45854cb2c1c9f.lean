import MathGKM.MarkovHomogeneityR0001
import MathGKM.Markov
def MathGKM.Target848c1310e7d45854cb2c1c9f.Interface :=
  (
    True
  )
def MathGKM.Target848c1310e7d45854cb2c1c9f.Transport (StudyInterface : MathGKM.Target848c1310e7d45854cb2c1c9f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target848c1310e7d45854cb2c1c9f.Goal (StudyInterface : MathGKM.Target848c1310e7d45854cb2c1c9f.Interface) : Prop :=
  (
    ∀ p : List Bool, ∀ L ∈ [(MathGKM.Markov.frame p).lo, (MathGKM.Markov.frame p).mid, (MathGKM.Markov.frame p).hi], ∀ i j : ℕ, MathGKM.Markov.coeff L.p i j ≠ 0 → i+j ≤ L.a+L.b-1
  )
