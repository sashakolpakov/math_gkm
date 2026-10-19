import MathGKM.MarkovSquareEmbedding
import MathGKM.Markov
def MathGKM.Target5b0d9b1632ccd0ca16466ff3.Interface :=
  (
    True
  )
def MathGKM.Target5b0d9b1632ccd0ca16466ff3.Transport (StudyInterface : MathGKM.Target5b0d9b1632ccd0ca16466ff3.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5b0d9b1632ccd0ca16466ff3.Goal (StudyInterface : MathGKM.Target5b0d9b1632ccd0ca16466ff3.Interface) : Prop :=
  (
    ∀ path : List Bool, MathGKM.Markov.squareEmbedding (MathGKM.Markov.frame path).mid.p = MathGKM.Markov.affineDen MathGKM.Markov.affineX MathGKM.Markov.affineY (MathGKM.Markov.frame path).mid.a (MathGKM.Markov.frame path).mid.b * (MathGKM.Markov.affineLaurentFrame MathGKM.Markov.affineX MathGKM.Markov.affineY path).mid
  )
