import MathGKM.Round78DefectSubmissionA
import MathGKM.Markov
def MathGKM.Target473649b0439ca2400c5e9d8f.Interface :=
  (
    True
  )
def MathGKM.Target473649b0439ca2400c5e9d8f.Transport (StudyInterface : MathGKM.Target473649b0439ca2400c5e9d8f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target473649b0439ca2400c5e9d8f.Goal (StudyInterface : MathGKM.Target473649b0439ca2400c5e9d8f.Interface) : Prop :=
  (
    (∀ N sigma i j a b : ℕ, ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b = ((PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card : ℤ) - ((PairConvolutionR78.P N sigma j (2*i+2) a b i).card : ℤ)) ∧ (∀ N sigma i j a b : ℕ, (0 ≤ ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b) ↔ (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤ (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card)
  )
