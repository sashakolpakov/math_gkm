import MathGKM.Target2ac2c3a3edad6c28d9f633f6
import MathGKM.MarkovIndexR0003
import Lean
def StudyInterface : MathGKM.Target2ac2c3a3edad6c28d9f633f6.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target2ac2c3a3edad6c28d9f633f6.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target2ac2c3a3edad6c28d9f633f6.Goal StudyInterface :=
  (
    MathGKM.Markov.reduced_pair_unique_numerator_lift
  )
