import MathGKM.Round42CornerA
import MathGKM.Markov
def MathGKM.Target8defc66663a224aa9c6bf16e.Interface :=
  (
    True
  )
def MathGKM.Target8defc66663a224aa9c6bf16e.Transport (StudyInterface : MathGKM.Target8defc66663a224aa9c6bf16e.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target8defc66663a224aa9c6bf16e.Goal (StudyInterface : MathGKM.Target8defc66663a224aa9c6bf16e.Interface) : Prop :=
  (
    ∀ n : ℕ, 2 ≤ n → let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid; E.a=n ∧ E.b=n+1 ∧ MathGKM.Markov.InPolygon E.a E.b n 0 ∧ MathGKM.Markov.InPolygon E.a E.b n 1 ∧ MathGKM.Markov.InPolygon E.a E.b n 2 ∧ MathGKM.Markov.coeff E.p n 0*MathGKM.Markov.coeff E.p n 2 < MathGKM.Markov.coeff E.p n 1^2
  )
