import MathGKM.MarkovNumeratorR0002
import MathGKM.Markov
def MathGKM.Targetffebb1929ea3301b1156d817.Interface :=
  (
    True
  )
def MathGKM.Targetffebb1929ea3301b1156d817.Transport (StudyInterface : MathGKM.Targetffebb1929ea3301b1156d817.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetffebb1929ea3301b1156d817.Goal (StudyInterface : MathGKM.Targetffebb1929ea3301b1156d817.Interface) : Prop :=
  (
    MathGKM.Markov.H MathGKM.Markov.initial.lo = 1 ∧ MathGKM.Markov.H MathGKM.Markov.initial.mid = (MathGKM.Markov.u+MathGKM.Markov.v)^2+MathGKM.Markov.u*MathGKM.Markov.w ∧ MathGKM.Markov.H MathGKM.Markov.initial.hi = MathGKM.Markov.u+MathGKM.Markov.v ∧ ∀ p : List Bool, MathGKM.Markov.numeratorFrame p = MathGKM.Markov.liftedFrame (MathGKM.Markov.frame p)
  )
