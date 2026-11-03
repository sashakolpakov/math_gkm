import MathGKM.IndexNormalization
import MathGKM.GaussianQuotient
def MathGKM.Target7f02c13d60d04e5f47d4377b.Interface :=
  (
    True
  )
def MathGKM.Target7f02c13d60d04e5f47d4377b.Transport (StudyInterface : MathGKM.Target7f02c13d60d04e5f47d4377b.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target7f02c13d60d04e5f47d4377b.Goal (StudyInterface : MathGKM.Target7f02c13d60d04e5f47d4377b.Interface) : Prop :=
  (
    ∀ (n j : ℕ), j ≤ n → MathGKM.GaussianQuotient.B n j = MathGKM.GaussianQuotient.B n (n-j)
  )
