import MathGKM.MarkovRecurrenceR0002
import MathGKM.Markov
def MathGKM.Targetce855e627e0caccb08e2ed15.Interface :=
  (
    True
  )
def MathGKM.Targetce855e627e0caccb08e2ed15.Transport (StudyInterface : MathGKM.Targetce855e627e0caccb08e2ed15.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetce855e627e0caccb08e2ed15.Goal (StudyInterface : MathGKM.Targetce855e627e0caccb08e2ed15.Interface) : Prop :=
  (
    ∀ p : List Bool, MathGKM.Markov.H (MathGKM.Markov.advance (MathGKM.Markov.frame p) true).mid = (MathGKM.Markov.u+MathGKM.Markov.v+MathGKM.Markov.w)*MathGKM.Markov.H (MathGKM.Markov.frame p).hi*MathGKM.Markov.H (MathGKM.Markov.frame p).mid - MathGKM.Markov.u^(MathGKM.Markov.frame p).hi.a*MathGKM.Markov.v^(MathGKM.Markov.frame p).hi.b*MathGKM.Markov.w^((MathGKM.Markov.frame p).hi.a+(MathGKM.Markov.frame p).hi.b)*MathGKM.Markov.H (MathGKM.Markov.frame p).lo
  )
