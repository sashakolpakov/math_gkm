import MathGKM.LowDegreeSign
import MathGKM.GaussianQuotient
def MathGKM.Target568d255d58000917fa88e0ac.Interface :=
  (
    True
  )
def MathGKM.Target568d255d58000917fa88e0ac.Transport (StudyInterface : MathGKM.Target568d255d58000917fa88e0ac.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target568d255d58000917fa88e0ac.Goal (StudyInterface : MathGKM.Target568d255d58000917fa88e0ac.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), l ≤ k → k ≤ n → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → H * (∏ j ∈ Finset.Ioc l k, (1 - (Polynomial.X : Polynomial ℚ)^j)) = ∏ a ∈ Finset.Ioc (n-k) (n-l), (1 - (Polynomial.X : Polynomial ℚ)^a)
  )
