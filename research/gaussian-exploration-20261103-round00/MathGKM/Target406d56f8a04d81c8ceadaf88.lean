import MathGKM.Plan0000UnitLeading
import MathGKM.GaussianQuotient
def MathGKM.Target406d56f8a04d81c8ceadaf88.Interface :=
  (
    True
  )
def MathGKM.Target406d56f8a04d81c8ceadaf88.Transport (StudyInterface : MathGKM.Target406d56f8a04d81c8ceadaf88.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target406d56f8a04d81c8ceadaf88.Goal (StudyInterface : MathGKM.Target406d56f8a04d81c8ceadaf88.Interface) : Prop :=
  (
    ∀ (P Q : Polynomial ℤ) (H : Polynomial ℚ), (Q.leadingCoeff = (1 : ℤ) ∨ Q.leadingCoeff = (-1 : ℤ)) → P.map (Int.castRingHom ℚ) = Q.map (Int.castRingHom ℚ) * H → ∃ K : Polynomial ℤ, H = K.map (Int.castRingHom ℚ)
  )
