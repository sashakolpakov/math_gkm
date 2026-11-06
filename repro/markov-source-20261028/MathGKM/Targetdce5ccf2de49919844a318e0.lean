import MathGKM.Round96SubmissionA
import MathGKM.Markov
def MathGKM.Targetdce5ccf2de49919844a318e0.Interface :=
  (
    True
  )
def MathGKM.Targetdce5ccf2de49919844a318e0.Transport (StudyInterface : MathGKM.Targetdce5ccf2de49919844a318e0.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetdce5ccf2de49919844a318e0.Goal (StudyInterface : MathGKM.Targetdce5ccf2de49919844a318e0.Interface) : Prop :=
  (
    (ComplementaryAllocationR96.G 4 0 0 6 2 0 0 2=1 ∧
      ComplementaryAllocationR96.G 4 0 0 6 2 0 0 3=0 ∧
      ComplementaryAllocationR96.G 4 0 0 6 2 0 1 2=0 ∧
      ComplementaryAllocationR96.G 4 0 0 6 2 0 1 3=4) ∧
      (ComplementaryAllocationR96.G 4 0 0 6 2 0 0 3 < ComplementaryAllocationR96.G 4 0 0 6 2 0 0 2 ∧
        (PairConvolutionR78.P 4 0 0 6 2 0 2).card=1 ∧
        (PairConvolutionR78.P 4 0 0 6 2 0 3).card=4 ∧
        ¬ (∀ n sigma j i a b c : ℕ, sigma≤1 → c≤a/2 →
          ComplementaryAllocationR96.G (2*n) sigma j (2*i+2) a b c i ≤
            ComplementaryAllocationR96.G (2*n) sigma j (2*i+2) a b c (i+1))) ∧
      (let E := (MathGKM.Markov.frame [true]).mid;
        E.a=2 ∧ E.b=3 ∧
        MathGKM.Markov.InPolygon E.a E.b 2 0 ∧ MathGKM.Markov.InPolygon E.a E.b 3 0 ∧
        MathGKM.Markov.InPolygon E.a E.b 4 0 ∧
        MathGKM.Markov.coeff E.p 2 0=1 ∧ MathGKM.Markov.coeff E.p 3 0=2 ∧
        MathGKM.Markov.coeff E.p 4 0=1 ∧
        MathGKM.Markov.coeff E.p 3 0^2-MathGKM.Markov.coeff E.p 2 0*MathGKM.Markov.coeff E.p 4 0=3)
  )
