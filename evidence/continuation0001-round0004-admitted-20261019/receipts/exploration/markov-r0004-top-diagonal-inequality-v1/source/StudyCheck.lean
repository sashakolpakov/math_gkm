import MathGKM.Target08dece41e56eedf51de3b86c
import MathGKM.MarkovTopLC
import Lean
def StudyInterface : MathGKM.Target08dece41e56eedf51de3b86c.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target08dece41e56eedf51de3b86c.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target08dece41e56eedf51de3b86c.Goal StudyInterface :=
  (
    MathGKM.Markov.all_frame_top_diagonal
  )
