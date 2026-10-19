import MathGKM.Target83728fd4a693cb3b2ee42a35
import MathGKM.MarkovSubleading
import Lean
def StudyInterface : MathGKM.Target83728fd4a693cb3b2ee42a35.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target83728fd4a693cb3b2ee42a35.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target83728fd4a693cb3b2ee42a35.Goal StudyInterface :=
  (
    MathGKM.Markov.middle_subleading_component
  )
