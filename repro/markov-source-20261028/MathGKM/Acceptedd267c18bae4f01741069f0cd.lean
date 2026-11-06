import MathGKM.Targetfbc21cb480981d9e6f707493
import MathGKM.Round62EvenA
import Lean
def Acceptedd267c18bae4f01741069f0cd.interface : MathGKM.Targetfbc21cb480981d9e6f707493.Interface :=
  (
    True.intro
  )
theorem Acceptedd267c18bae4f01741069f0cd.transport : MathGKM.Targetfbc21cb480981d9e6f707493.Transport Acceptedd267c18bae4f01741069f0cd.interface :=
  (
    True.intro
  )
theorem Acceptedd267c18bae4f01741069f0cd.obligation : MathGKM.Targetfbc21cb480981d9e6f707493.Goal Acceptedd267c18bae4f01741069f0cd.interface :=
  (
    by
      intro R _ t c n
      exact MatchingIdentificationR62.even_step t c n
  )
