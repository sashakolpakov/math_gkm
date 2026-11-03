import MathGKM.QuotientIntegrality
import MathGKM.GaussianQuotient
def MathGKM.Targete13e9693bc94b526e6f70e79.Residual0 : Prop :=
  (
    ∀ n k l : ℕ, ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → ∀ d : ℕ, 0 ≤ H.coeff d
  )
def MathGKM.Targete13e9693bc94b526e6f70e79.Interface :=
  (
    True
  )
def MathGKM.Targete13e9693bc94b526e6f70e79.Transport (StudyInterface : MathGKM.Targete13e9693bc94b526e6f70e79.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targete13e9693bc94b526e6f70e79.Goal (StudyInterface : MathGKM.Targete13e9693bc94b526e6f70e79.Interface) : Prop :=
  (
    (MathGKM.Targete13e9693bc94b526e6f70e79.Residual0) → MathGKM.GaussianQuotient.FullPositivity
  )
