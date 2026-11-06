import MathGKM.Round45CapacityA
import MathGKM.Markov
def MathGKM.Targetf083a221dc589ce696121731.Interface :=
  (
    True
  )
def MathGKM.Targetf083a221dc589ce696121731.Transport (StudyInterface : MathGKM.Targetf083a221dc589ce696121731.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetf083a221dc589ce696121731.Goal (StudyInterface : MathGKM.Targetf083a221dc589ce696121731.Interface) : Prop :=
  (
    ∀ (n i j dx dy l : ℕ), 1≤n → ((dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1)) → MathGKM.Markov.InPolygon n (n+1) i j → GroupedR40.group n i j dx dy l<0 → l+2≤2*n
  )
