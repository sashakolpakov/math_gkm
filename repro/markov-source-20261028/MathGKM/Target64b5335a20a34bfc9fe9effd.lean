import MathGKM.Round97InterfaceSubmissionA
import MathGKM.Markov
def MathGKM.Target64b5335a20a34bfc9fe9effd.Interface :=
  (
    True
  )
def MathGKM.Target64b5335a20a34bfc9fe9effd.Transport (StudyInterface : MathGKM.Target64b5335a20a34bfc9fe9effd.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target64b5335a20a34bfc9fe9effd.Goal (StudyInterface : MathGKM.Target64b5335a20a34bfc9fe9effd.Interface) : Prop :=
  (
    (∀ N sigma j i a b : ℕ,
          (Finset.range (a/2+1)).sum (fun c => AllocationCompensationR97.delta N sigma j i a b c) =
            ((PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
            ((PairConvolutionR78.P N sigma j (2*i+2) a b i).card : ℤ)) ∧
        (∀ N sigma j i a b : ℕ,
          (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
            (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card ↔
          AllocationCompensationR97.loss N sigma j i a b ≤ AllocationCompensationR97.gain N sigma j i a b) ∧
        (AllocationCompensationR97.delta 4 0 0 2 2 0 0 = -1 ∧
          AllocationCompensationR97.delta 4 0 0 2 2 0 1 = 4 ∧
          AllocationCompensationR97.loss 4 0 0 2 2 0 = 1 ∧
          AllocationCompensationR97.gain 4 0 0 2 2 0 = 4 ∧
          (Finset.range (2/2+1)).sum (fun c => AllocationCompensationR97.delta 4 0 0 2 2 0 c) = 3)
  )
