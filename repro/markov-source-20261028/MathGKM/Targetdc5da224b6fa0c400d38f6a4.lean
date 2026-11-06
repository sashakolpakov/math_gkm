import MathGKM.Markov
def MathGKM.Targetdc5da224b6fa0c400d38f6a4.Interface :=
  (
    True
  )
def MathGKM.Targetdc5da224b6fa0c400d38f6a4.Transport (StudyInterface : MathGKM.Targetdc5da224b6fa0c400d38f6a4.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetdc5da224b6fa0c400d38f6a4.Goal (StudyInterface : MathGKM.Targetdc5da224b6fa0c400d38f6a4.Interface) : Prop :=
  (
    let A : Polynomial ℤ := 1+Polynomial.X; let B : Polynomial ℤ := 1+Polynomial.X^2; let C : Polynomial ℤ := 1+Polynomial.X+Polynomial.X^2+Polynomial.X^3; A*B=C ∧ (∀ n, 0 ≤ A.coeff n) ∧ (∀ n, 0 ≤ B.coeff n) ∧ (∀ n, 0 ≤ C.coeff n) ∧ (∀ n, A.coeff n*A.coeff (n+2) ≤ A.coeff (n+1)^2) ∧ (∀ n, C.coeff n*C.coeff (n+2) ≤ C.coeff (n+1)^2) ∧ B.coeff 1=0 ∧ B.coeff 0*B.coeff 2 > B.coeff 1^2
  )
