import MathGKM.Plan0001ReciprocalSign
import MathGKM.GaussianQuotient
def MathGKM.Targete13230fbf21010cdcf19d1a2.Interface :=
  (
    True
  )
def MathGKM.Targete13230fbf21010cdcf19d1a2.Transport (StudyInterface : MathGKM.Targete13230fbf21010cdcf19d1a2.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targete13230fbf21010cdcf19d1a2.Goal (StudyInterface : MathGKM.Targete13230fbf21010cdcf19d1a2.Interface) : Prop :=
  (
    let P : Polynomial ℚ := 1 + Polynomial.X ^ 3; let Q : Polynomial ℚ := 1 + Polynomial.X; let R : Polynomial ℚ := Polynomial.X ^ 2 - Polynomial.X + 1; P = Q * R ∧ MathGKM.GaussianQuotient.NatCoeffs P ∧ MathGKM.GaussianQuotient.NatCoeffs Q ∧ Q.Monic ∧ Polynomial.reflect 3 P = P ∧ Polynomial.reflect 1 Q = Q ∧ R.coeff 1 = (-1 : ℚ) ∧ ¬MathGKM.GaussianQuotient.NatCoeffs R
  )
