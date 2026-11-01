import MathGKM.TwoVariableR0001
import MathGKM.GaussianQuotient
def MathGKM.Targeta2233ba2ee94f467f1b97e0c.Interface :=
  (
    True
  )
def MathGKM.Targeta2233ba2ee94f467f1b97e0c.Transport (StudyInterface : MathGKM.Targeta2233ba2ee94f467f1b97e0c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targeta2233ba2ee94f467f1b97e0c.Goal (StudyInterface : MathGKM.Targeta2233ba2ee94f467f1b97e0c.Interface) : Prop :=
  (
    (∀ (a b : ℕ) (H : Polynomial ℚ), MathGKM.GaussianQuotient.IntervalBridgeR0000.F a b 2 = MathGKM.GaussianQuotient.iota H → MathGKM.GaussianQuotient.TwoVariableR0001.Realization (a+1) (a+2) (b+1) (b+2)) ∧ (∀ (u v n : ℕ) (I : Ideal (MvPolynomial Bool ℚ)), 0 < u → 0 < v → Module.Finite ℚ (MathGKM.GaussianQuotient.TwoVariableR0001.quotientPiece u v n I))
  )
