import MathGKM.Round83GammaA
import MathGKM.Markov
def MathGKM.Targetbe8437c131d7af59e0fd2789.Interface :=
  (
    True
  )
def MathGKM.Targetbe8437c131d7af59e0fd2789.Transport (StudyInterface : MathGKM.Targetbe8437c131d7af59e0fd2789.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetbe8437c131d7af59e0fd2789.Goal (StudyInterface : MathGKM.Targetbe8437c131d7af59e0fd2789.Interface) : Prop :=
  (
    (∀ gamma : ℕ → ℤ,
          FullFiberRankR80.rankPoly 8 1 4 2 0 6 = SymmetricBinomialR80.expansion 2 gamma →
          gamma 0=36 ∧ gamma 1= -8) ∧
        ¬∃ gamma : ℕ → ℤ,
          FullFiberRankR80.rankPoly 8 1 4 2 0 6 = SymmetricBinomialR80.expansion 2 gamma ∧
          (∀ k, k≤1 → 0≤gamma k)
  )
