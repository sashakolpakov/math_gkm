import MathGKM.Round10RootReduction
import MathGKM.Markov
def MathGKM.Target28970cec784233956929e138.Residual0 : Prop :=
  (
    ∀ path : List Bool, let E := (MathGKM.Markov.frame path).mid;
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
def MathGKM.Target28970cec784233956929e138.Interface :=
  (
    True
  )
def MathGKM.Target28970cec784233956929e138.Transport (StudyInterface : MathGKM.Target28970cec784233956929e138.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target28970cec784233956929e138.Goal (StudyInterface : MathGKM.Target28970cec784233956929e138.Interface) : Prop :=
  (
    (MathGKM.Target28970cec784233956929e138.Residual0) → MathGKM.Markov.Conjecture63
  )
