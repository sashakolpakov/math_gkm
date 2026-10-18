import MathGKM.MarkovLeftBranch0001
import MathGKM.Markov
def MathGKM.Target29afbfe864de98b5d01fd5bf.Interface :=
  (
    True
  )
def MathGKM.Target29afbfe864de98b5d01fd5bf.Transport (StudyInterface : MathGKM.Target29afbfe864de98b5d01fd5bf.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target29afbfe864de98b5d01fd5bf.Goal (StudyInterface : MathGKM.Target29afbfe864de98b5d01fd5bf.Interface) : Prop :=
  (
    ∀ k : ℕ, (MathGKM.Markov.frame (List.replicate k false)).mid.a = 1 ∧ (MathGKM.Markov.frame (List.replicate k false)).mid.b = k+2 ∧ (MathGKM.Markov.frame (List.replicate k false)).mid.p = MathGKM.Markov.LeftBranch0001.Q (k+2)
  )
