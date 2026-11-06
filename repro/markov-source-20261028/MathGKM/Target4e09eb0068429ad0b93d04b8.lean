import MathGKM.Round43CornerReductionA
import MathGKM.Target9c09b70f4c5021cf5d29c1e1
import MathGKM.Markov
def MathGKM.Target4e09eb0068429ad0b93d04b8.Residual0 : Prop :=
  (
    (
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
                    (¬∃ n : ℕ, 2≤n ∧ path=List.replicate (n-1) true ∧ i=n ∧ j=0) →
                    MathGKM.Markov.InPolygon E.a E.b i j →
                    MathGKM.Markov.InPolygon E.a E.b i (j+1) →
                    MathGKM.Markov.InPolygon E.a E.b i (j+2) →
                    MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2) ≤
                      MathGKM.Markov.coeff E.p i (j+1)^2) ∧
                  (false ∈ path → ∀ i j : ℕ, i+j+2 < E.a+E.b-1 →
                    MathGKM.Markov.InPolygon E.a E.b i (j+2) →
                    MathGKM.Markov.InPolygon E.a E.b (i+1) (j+1) →
                    MathGKM.Markov.InPolygon E.a E.b (i+2) j →
                    MathGKM.Markov.coeff E.p i (j+2)*MathGKM.Markov.coeff E.p (i+2) j ≤
                      MathGKM.Markov.coeff E.p (i+1) (j+1)^2)
              )
          )
      )
  )
def MathGKM.Target4e09eb0068429ad0b93d04b8.Interface :=
  (
    True
  )
def MathGKM.Target4e09eb0068429ad0b93d04b8.Transport (StudyInterface : MathGKM.Target4e09eb0068429ad0b93d04b8.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target4e09eb0068429ad0b93d04b8.Goal (StudyInterface : MathGKM.Target4e09eb0068429ad0b93d04b8.Interface) : Prop :=
  (
    (MathGKM.Target4e09eb0068429ad0b93d04b8.Residual0) → MathGKM.Target9c09b70f4c5021cf5d29c1e1.Residual0
  )
