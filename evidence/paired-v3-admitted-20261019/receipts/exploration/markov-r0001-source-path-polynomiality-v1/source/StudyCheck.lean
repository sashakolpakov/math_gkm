import MathGKM.Target5b0d9b1632ccd0ca16466ff3
import MathGKM.MarkovSquareEmbedding
import Lean
def StudyInterface : MathGKM.Target5b0d9b1632ccd0ca16466ff3.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Target5b0d9b1632ccd0ca16466ff3.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Target5b0d9b1632ccd0ca16466ff3.Goal StudyInterface :=
  (
    MathGKM.Markov.source_path_polynomiality
  )
