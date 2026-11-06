import MathGKM.Round29ReductionA
import MathGKM.Target28970cec784233956929e138
import MathGKM.Markov
def MathGKM.Target517568c10ae5cc54007aa4b8.Residual0 : Prop :=
  (
    (
        ∀ path : List Bool, true ∈ path → let E := (MathGKM.Markov.frame path).mid;
          (∀ i j : ℕ, 0 < j →
            MathGKM.Markov.InPolygon E.a E.b i j →
            MathGKM.Markov.InPolygon E.a E.b (i+1) j →
            MathGKM.Markov.InPolygon E.a E.b (i+2) j →
            MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j ≤
              MathGKM.Markov.coeff E.p (i+1) j^2) ∧
          (∀ i j : ℕ, 0 < i →
            MathGKM.Markov.InPolygon E.a E.b i j →
            MathGKM.Markov.InPolygon E.a E.b i (j+1) →
            MathGKM.Markov.InPolygon E.a E.b i (j+2) →
            MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2) ≤
              MathGKM.Markov.coeff E.p i (j+1)^2) ∧
          (∀ i j : ℕ, i+j+2 < E.a+E.b-1 →
            MathGKM.Markov.InPolygon E.a E.b i (j+2) →
            MathGKM.Markov.InPolygon E.a E.b (i+1) (j+1) →
            MathGKM.Markov.InPolygon E.a E.b (i+2) j →
            MathGKM.Markov.coeff E.p i (j+2)*MathGKM.Markov.coeff E.p (i+2) j ≤
              MathGKM.Markov.coeff E.p (i+1) (j+1)^2)
      )
  )
def MathGKM.Target517568c10ae5cc54007aa4b8.Interface :=
  (
    True
  )
def MathGKM.Target517568c10ae5cc54007aa4b8.Transport (StudyInterface : MathGKM.Target517568c10ae5cc54007aa4b8.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target517568c10ae5cc54007aa4b8.Goal (StudyInterface : MathGKM.Target517568c10ae5cc54007aa4b8.Interface) : Prop :=
  (
    (MathGKM.Target517568c10ae5cc54007aa4b8.Residual0) → MathGKM.Target28970cec784233956929e138.Residual0
  )
