import MathGKM.Targetee7d759cf4d55624e993c69a
import MathGKM.LowDegreeSign
import Lean
def Accepted521726c2867b150a3091fca9.interface : MathGKM.Targetee7d759cf4d55624e993c69a.Interface :=
  (
    True.intro
  )
theorem Accepted521726c2867b150a3091fca9.transport : MathGKM.Targetee7d759cf4d55624e993c69a.Transport Accepted521726c2867b150a3091fca9.interface :=
  (
    True.intro
  )
theorem Accepted521726c2867b150a3091fca9.obligation : MathGKM.Targetee7d759cf4d55624e993c69a.Goal Accepted521726c2867b150a3091fca9.interface :=
  (
    fun d D P Q => @MathGKM.GaussianQuotient.LowDegree.agree_cancel d D P Q
  )
