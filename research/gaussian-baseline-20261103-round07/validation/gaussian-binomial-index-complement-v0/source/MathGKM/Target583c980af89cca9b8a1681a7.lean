import MathGKM.MatchingSufficiency
import MathGKM.GaussianQuotient
def MathGKM.Target583c980af89cca9b8a1681a7.Interface :=
  (
    True
  )
def MathGKM.Target583c980af89cca9b8a1681a7.Transport (StudyInterface : MathGKM.Target583c980af89cca9b8a1681a7.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target583c980af89cca9b8a1681a7.Goal (StudyInterface : MathGKM.Target583c980af89cca9b8a1681a7.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), l ≤ k → k ≤ n → ∀ (f : ℕ → ℕ), Set.BijOn f (↑(Finset.Ioc l k) : Set ℕ) (↑(Finset.Ioc (n-k) (n-l)) : Set ℕ) → (∀ d ∈ Finset.Ioc l k, d ∣ f d) → MathGKM.GaussianQuotient.NatCoeffs (MathGKM.GaussianQuotient.Matching.matchingProduct k l f) ∧ MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota (MathGKM.GaussianQuotient.Matching.matchingProduct k l f) ∧ ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → H = MathGKM.GaussianQuotient.Matching.matchingProduct k l f ∧ MathGKM.GaussianQuotient.NatCoeffs H
  )
