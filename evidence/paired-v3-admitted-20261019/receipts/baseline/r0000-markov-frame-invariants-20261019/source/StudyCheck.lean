import MathGKM.Targete2acb94e473db39f8642f450
import MathGKM.MarkovCoverageR0000
import Lean
def StudyInterface : MathGKM.Targete2acb94e473db39f8642f450.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targete2acb94e473db39f8642f450.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targete2acb94e473db39f8642f450.Goal StudyInterface :=
  (
    fun p => ⟨MathGKM.Markov.frame_farey p, MathGKM.Markov.frame_adjacent_determinants p⟩
  )
