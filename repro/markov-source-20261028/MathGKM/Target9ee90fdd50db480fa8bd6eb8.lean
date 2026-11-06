import MathGKM.Round36RecoveryInterfaceA
import MathGKM.Markov
def MathGKM.Target9ee90fdd50db480fa8bd6eb8.Interface :=
  (
    True
  )
def MathGKM.Target9ee90fdd50db480fa8bd6eb8.Transport (StudyInterface : MathGKM.Target9ee90fdd50db480fa8bd6eb8.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target9ee90fdd50db480fa8bd6eb8.Goal (StudyInterface : MathGKM.Target9ee90fdd50db480fa8bd6eb8.Interface) : Prop :=
  (
    ∀ n : ℕ, 1 ≤ n → ∀ i j : ℕ, MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j = Finset.sum (Finset.range (n+1)) (fun s => MidpointR36.W n i j s)
  )
