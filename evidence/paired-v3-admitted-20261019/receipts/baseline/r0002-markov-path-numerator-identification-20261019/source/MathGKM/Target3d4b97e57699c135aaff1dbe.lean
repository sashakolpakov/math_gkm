import MathGKM.MarkovLiftR0001
import MathGKM.Markov
def MathGKM.Target3d4b97e57699c135aaff1dbe.Interface :=
  (
    True
  )
def MathGKM.Target3d4b97e57699c135aaff1dbe.Transport (StudyInterface : MathGKM.Target3d4b97e57699c135aaff1dbe.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3d4b97e57699c135aaff1dbe.Goal (StudyInterface : MathGKM.Target3d4b97e57699c135aaff1dbe.Interface) : Prop :=
  (
    ∀ p : List Bool, ∀ L ∈ [(MathGKM.Markov.frame p).lo, (MathGKM.Markov.frame p).mid, (MathGKM.Markov.frame p).hi], let d := L.a+L.b-1; MathGKM.Markov.specializeW (MathGKM.Markov.liftHomogeneous L.p d) = L.p ∧ (∀ i j, i+j ≤ d → MathGKM.Markov.triCoeff (MathGKM.Markov.liftHomogeneous L.p d) i j (d-i-j) = MathGKM.Markov.coeff L.p i j) ∧ (∀ i j, d < i+j → MathGKM.Markov.coeff L.p i j = 0) ∧ (∀ i j k, MathGKM.Markov.triCoeff (MathGKM.Markov.liftHomogeneous L.p d) i j k ≠ 0 → i+j+k = d)
  )
