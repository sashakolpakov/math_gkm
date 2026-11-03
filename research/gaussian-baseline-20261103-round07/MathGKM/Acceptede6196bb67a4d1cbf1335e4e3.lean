import MathGKM.Target65c3c52ed4339435e1c752b1
import MathGKM.LowDegreeSign
import Lean
def Acceptede6196bb67a4d1cbf1335e4e3.interface : MathGKM.Target65c3c52ed4339435e1c752b1.Interface :=
  (
    True.intro
  )
theorem Acceptede6196bb67a4d1cbf1335e4e3.transport : MathGKM.Target65c3c52ed4339435e1c752b1.Transport Acceptede6196bb67a4d1cbf1335e4e3.interface :=
  (
    True.intro
  )
theorem Acceptede6196bb67a4d1cbf1335e4e3.obligation : MathGKM.Target65c3c52ed4339435e1c752b1.Goal Acceptede6196bb67a4d1cbf1335e4e3.interface :=
  (
    fun d P Q R S => @MathGKM.GaussianQuotient.LowDegree.agree_mul d P Q R S
  )
