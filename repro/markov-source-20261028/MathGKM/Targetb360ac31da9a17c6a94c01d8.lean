import MathGKM.Round50HorizontalA
import MathGKM.Markov
def MathGKM.Targetb360ac31da9a17c6a94c01d8.Interface :=
  (
    True
  )
def MathGKM.Targetb360ac31da9a17c6a94c01d8.Transport (StudyInterface : MathGKM.Targetb360ac31da9a17c6a94c01d8.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb360ac31da9a17c6a94c01d8.Goal (StudyInterface : MathGKM.Targetb360ac31da9a17c6a94c01d8.Interface) : Prop :=
  (
    ∀ n : ℕ, 1≤n →
    let P := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p
    (∀ r : ℕ, MathGKM.Markov.coeff P (n+r) 1 =
      (3*(n:ℤ)-(r:ℤ)-1)*((n-1).choose r:ℤ)) ∧
    (∀ i : ℕ, i<n → MathGKM.Markov.coeff P i 1=0)
  )
