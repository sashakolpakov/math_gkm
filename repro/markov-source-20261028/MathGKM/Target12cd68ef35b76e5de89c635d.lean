import MathGKM.Round120BridgeA
import MathGKM.Markov
def MathGKM.Target12cd68ef35b76e5de89c635d.Interface :=
  (
    True
  )
def MathGKM.Target12cd68ef35b76e5de89c635d.Transport (StudyInterface : MathGKM.Target12cd68ef35b76e5de89c635d.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target12cd68ef35b76e5de89c635d.Goal (StudyInterface : MathGKM.Target12cd68ef35b76e5de89c635d.Interface) : Prop :=
  (
    ∀ (N sigma i t : ℕ) (h : PacketBridgeR120.Injection N sigma i t),
    MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma i t)*MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma (i+2) t) ≤
          MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma (i+1) t)^2
  )
