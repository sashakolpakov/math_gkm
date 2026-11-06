import MathGKM.Round53RowsA
import MathGKM.Markov
def MathGKM.Targetb6243198ce99fa5e7dcb55de.Interface :=
  (
    True
  )
def MathGKM.Targetb6243198ce99fa5e7dcb55de.Transport (StudyInterface : MathGKM.Targetb6243198ce99fa5e7dcb55de.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb6243198ce99fa5e7dcb55de.Goal (StudyInterface : MathGKM.Targetb6243198ce99fa5e7dcb55de.Interface) : Prop :=
  (
    (∀ n j : ℕ,
      RealRowR52.realRow (HorizontalR53.R (n+2)) j=
        (Polynomial.X^2+Polynomial.X)*RealRowR52.realRow (HorizontalR53.R (n+1)) j+
        (if 1≤j then (2*Polynomial.X+1)*RealRowR52.realRow (HorizontalR53.R (n+1)) (j-1) else 0)+
        (if 2≤j then RealRowR52.realRow (HorizontalR53.R (n+1)) (j-2) else 0)-
        (if 1≤j then Polynomial.X*RealRowR52.realRow (HorizontalR53.R n) (j-1) else 0)) ∧
    (∀ n j : ℕ, 1≤n →
      RealRowR52.realRow (MathGKM.Markov.frame (List.replicate (n+1) true)).mid.p j=
        (Polynomial.X^2+Polynomial.X)*RealRowR52.realRow (MathGKM.Markov.frame (List.replicate n true)).mid.p j+
        (if 1≤j then (2*Polynomial.X+1)*RealRowR52.realRow (MathGKM.Markov.frame (List.replicate n true)).mid.p (j-1) else 0)+
        (if 2≤j then RealRowR52.realRow (MathGKM.Markov.frame (List.replicate n true)).mid.p (j-2) else 0)-
        (if 1≤j then Polynomial.X*RealRowR52.realRow (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p (j-1) else 0))
  )
