import MathGKM.MarkovSupport
import MathGKM.Markov
def MathGKM.Target608a50d31c0f52e5f2a6d5c6.Interface :=
  (
    True
  )
def MathGKM.Target608a50d31c0f52e5f2a6d5c6.Transport (StudyInterface : MathGKM.Target608a50d31c0f52e5f2a6d5c6.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target608a50d31c0f52e5f2a6d5c6.Goal (StudyInterface : MathGKM.Target608a50d31c0f52e5f2a6d5c6.Interface) : Prop :=
  (
    ∀ path : List Bool, (∀ i j, (MathGKM.Markov.frame path).lo.a + (MathGKM.Markov.frame path).lo.b - 1 < i+j → MathGKM.Markov.coeff (MathGKM.Markov.frame path).lo.p i j = 0) ∧ (∀ i j, (MathGKM.Markov.frame path).mid.a + (MathGKM.Markov.frame path).mid.b - 1 < i+j → MathGKM.Markov.coeff (MathGKM.Markov.frame path).mid.p i j = 0) ∧ (∀ i j, (MathGKM.Markov.frame path).hi.a + (MathGKM.Markov.frame path).hi.b - 1 < i+j → MathGKM.Markov.coeff (MathGKM.Markov.frame path).hi.p i j = 0)
  )
