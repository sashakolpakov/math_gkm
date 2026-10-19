import MathGKM.MarkovRecurrenceR0002
import MathGKM.Markov
def MathGKM.Target7d1fc3912f0bf1eebb4df361.Interface :=
  (
    True
  )
def MathGKM.Target7d1fc3912f0bf1eebb4df361.Transport (StudyInterface : MathGKM.Target7d1fc3912f0bf1eebb4df361.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target7d1fc3912f0bf1eebb4df361.Goal (StudyInterface : MathGKM.Target7d1fc3912f0bf1eebb4df361.Interface) : Prop :=
  (
    ∀ p : List Bool, MathGKM.Markov.H (MathGKM.Markov.advance (MathGKM.Markov.frame p) false).mid = (MathGKM.Markov.u+MathGKM.Markov.v+MathGKM.Markov.w)*MathGKM.Markov.H (MathGKM.Markov.frame p).lo*MathGKM.Markov.H (MathGKM.Markov.frame p).mid - MathGKM.Markov.u^(MathGKM.Markov.frame p).lo.a*MathGKM.Markov.v^(MathGKM.Markov.frame p).lo.b*MathGKM.Markov.w^((MathGKM.Markov.frame p).lo.a+(MathGKM.Markov.frame p).lo.b)*MathGKM.Markov.H (MathGKM.Markov.frame p).hi
  )
