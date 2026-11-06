import MathGKM.Round42CornerA
import MathGKM.Markov
def MathGKM.Target5151c0346e698f55d5345790.Interface :=
  (
    True
  )
def MathGKM.Target5151c0346e698f55d5345790.Transport (StudyInterface : MathGKM.Target5151c0346e698f55d5345790.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5151c0346e698f55d5345790.Goal (StudyInterface : MathGKM.Target5151c0346e698f55d5345790.Interface) : Prop :=
  (
    ∀ n : ℕ, 2 ≤ n → let P := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p; MathGKM.Markov.coeff P n 0=1 ∧ MathGKM.Markov.coeff P n 1=3*(n:ℤ)-1 ∧ 2*MathGKM.Markov.coeff P n 2=17*(n:ℤ)^2-45*(n:ℤ)+34 ∧ 2*(MathGKM.Markov.coeff P n 1^2-MathGKM.Markov.coeff P n 0*MathGKM.Markov.coeff P n 2)=(n:ℤ)^2+33*(n:ℤ)-32 ∧ 0 < MathGKM.Markov.coeff P n 1^2-MathGKM.Markov.coeff P n 0*MathGKM.Markov.coeff P n 2
  )
