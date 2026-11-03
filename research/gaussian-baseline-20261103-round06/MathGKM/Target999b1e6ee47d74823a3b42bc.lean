import MathGKM.LowDegreeSign
import MathGKM.GaussianQuotient
def MathGKM.Target999b1e6ee47d74823a3b42bc.Interface :=
  (
    True
  )
def MathGKM.Target999b1e6ee47d74823a3b42bc.Transport (StudyInterface : MathGKM.Target999b1e6ee47d74823a3b42bc.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target999b1e6ee47d74823a3b42bc.Goal (StudyInterface : MathGKM.Target999b1e6ee47d74823a3b42bc.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), l ≤ k → k ≤ n → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → ∀ d : ℕ, d ≤ n-k → H.coeff d = (∏ j ∈ Finset.Ioc l k, MathGKM.GaussianQuotient.Matching.geom j (d+1)).coeff d
  )
