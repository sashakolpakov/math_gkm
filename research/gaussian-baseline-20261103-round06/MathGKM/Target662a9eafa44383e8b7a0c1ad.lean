import MathGKM.LowDegreeSign
import MathGKM.GaussianQuotient
def MathGKM.Target662a9eafa44383e8b7a0c1ad.Interface :=
  (
    True
  )
def MathGKM.Target662a9eafa44383e8b7a0c1ad.Transport (StudyInterface : MathGKM.Target662a9eafa44383e8b7a0c1ad.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target662a9eafa44383e8b7a0c1ad.Goal (StudyInterface : MathGKM.Target662a9eafa44383e8b7a0c1ad.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), l ≤ k → k ≤ n → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → ∀ d : ℕ, d ≤ H.natDegree → H.natDegree-d ≤ n-k → ∃ a : ℕ, H.coeff d = (a : ℚ)
  )
