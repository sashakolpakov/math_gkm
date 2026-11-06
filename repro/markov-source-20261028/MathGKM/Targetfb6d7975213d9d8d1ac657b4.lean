import MathGKM.Round45ConsumerA
import MathGKM.Markov
def MathGKM.Targetfb6d7975213d9d8d1ac657b4.Interface :=
  (
    True
  )
def MathGKM.Targetfb6d7975213d9d8d1ac657b4.Transport (StudyInterface : MathGKM.Targetfb6d7975213d9d8d1ac657b4.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetfb6d7975213d9d8d1ac657b4.Goal (StudyInterface : MathGKM.Targetfb6d7975213d9d8d1ac657b4.Interface) : Prop :=
  (
    ∀ (n : ℕ), 1≤n → ∀ (i j dx dy : ℕ),
     ((dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1)) →
     MathGKM.Markov.InPolygon n (n+1) i j →
     MathGKM.Markov.InPolygon n (n+1) (i+dx) (j+dy) →
     MathGKM.Markov.InPolygon n (n+1) (i+2*dx) (j+2*dy) →
     (∀ l, l≤2*n → GroupedR40.group n i j dx dy l<0 →
       -GroupedR40.group n i j dx dy l≤GroupedR40.group n i j dx dy (l+2)) →
     MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j *
     MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+2*dx) (j+2*dy) ≤
     MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (i+dx) (j+dy)^2
  )
