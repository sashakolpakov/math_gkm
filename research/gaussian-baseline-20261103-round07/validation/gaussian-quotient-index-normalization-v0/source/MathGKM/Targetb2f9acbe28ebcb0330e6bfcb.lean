import MathGKM.IndexNormalization
import MathGKM.GaussianQuotient
def MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Interface :=
  (
    True
  )
def MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Transport (StudyInterface : MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Goal (StudyInterface : MathGKM.Targetb2f9acbe28ebcb0330e6bfcb.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), k ≤ n → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → min l (n-l) ≤ min k (n-k) ∧ 2 * min k (n-k) ≤ n ∧ MathGKM.GaussianQuotient.B n (min l (n-l)) ≠ 0 ∧ MathGKM.GaussianQuotient.B n (min k (n-k)) = MathGKM.GaussianQuotient.B n (min l (n-l)) * MathGKM.GaussianQuotient.iota H
  )
