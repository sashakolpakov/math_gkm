import MathGKM.LowDegreeSign
import MathGKM.GaussianQuotient
def MathGKM.Target0104442e9dc16b0584931459.Interface :=
  (
    True
  )
def MathGKM.Target0104442e9dc16b0584931459.Transport (StudyInterface : MathGKM.Target0104442e9dc16b0584931459.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target0104442e9dc16b0584931459.Goal (StudyInterface : MathGKM.Target0104442e9dc16b0584931459.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), l ≤ k → k ≤ n → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → ∀ d : ℕ, d ≤ n-k → ∃ a : ℕ, H.coeff d = (a : ℚ)
  )
