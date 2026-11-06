import MathGKM.Round53ExtensionA
import MathGKM.Markov
def MathGKM.Target37616a39fe7b935e5fc5fb17.Interface :=
  (
    True
  )
def MathGKM.Target37616a39fe7b935e5fc5fb17.Transport (StudyInterface : MathGKM.Target37616a39fe7b935e5fc5fb17.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target37616a39fe7b935e5fc5fb17.Goal (StudyInterface : MathGKM.Target37616a39fe7b935e5fc5fb17.Interface) : Prop :=
  (
    (HorizontalR53.R 0=1 ∧ HorizontalR53.R 1=(MathGKM.Markov.U+MathGKM.Markov.V)^2+MathGKM.Markov.U) ∧
    (∀ n : ℕ, 1≤n → HorizontalR53.R n=(MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p) ∧
    (∀ n : ℕ, HorizontalR53.R (n+2)=HorizontalR53.A*HorizontalR53.R (n+1)-MathGKM.Markov.U*MathGKM.Markov.V*HorizontalR53.R n)
  )
