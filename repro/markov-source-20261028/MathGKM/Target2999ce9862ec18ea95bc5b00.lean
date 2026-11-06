import MathGKM.Round50HorizontalA
import MathGKM.Markov
def MathGKM.Target2999ce9862ec18ea95bc5b00.Interface :=
  (
    True
  )
def MathGKM.Target2999ce9862ec18ea95bc5b00.Transport (StudyInterface : MathGKM.Target2999ce9862ec18ea95bc5b00.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2999ce9862ec18ea95bc5b00.Goal (StudyInterface : MathGKM.Target2999ce9862ec18ea95bc5b00.Interface) : Prop :=
  (
    ∀ n : ℕ, 1≤n →
    let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
    ∀ i : ℕ, MathGKM.Markov.InPolygon E.a E.b i 1 →
      MathGKM.Markov.InPolygon E.a E.b (i+1) 1 →
      MathGKM.Markov.InPolygon E.a E.b (i+2) 1 →
      MathGKM.Markov.coeff E.p i 1*MathGKM.Markov.coeff E.p (i+2) 1 ≤
        MathGKM.Markov.coeff E.p (i+1) 1^2
  )
