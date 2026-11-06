import MathGKM.Round37MarginalInterfaceA
import MathGKM.Markov
def MathGKM.Target51712eb9e060f0873b5ae076.Interface :=
  (
    True
  )
def MathGKM.Target51712eb9e060f0873b5ae076.Transport (StudyInterface : MathGKM.Target51712eb9e060f0873b5ae076.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target51712eb9e060f0873b5ae076.Goal (StudyInterface : MathGKM.Target51712eb9e060f0873b5ae076.Interface) : Prop :=
  (
    ∀ f g b : ℤ →₀ ℤ, MidpointMarginalR36.Compatible f g b → MidpointMarginalR36.mass f*MidpointMarginalR36.mass g ≤ MidpointMarginalR36.mass b^2
  )
