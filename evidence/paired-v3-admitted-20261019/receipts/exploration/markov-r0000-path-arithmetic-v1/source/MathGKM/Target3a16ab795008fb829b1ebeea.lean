import MathGKM.MarkovCoverage
import MathGKM.Markov
def MathGKM.Target3a16ab795008fb829b1ebeea.Interface :=
  (
    True
  )
def MathGKM.Target3a16ab795008fb829b1ebeea.Transport (StudyInterface : MathGKM.Target3a16ab795008fb829b1ebeea.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3a16ab795008fb829b1ebeea.Goal (StudyInterface : MathGKM.Target3a16ab795008fb829b1ebeea.Interface) : Prop :=
  (
    ∀ path : List Bool, MathGKM.Markov.FrameInvariant (MathGKM.Markov.frame path) ∧ (0 < (MathGKM.Markov.frame path).mid.b ∧ (MathGKM.Markov.frame path).mid.a ≤ (MathGKM.Markov.frame path).mid.b) ∧ Nat.Coprime (MathGKM.Markov.frame path).lo.a (MathGKM.Markov.frame path).lo.b ∧ Nat.Coprime (MathGKM.Markov.frame path).mid.a (MathGKM.Markov.frame path).mid.b ∧ Nat.Coprime (MathGKM.Markov.frame path).hi.a (MathGKM.Markov.frame path).hi.b
  )
