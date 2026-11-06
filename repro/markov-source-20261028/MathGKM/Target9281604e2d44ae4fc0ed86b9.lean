import MathGKM.Round81ConditionalA
import MathGKM.Markov
def MathGKM.Target9281604e2d44ae4fc0ed86b9.Interface :=
  (
    True
  )
def MathGKM.Target9281604e2d44ae4fc0ed86b9.Transport (StudyInterface : MathGKM.Target9281604e2d44ae4fc0ed86b9.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target9281604e2d44ae4fc0ed86b9.Goal (StudyInterface : MathGKM.Target9281604e2d44ae4fc0ed86b9.Interface) : Prop :=
  (
    let H := FullFiberRankR80.rankPoly 8 1 4 2 0 6
    (H.coeff 0=36 ∧ H.coeff 1=64) →
    (∀ gamma : ℕ → ℤ, H=SymmetricBinomialR80.expansion 2 gamma →
      gamma 0=36 ∧ gamma 1= -8) ∧
    ¬∃ gamma : ℕ → ℤ, H=SymmetricBinomialR80.expansion 2 gamma ∧
      (∀ k, k≤2/2 → 0≤gamma k)
  )
