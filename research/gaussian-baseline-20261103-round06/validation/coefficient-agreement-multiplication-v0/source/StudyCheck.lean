import MathGKM.Target65c3c52ed4339435e1c752b1
import MathGKM.LowDegreeSign
import Lean
def StudyInterface : MathGKM.Target65c3c52ed4339435e1c752b1.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target65c3c52ed4339435e1c752b1.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target65c3c52ed4339435e1c752b1.Goal StudyInterface :=
  (
    fun d P Q R S => @MathGKM.GaussianQuotient.LowDegree.agree_mul d P Q R S
  )
