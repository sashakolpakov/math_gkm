import MathGKM.Targetf06b6162d5f620cdedf13b72
import MathGKM.MarkovTopReduction
import Lean
def StudyInterface : MathGKM.Targetf06b6162d5f620cdedf13b72.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetf06b6162d5f620cdedf13b72.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetf06b6162d5f620cdedf13b72.Goal StudyInterface :=
  (
    MathGKM.Markov.top_boundary_reduction
  )
