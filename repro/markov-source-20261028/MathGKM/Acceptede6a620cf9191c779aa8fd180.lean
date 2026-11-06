import MathGKM.Target346da2b2eeff5c07f8acb8f0
import MathGKM.Round61CoefficientA
import Lean
def Acceptede6a620cf9191c779aa8fd180.interface : MathGKM.Target346da2b2eeff5c07f8acb8f0.Interface :=
  (
    True.intro
  )
theorem Acceptede6a620cf9191c779aa8fd180.transport : MathGKM.Target346da2b2eeff5c07f8acb8f0.Transport Acceptede6a620cf9191c779aa8fd180.interface :=
  (
    True.intro
  )
theorem Acceptede6a620cf9191c779aa8fd180.obligation : MathGKM.Target346da2b2eeff5c07f8acb8f0.Goal Acceptede6a620cf9191c779aa8fd180.interface :=
  (
    by
      constructor
      · intro σ w P i j
        exact MatchingSpecializationR61.coefficient_commutation w P i j
      · intro σ w P i j h
        exact MatchingSpecializationR61.zero_tail w P i j h
  )
