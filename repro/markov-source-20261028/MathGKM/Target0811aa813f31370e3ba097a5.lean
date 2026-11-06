import MathGKM.Round28RenewalA
import MathGKM.Markov
def MathGKM.Target0811aa813f31370e3ba097a5.Interface :=
  (
    True
  )
def MathGKM.Target0811aa813f31370e3ba097a5.Transport (StudyInterface : MathGKM.Target0811aa813f31370e3ba097a5.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target0811aa813f31370e3ba097a5.Goal (StudyInterface : MathGKM.Target0811aa813f31370e3ba097a5.Interface) : Prop :=
  (
    RenewalR28.Nonnegative (1+MathGKM.Markov.U^2) ∧
      RenewalR28.Nonnegative (0 : MathGKM.Markov.BiPoly) ∧ RenewalR28.Nonnegative (1 : MathGKM.Markov.BiPoly) ∧
      (RenewalR28.state (1+MathGKM.Markov.U^2) (0 : MathGKM.Markov.BiPoly) 0 1 0 1).1=1+MathGKM.Markov.U^2 ∧
      MathGKM.Markov.coeff (1+MathGKM.Markov.U^2) 0 0=1 ∧ MathGKM.Markov.coeff (1+MathGKM.Markov.U^2) 1 0=0 ∧
      MathGKM.Markov.coeff (1+MathGKM.Markov.U^2) 2 0=1 ∧
      MathGKM.Markov.coeff (1+MathGKM.Markov.U^2) 0 0*MathGKM.Markov.coeff (1+MathGKM.Markov.U^2) 2 0>
        MathGKM.Markov.coeff (1+MathGKM.Markov.U^2) 1 0^2
  )
