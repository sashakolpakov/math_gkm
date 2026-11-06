import MathGKM.Round62UniformA
import MathGKM.Markov
def MathGKM.Target8660511eeaca25982474d304.Interface :=
  (
    True
  )
def MathGKM.Target8660511eeaca25982474d304.Transport (StudyInterface : MathGKM.Target8660511eeaca25982474d304.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target8660511eeaca25982474d304.Goal (StudyInterface : MathGKM.Target8660511eeaca25982474d304.Interface) : Prop :=
  (
    (∀ n : ℕ, FiniteMatchingR61.finiteSum (MathGKM.Markov.U+MathGKM.Markov.V) (fun e => if e % 2 = 0 then MathGKM.Markov.U else MathGKM.Markov.V) (2*n)=HorizontalR53.R n) ∧ (∀ n : ℕ, 1≤n → FiniteMatchingR61.finiteSum (MathGKM.Markov.U+MathGKM.Markov.V) (fun e => if e % 2 = 0 then MathGKM.Markov.U else MathGKM.Markov.V) (2*n)=(MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p)
  )
