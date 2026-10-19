import MathGKM.Target8ba2a17bcf7e1b519f5c003a
import MathGKM.MarkovLaurent
import Lean
def StudyInterface : MathGKM.Target8ba2a17bcf7e1b519f5c003a.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target8ba2a17bcf7e1b519f5c003a.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target8ba2a17bcf7e1b519f5c003a.Goal StudyInterface :=
  (
    @MathGKM.Markov.affine_source_covers_rationals
  )
