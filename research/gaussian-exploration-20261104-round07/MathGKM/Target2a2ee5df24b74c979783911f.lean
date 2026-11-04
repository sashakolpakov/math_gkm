import MathGKM.Plan0007AdjacentClassification
import MathGKM.GaussianQuotient
def MathGKM.Target2a2ee5df24b74c979783911f.Interface :=
  (
    True
  )
def MathGKM.Target2a2ee5df24b74c979783911f.Transport (StudyInterface : MathGKM.Target2a2ee5df24b74c979783911f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2a2ee5df24b74c979783911f.Goal (StudyInterface : MathGKM.Target2a2ee5df24b74c979783911f.Interface) : Prop :=
  (
    ∀ (n l : ℕ) (H : Polynomial ℚ), MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n (l + 1) = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → (l + 1) ∣ (n - l) ∧ H = ∑ j ∈ Finset.range ((n - l) / (l + 1)), (Polynomial.X : Polynomial ℚ) ^ ((l + 1) * j)
  )
