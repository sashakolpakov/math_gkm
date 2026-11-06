import MathGKM.Round44ConsumerA
import MathGKM.Markov
def MathGKM.Targetdf9b655dd07ddfe2de60d363.Interface :=
  (
    True
  )
def MathGKM.Targetdf9b655dd07ddfe2de60d363.Transport (StudyInterface : MathGKM.Targetdf9b655dd07ddfe2de60d363.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetdf9b655dd07ddfe2de60d363.Goal (StudyInterface : MathGKM.Targetdf9b655dd07ddfe2de60d363.Interface) : Prop :=
  (
    ∀ (n : ℕ), 1≤n → ∀ (i j dx dy : ℕ),
     ((dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1)) →
     MathGKM.Markov.InPolygon n (n+1) i j →
     MathGKM.Markov.InPolygon n (n+1) (i+dx) (j+dy) →
     MathGKM.Markov.InPolygon n (n+1) (i+2*dx) (j+2*dy) →
     (∀ l, l≤2*n → GroupedR40.group n i j dx dy l<0 →
       l+2≤2*n ∧ -GroupedR40.group n i j dx dy l≤GroupedR40.group n i j dx dy (l+2)) →
     MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j *
     MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+2*dx) (j+2*dy) ≤
     MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+dx) (j+dy)^2
  )
