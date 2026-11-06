import MathGKM.Round83CountsA
import MathGKM.Markov
def MathGKM.Targetf341ac84f583d118a3f5023e.Interface :=
  (
    True
  )
def MathGKM.Targetf341ac84f583d118a3f5023e.Transport (StudyInterface : MathGKM.Targetf341ac84f583d118a3f5023e.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetf341ac84f583d118a3f5023e.Goal (StudyInterface : MathGKM.Targetf341ac84f583d118a3f5023e.Interface) : Prop :=
  (
    (∀ r : ℕ, (PairConvolutionR78.P 8 1 4 2 0 6 r).card =
          if r=0 then 36 else if r=1 then 64 else if r=2 then 36 else 0) ∧
        (PairConvolutionR78.P 8 1 4 2 0 6 0).card ≤
          (PairConvolutionR78.P 8 1 4 2 0 6 1).card ∧
        ((PairConvolutionR78.P 8 1 4 2 0 6 1).card : ℤ) -
          ((PairConvolutionR78.P 8 1 4 2 0 6 0).card : ℤ) = 28
  )
