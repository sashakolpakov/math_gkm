import MathGKM.Target608a50d31c0f52e5f2a6d5c6
import MathGKM.MarkovSupport
import Lean
def StudyInterface : MathGKM.Target608a50d31c0f52e5f2a6d5c6.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target608a50d31c0f52e5f2a6d5c6.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target608a50d31c0f52e5f2a6d5c6.Goal StudyInterface :=
  (
    MathGKM.Markov.all_frame_coeff_zero
  )
