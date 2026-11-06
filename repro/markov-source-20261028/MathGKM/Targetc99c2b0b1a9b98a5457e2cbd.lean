import MathGKM.Round108SubmissionA
import MathGKM.Markov
def MathGKM.Targetc99c2b0b1a9b98a5457e2cbd.Interface :=
  (
    True
  )
def MathGKM.Targetc99c2b0b1a9b98a5457e2cbd.Transport (StudyInterface : MathGKM.Targetc99c2b0b1a9b98a5457e2cbd.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetc99c2b0b1a9b98a5457e2cbd.Goal (StudyInterface : MathGKM.Targetc99c2b0b1a9b98a5457e2cbd.Interface) : Prop :=
  (
    (∀ N sigma i t : ℕ,
      MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma i t) =
        ((ColorForgettingR108.single N sigma i t).card : ℤ)) ∧
    (∀ N sigma i k t : ℕ,
      MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma i t)*
        MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma k t) =
        ((ColorForgettingR108.rankFiber N sigma t (i+k) i).card : ℤ)) ∧
    (∀ N sigma i t : ℕ,
      MatchingProjectionR64.unit (MatchingProjectionR64.defect N sigma i t) =
        ((ColorForgettingR108.rankFiber N sigma t (2*i+2) (i+1)).card : ℤ) -
        ((ColorForgettingR108.rankFiber N sigma t (2*i+2) i).card : ℤ))
  )
