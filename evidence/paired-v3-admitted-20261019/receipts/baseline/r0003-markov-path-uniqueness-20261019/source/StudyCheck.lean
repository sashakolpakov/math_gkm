import MathGKM.Target1c4449b664394590e10366eb
import MathGKM.MarkovPathUniqueR0003
import Lean
def StudyInterface : MathGKM.Target1c4449b664394590e10366eb.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target1c4449b664394590e10366eb.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target1c4449b664394590e10366eb.Goal StudyInterface :=
  (
    MathGKM.Markov.frame_path_unique
  )
