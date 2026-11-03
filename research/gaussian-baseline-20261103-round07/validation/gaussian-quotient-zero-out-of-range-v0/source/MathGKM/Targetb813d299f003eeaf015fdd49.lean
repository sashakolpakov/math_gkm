import MathGKM.QuotientReciprocity
import MathGKM.Targete13e9693bc94b526e6f70e79
import MathGKM.GaussianQuotient
def MathGKM.Targetb813d299f003eeaf015fdd49.Residual0 : Prop :=
  (
    ∀ n k l : ℕ, ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → ∀ d : ℕ, 2 * d ≤ H.natDegree → 0 ≤ H.coeff d
  )
def MathGKM.Targetb813d299f003eeaf015fdd49.Interface :=
  (
    True
  )
def MathGKM.Targetb813d299f003eeaf015fdd49.Transport (StudyInterface : MathGKM.Targetb813d299f003eeaf015fdd49.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb813d299f003eeaf015fdd49.Goal (StudyInterface : MathGKM.Targetb813d299f003eeaf015fdd49.Interface) : Prop :=
  (
    (MathGKM.Targetb813d299f003eeaf015fdd49.Residual0) → MathGKM.Targete13e9693bc94b526e6f70e79.Residual0
  )
