import MathGKM.Round90Submission3A
import MathGKM.Markov
def MathGKM.Target5f776f58d44a93fe4ce6dc47.Interface :=
  (
    True
  )
def MathGKM.Target5f776f58d44a93fe4ce6dc47.Transport (StudyInterface : MathGKM.Target5f776f58d44a93fe4ce6dc47.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5f776f58d44a93fe4ce6dc47.Goal (StudyInterface : MathGKM.Target5f776f58d44a93fe4ce6dc47.Interface) : Prop :=
  (
    ∀ n i j b : ℕ,
      (PairConvolutionR78.P (2*n) 0 j (2*i+2) 0 b i).card ≤
        (PairConvolutionR78.P (2*n) 0 j (2*i+2) 0 b (i+1)).card ∧
      (PairConvolutionR78.P (2*n) 1 i (2*j+2) 0 b j).card ≤
        (PairConvolutionR78.P (2*n) 1 i (2*j+2) 0 b (j+1)).card
  )
