import MathGKM.Target79a428e033d36adf5fa527fb
import MathGKM.MarkovHomogeneous
import Lean
def StudyInterface : MathGKM.Target79a428e033d36adf5fa527fb.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target79a428e033d36adf5fa527fb.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target79a428e033d36adf5fa527fb.Goal StudyInterface :=
  (
    MathGKM.Markov.homogeneous_lift_laws
  )
