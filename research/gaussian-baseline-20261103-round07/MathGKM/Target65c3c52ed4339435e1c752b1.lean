import MathGKM.LowDegreeSign
import MathGKM.GaussianQuotient
def MathGKM.Target65c3c52ed4339435e1c752b1.Interface :=
  (
    True
  )
def MathGKM.Target65c3c52ed4339435e1c752b1.Transport (StudyInterface : MathGKM.Target65c3c52ed4339435e1c752b1.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target65c3c52ed4339435e1c752b1.Goal (StudyInterface : MathGKM.Target65c3c52ed4339435e1c752b1.Interface) : Prop :=
  (
    ∀ (d : ℕ) (P Q R S : Polynomial ℚ), MathGKM.GaussianQuotient.LowDegree.Agree d P Q → MathGKM.GaussianQuotient.LowDegree.Agree d R S → MathGKM.GaussianQuotient.LowDegree.Agree d (P*R) (Q*S)
  )
