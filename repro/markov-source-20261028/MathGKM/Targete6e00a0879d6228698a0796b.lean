import MathGKM.Markov
def MathGKM.Targete6e00a0879d6228698a0796b.Interface :=
  (
    True
  )
def MathGKM.Targete6e00a0879d6228698a0796b.Transport (StudyInterface : MathGKM.Targete6e00a0879d6228698a0796b.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targete6e00a0879d6228698a0796b.Goal (StudyInterface : MathGKM.Targete6e00a0879d6228698a0796b.Interface) : Prop :=
  (
    ∀ (a b : ℕ) (A B : MathGKM.Markov.BiPoly),
    let h := fun (P : MathGKM.Markov.BiPoly) (j i : ℕ) => MathGKM.Markov.coeff P i j
    let v := fun (P : MathGKM.Markov.BiPoly) (i j : ℕ) => MathGKM.Markov.coeff P i j
    let d := fun (P : MathGKM.Markov.BiPoly) (n i : ℕ) => MathGKM.Markov.coeff P i (n-i)
    let good := fun (x y : ℕ → ℤ) (k : ℕ) =>
      0 ≤ y (k+1)^2 - y k*y (k+2) ∧
      0 ≤ (x (k+1)^2-x k*x (k+2)) -
        (2*x (k+1)*y (k+1)-x k*y (k+2)-x (k+2)*y k)
    (∀ j i, MathGKM.Markov.InPolygon a b i j →
      MathGKM.Markov.InPolygon a b (i+1) j →
      MathGKM.Markov.InPolygon a b (i+2) j → good (h A j) (h B j) i) →
    (∀ i j, MathGKM.Markov.InPolygon a b i j →
      MathGKM.Markov.InPolygon a b i (j+1) →
      MathGKM.Markov.InPolygon a b i (j+2) → good (v A i) (v B i) j) →
    (∀ n i, i+2 ≤ n →
      MathGKM.Markov.InPolygon a b i (n-i) →
      MathGKM.Markov.InPolygon a b (i+1) (n-(i+1)) →
      MathGKM.Markov.InPolygon a b (i+2) (n-(i+2)) → good (d A n) (d B n) i) →
    MathGKM.Markov.WeakLC a b (A-B)
  )
