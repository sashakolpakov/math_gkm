import MathGKM.Round122MassA
import MathGKM.Markov
def MathGKM.Target3f2a3c9065dfa986d8d0b006.Interface :=
  (
    True
  )
def MathGKM.Target3f2a3c9065dfa986d8d0b006.Transport (StudyInterface : MathGKM.Target3f2a3c9065dfa986d8d0b006.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3f2a3c9065dfa986d8d0b006.Goal (StudyInterface : MathGKM.Target3f2a3c9065dfa986d8d0b006.Interface) : Prop :=
  (
    ∀ (N sigma i t : ℕ), EqualMassR122.PacketLoad N sigma i t →
      MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma i t) *
        MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma (i+2) t) ≤
        MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma (i+1) t)^2
  )
