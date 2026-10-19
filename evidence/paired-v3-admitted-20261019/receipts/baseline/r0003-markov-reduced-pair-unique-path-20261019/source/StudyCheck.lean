import MathGKM.Target3c738e0623a5f26e6e8c739e
import MathGKM.MarkovIndexR0003
import Lean
def StudyInterface : MathGKM.Target3c738e0623a5f26e6e8c739e.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target3c738e0623a5f26e6e8c739e.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target3c738e0623a5f26e6e8c739e.Goal StudyInterface :=
  (
    MathGKM.Markov.reduced_pair_unique_path
  )
