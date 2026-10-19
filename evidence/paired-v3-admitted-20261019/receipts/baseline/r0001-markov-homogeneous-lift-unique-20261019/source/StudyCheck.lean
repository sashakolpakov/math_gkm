import MathGKM.Target783f8ff59991b8f35478c85b
import MathGKM.MarkovLiftUniqueR0001
import Lean
def StudyInterface : MathGKM.Target783f8ff59991b8f35478c85b.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target783f8ff59991b8f35478c85b.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target783f8ff59991b8f35478c85b.Goal StudyInterface :=
  (
    MathGKM.Markov.homogeneous_lift_unique
  )
