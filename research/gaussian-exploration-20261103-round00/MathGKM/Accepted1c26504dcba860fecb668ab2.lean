import MathGKM.Targetfda5e2786bd17c150083beef
import MathGKM.Plan0000UnitLeadingTransport
import Lean
def Accepted1c26504dcba860fecb668ab2.interface : MathGKM.Targetfda5e2786bd17c150083beef.Interface :=
  (
    True.intro
  )
theorem Accepted1c26504dcba860fecb668ab2.transport : MathGKM.Targetfda5e2786bd17c150083beef.Transport Accepted1c26504dcba860fecb668ab2.interface :=
  (
    True.intro
  )
theorem Accepted1c26504dcba860fecb668ab2.obligation : MathGKM.Targetfda5e2786bd17c150083beef.Goal Accepted1c26504dcba860fecb668ab2.interface :=
  (
    by intro m; exact ⟨MathGKM.Plan0000UnitLeadingTransport.intT_leadingCoeff m, MathGKM.Plan0000UnitLeadingTransport.iota_intT m, MathGKM.Plan0000UnitLeadingTransport.T_ne_zero m⟩
  )
