import MathGKM.Round94FullA
import MathGKM.Markov
def MathGKM.Target2336f11baa9d942221f4a250.Interface :=
  (
    True
  )
def MathGKM.Target2336f11baa9d942221f4a250.Transport (StudyInterface : MathGKM.Target2336f11baa9d942221f4a250.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2336f11baa9d942221f4a250.Goal (StudyInterface : MathGKM.Target2336f11baa9d942221f4a250.Interface) : Prop :=
  (
    ∀ n j i b : ℕ,
      (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card ≤
        (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card
  )
