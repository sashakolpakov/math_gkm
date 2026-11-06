import MathGKM.Targetf083a221dc589ce696121731
import MathGKM.Round45CapacityA
import Lean
def Acceptedfb22ff95229899c343fd4142.interface : MathGKM.Targetf083a221dc589ce696121731.Interface :=
  (
    True.intro
  )
theorem Acceptedfb22ff95229899c343fd4142.transport : MathGKM.Targetf083a221dc589ce696121731.Transport Acceptedfb22ff95229899c343fd4142.interface :=
  (
    True.intro
  )
theorem Acceptedfb22ff95229899c343fd4142.obligation : MathGKM.Targetf083a221dc589ce696121731.Goal Acceptedfb22ff95229899c343fd4142.interface :=
  (
    by intro n i j dx dy l hn hd hp he; exact DistanceTwoR45.negative_has_donor_index n i j dx dy l hn hd hp he
  )
