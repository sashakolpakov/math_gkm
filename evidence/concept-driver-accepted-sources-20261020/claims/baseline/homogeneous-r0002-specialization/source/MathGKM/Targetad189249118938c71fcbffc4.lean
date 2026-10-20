import MathGKM.HomogeneousBridgeR2
import MathGKM.Markov
def MathGKM.Targetad189249118938c71fcbffc4.Interface :=
  (
    True
  )
def MathGKM.Targetad189249118938c71fcbffc4.Transport (StudyInterface : MathGKM.Targetad189249118938c71fcbffc4.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetad189249118938c71fcbffc4.Goal (StudyInterface : MathGKM.Targetad189249118938c71fcbffc4.Interface) : Prop :=
  (
    ∀ path : List Bool,
        MathGKM.HomogeneousBridgeR2.specializeFrame (MathGKM.HomogeneousBridgeR2.frame path) = MathGKM.Markov.frame path
  )
