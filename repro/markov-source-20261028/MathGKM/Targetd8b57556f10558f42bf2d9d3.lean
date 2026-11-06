import MathGKM.Round64ProjectionA
import MathGKM.Markov
def MathGKM.Targetd8b57556f10558f42bf2d9d3.Interface :=
  (
    True
  )
def MathGKM.Targetd8b57556f10558f42bf2d9d3.Transport (StudyInterface : MathGKM.Targetd8b57556f10558f42bf2d9d3.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetd8b57556f10558f42bf2d9d3.Goal (StudyInterface : MathGKM.Targetd8b57556f10558f42bf2d9d3.Interface) : Prop :=
  (
    (∀ N sigma : ℕ,
      MatchingProjectionR64.project sigma (MatchingSeparatorR63.Z N sigma)=MatchingProjectionR64.F N sigma) ∧
    (∀ (sigma : ℕ) (P : MatchingSeparatorR63.WeightedUV) (i j : ℕ),
      ((MatchingProjectionR64.project sigma P).coeff i).coeff j=
        MatchingProjectionR64.pi sigma ((P.coeff i).coeff j)) ∧
    (∀ N sigma i j : ℕ,
      MatchingProjectionR64.B N sigma i j=MatchingProjectionR64.pi sigma (MatchingSeparatorR63.C N sigma i j)) ∧
    (∀ N sigma : ℕ, MatchingProjectionR64.specialize (MatchingProjectionR64.F N sigma)=
      FiniteMatchingR61.finiteSum (MathGKM.Markov.U+MathGKM.Markov.V)
        (fun e => if (e+sigma)%2=0 then MathGKM.Markov.U else MathGKM.Markov.V) N) ∧
    (∀ (P : MatchingProjectionR64.Four) (i j : ℕ),
      ((MatchingProjectionR64.specialize P).coeff i).coeff j=
        MatchingProjectionR64.unit ((P.coeff i).coeff j)) ∧
    (∀ N : ℕ, MatchingProjectionR64.swapAll (MatchingProjectionR64.F N 0)=MatchingProjectionR64.F N 1)
  )
