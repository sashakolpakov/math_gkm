import MathGKM.Round96SubmissionA
import MathGKM.Markov
def MathGKM.Targetb708f9ac14eab3d739e5aa70.Interface :=
  (
    True
  )
def MathGKM.Targetb708f9ac14eab3d739e5aa70.Transport (StudyInterface : MathGKM.Targetb708f9ac14eab3d739e5aa70.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb708f9ac14eab3d739e5aa70.Goal (StudyInterface : MathGKM.Targetb708f9ac14eab3d739e5aa70.Interface) : Prop :=
  (
    ∀ N sigma j i a b : ℕ,
      (∀ c : ℕ, c≤a/2 → ComplementaryAllocationR96.G N sigma j (2*i+2) a b c i ≤
        ComplementaryAllocationR96.G N sigma j (2*i+2) a b c (i+1)) →
      (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
        (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card
  )
