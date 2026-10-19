import MathGKM.MarkovTopBoundary
import MathGKM.Markov
def MathGKM.Target1abf618da05fbbe373564629.Interface :=
  (
    True
  )
def MathGKM.Target1abf618da05fbbe373564629.Transport (StudyInterface : MathGKM.Target1abf618da05fbbe373564629.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target1abf618da05fbbe373564629.Goal (StudyInterface : MathGKM.Target1abf618da05fbbe373564629.Interface) : Prop :=
  (
    ∀ path : List Bool, (∀ i j, i+j=(MathGKM.Markov.frame path).lo.a+(MathGKM.Markov.frame path).lo.b-1 → MathGKM.Markov.coeff (MathGKM.Markov.frame path).lo.p i j = (Nat.choose ((MathGKM.Markov.frame path).lo.a+(MathGKM.Markov.frame path).lo.b-1) i : ℤ)) ∧ (∀ i j, i+j=(MathGKM.Markov.frame path).mid.a+(MathGKM.Markov.frame path).mid.b-1 → MathGKM.Markov.coeff (MathGKM.Markov.frame path).mid.p i j = (Nat.choose ((MathGKM.Markov.frame path).mid.a+(MathGKM.Markov.frame path).mid.b-1) i : ℤ)) ∧ (∀ i j, i+j=(MathGKM.Markov.frame path).hi.a+(MathGKM.Markov.frame path).hi.b-1 → MathGKM.Markov.coeff (MathGKM.Markov.frame path).hi.p i j = (Nat.choose ((MathGKM.Markov.frame path).hi.a+(MathGKM.Markov.frame path).hi.b-1) i : ℤ))
  )
