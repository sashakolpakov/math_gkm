import MathGKM.Plan0000UnitLeadingTransport
import MathGKM.GaussianQuotient
def MathGKM.Targetfda5e2786bd17c150083beef.Interface :=
  (
    True
  )
def MathGKM.Targetfda5e2786bd17c150083beef.Transport (StudyInterface : MathGKM.Targetfda5e2786bd17c150083beef.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetfda5e2786bd17c150083beef.Goal (StudyInterface : MathGKM.Targetfda5e2786bd17c150083beef.Interface) : Prop :=
  (
    ∀ m : ℕ, (MathGKM.Plan0000UnitLeadingTransport.intT m).leadingCoeff = (-1 : ℤ) ^ m ∧ MathGKM.GaussianQuotient.iota ((MathGKM.Plan0000UnitLeadingTransport.intT m).map (Int.castRingHom ℚ)) = MathGKM.GaussianQuotient.T m ∧ MathGKM.GaussianQuotient.T m ≠ 0
  )
