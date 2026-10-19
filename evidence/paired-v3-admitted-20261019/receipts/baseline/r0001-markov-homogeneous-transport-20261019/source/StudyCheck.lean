import MathGKM.Target3d4b97e57699c135aaff1dbe
import MathGKM.MarkovLiftR0001
import Lean
def StudyInterface : MathGKM.Target3d4b97e57699c135aaff1dbe.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target3d4b97e57699c135aaff1dbe.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target3d4b97e57699c135aaff1dbe.Goal StudyInterface :=
  (
    MathGKM.Markov.frame_lift_transport
  )
