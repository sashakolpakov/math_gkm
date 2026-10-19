import MathGKM.MarkovTopLC
import MathGKM.Markov
def MathGKM.Target08dece41e56eedf51de3b86c.Interface :=
  (
    True
  )
def MathGKM.Target08dece41e56eedf51de3b86c.Transport (StudyInterface : MathGKM.Target08dece41e56eedf51de3b86c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target08dece41e56eedf51de3b86c.Goal (StudyInterface : MathGKM.Target08dece41e56eedf51de3b86c.Interface) : Prop :=
  (
    ∀ path : List Bool, MathGKM.Markov.LabelTopLC (MathGKM.Markov.frame path).lo ∧ MathGKM.Markov.LabelTopLC (MathGKM.Markov.frame path).mid ∧ MathGKM.Markov.LabelTopLC (MathGKM.Markov.frame path).hi
  )
