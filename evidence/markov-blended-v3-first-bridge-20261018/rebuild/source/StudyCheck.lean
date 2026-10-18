import MathGKM.Target29afbfe864de98b5d01fd5bf
import MathGKM.MarkovLeftBranch0001
import Lean
def StudyInterface : MathGKM.Target29afbfe864de98b5d01fd5bf.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target29afbfe864de98b5d01fd5bf.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target29afbfe864de98b5d01fd5bf.Goal StudyInterface :=
  (
    MathGKM.Markov.LeftBranch0001.mid_left
  )
