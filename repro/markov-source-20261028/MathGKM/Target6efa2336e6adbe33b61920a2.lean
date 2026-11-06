import MathGKM.Round48MidpointA
import MathGKM.Markov
def MathGKM.Target6efa2336e6adbe33b61920a2.Interface :=
  (
    True
  )
def MathGKM.Target6efa2336e6adbe33b61920a2.Transport (StudyInterface : MathGKM.Target6efa2336e6adbe33b61920a2.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target6efa2336e6adbe33b61920a2.Goal (StudyInterface : MathGKM.Target6efa2336e6adbe33b61920a2.Interface) : Prop :=
  (
    ∀ (a b : ℤ → ℤ), OrientedR48.Cone a → OrientedR48.Cone b →
      ∀ (x s t : ℤ),
        (a s*b (x-s))*(a t*b (x+2-t)) ≤
          (a ((s+t)/2)*b (x+1-(s+t)/2))*
          (a ((s+t+1)/2)*b (x+1-(s+t+1)/2))
  )
