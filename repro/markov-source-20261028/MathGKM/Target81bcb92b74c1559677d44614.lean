import MathGKM.Round91OneCompleteA
import MathGKM.Markov
def MathGKM.Target81bcb92b74c1559677d44614.Interface :=
  (
    True
  )
def MathGKM.Target81bcb92b74c1559677d44614.Transport (StudyInterface : MathGKM.Target81bcb92b74c1559677d44614.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target81bcb92b74c1559677d44614.Goal (StudyInterface : MathGKM.Target81bcb92b74c1559677d44614.Interface) : Prop :=
  (
    ∀ n j i b : ℕ,
      (PairConvolutionR78.P (2*n) 1 j (2*i+2) 1 b i).card ≤
        (PairConvolutionR78.P (2*n) 1 j (2*i+2) 1 b (i+1)).card
  )
