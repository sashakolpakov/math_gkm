import MathGKM.Round93Submission2A
import MathGKM.Markov
def MathGKM.Target0177863f3a9edd4a3fcd259d.Interface :=
  (
    True
  )
def MathGKM.Target0177863f3a9edd4a3fcd259d.Transport (StudyInterface : MathGKM.Target0177863f3a9edd4a3fcd259d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target0177863f3a9edd4a3fcd259d.Goal (StudyInterface : MathGKM.Target0177863f3a9edd4a3fcd259d.Interface) : Prop :=
  (
    ∀ n j i b : ℕ, n<3 →
      (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card ≤
        (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card
  )
