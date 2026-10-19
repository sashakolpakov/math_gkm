import MathGKM.MarkovPathUniqueR0003
import MathGKM.Markov
def MathGKM.Target1c4449b664394590e10366eb.Interface :=
  (
    True
  )
def MathGKM.Target1c4449b664394590e10366eb.Transport (StudyInterface : MathGKM.Target1c4449b664394590e10366eb.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target1c4449b664394590e10366eb.Goal (StudyInterface : MathGKM.Target1c4449b664394590e10366eb.Interface) : Prop :=
  (
    ∀ p q : List Bool, (MathGKM.Markov.frame p).mid.a * (MathGKM.Markov.frame q).mid.b = (MathGKM.Markov.frame q).mid.a * (MathGKM.Markov.frame p).mid.b → p = q
  )
