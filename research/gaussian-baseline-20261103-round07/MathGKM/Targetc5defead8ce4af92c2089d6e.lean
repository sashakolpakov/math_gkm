import MathGKM.IndexNormalization
import MathGKM.GaussianQuotient
def MathGKM.Targetc5defead8ce4af92c2089d6e.Interface :=
  (
    True
  )
def MathGKM.Targetc5defead8ce4af92c2089d6e.Transport (StudyInterface : MathGKM.Targetc5defead8ce4af92c2089d6e.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetc5defead8ce4af92c2089d6e.Goal (StudyInterface : MathGKM.Targetc5defead8ce4af92c2089d6e.Interface) : Prop :=
  (
    ∀ (n k l : ℕ), k ≤ n → ∀ H : Polynomial ℚ, MathGKM.GaussianQuotient.B n l ≠ 0 → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → H.natDegree + l*(n-l) = k*(n-k)
  )
