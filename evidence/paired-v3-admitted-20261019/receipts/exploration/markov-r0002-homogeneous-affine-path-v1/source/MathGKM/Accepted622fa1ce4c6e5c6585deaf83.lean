import MathGKM.Target1185f34c19195761b8c8d73a
import MathGKM.MarkovRecurrence
import Lean
def Accepted622fa1ce4c6e5c6585deaf83.interface : MathGKM.Target1185f34c19195761b8c8d73a.Interface :=
  (
    True.intro
  )
theorem Accepted622fa1ce4c6e5c6585deaf83.transport : MathGKM.Target1185f34c19195761b8c8d73a.Transport Accepted622fa1ce4c6e5c6585deaf83.interface :=
  (
    True.intro
  )
theorem Accepted622fa1ce4c6e5c6585deaf83.obligation : MathGKM.Target1185f34c19195761b8c8d73a.Goal Accepted622fa1ce4c6e5c6585deaf83.interface :=
  (
    MathGKM.Markov.recurrence_covers_rationals
  )
