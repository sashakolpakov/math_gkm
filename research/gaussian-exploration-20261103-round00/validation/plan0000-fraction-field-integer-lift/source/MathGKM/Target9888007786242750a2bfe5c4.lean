import MathGKM.Plan0000UnitLeadingTransport
import MathGKM.GaussianQuotient
def MathGKM.Target9888007786242750a2bfe5c4.Interface :=
  (
    True
  )
def MathGKM.Target9888007786242750a2bfe5c4.Transport (StudyInterface : MathGKM.Target9888007786242750a2bfe5c4.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target9888007786242750a2bfe5c4.Goal (StudyInterface : MathGKM.Target9888007786242750a2bfe5c4.Interface) : Prop :=
  (
    ∀ (P Q : Polynomial ℤ) (H : Polynomial ℚ), (Q.leadingCoeff = (1 : ℤ) ∨ Q.leadingCoeff = (-1 : ℤ)) → MathGKM.GaussianQuotient.iota (P.map (Int.castRingHom ℚ)) = MathGKM.GaussianQuotient.iota (Q.map (Int.castRingHom ℚ)) * MathGKM.GaussianQuotient.iota H → ∃ K : Polynomial ℤ, H = K.map (Int.castRingHom ℚ)
  )
