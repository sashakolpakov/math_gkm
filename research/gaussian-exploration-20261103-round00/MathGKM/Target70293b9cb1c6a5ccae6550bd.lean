import MathGKM.Plan0000UnitLeadingTransport
import MathGKM.GaussianQuotient
def MathGKM.Target70293b9cb1c6a5ccae6550bd.Interface :=
  (
    True
  )
def MathGKM.Target70293b9cb1c6a5ccae6550bd.Transport (StudyInterface : MathGKM.Target70293b9cb1c6a5ccae6550bd.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target70293b9cb1c6a5ccae6550bd.Goal (StudyInterface : MathGKM.Target70293b9cb1c6a5ccae6550bd.Interface) : Prop :=
  (
    ∀ (n k l : ℕ) (H : Polynomial ℚ), k ≤ n → l ≤ n → MathGKM.GaussianQuotient.B n k = MathGKM.GaussianQuotient.B n l * MathGKM.GaussianQuotient.iota H → MathGKM.GaussianQuotient.iota (((MathGKM.Plan0000UnitLeadingTransport.intT l) * MathGKM.Plan0000UnitLeadingTransport.intT (n-l)).map (Int.castRingHom ℚ)) = MathGKM.GaussianQuotient.iota (((MathGKM.Plan0000UnitLeadingTransport.intT k) * MathGKM.Plan0000UnitLeadingTransport.intT (n-k)).map (Int.castRingHom ℚ)) * MathGKM.GaussianQuotient.iota H
  )
