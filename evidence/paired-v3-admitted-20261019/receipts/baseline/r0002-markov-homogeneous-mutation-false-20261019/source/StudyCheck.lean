import MathGKM.Target7d1fc3912f0bf1eebb4df361
import MathGKM.MarkovRecurrenceR0002
import Lean
def StudyInterface : MathGKM.Target7d1fc3912f0bf1eebb4df361.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target7d1fc3912f0bf1eebb4df361.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target7d1fc3912f0bf1eebb4df361.Goal StudyInterface :=
  (
    MathGKM.Markov.mutation_false
  )
