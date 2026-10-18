import MathGKM.MarkovLeftCoefficients0002
import MathGKM.Markov
def MathGKM.Target93dc0c0cc0367f6aac6f0d33.Interface :=
  (
    True
  )
def MathGKM.Target93dc0c0cc0367f6aac6f0d33.Transport (StudyInterface : MathGKM.Target93dc0c0cc0367f6aac6f0d33.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target93dc0c0cc0367f6aac6f0d33.Goal (StudyInterface : MathGKM.Target93dc0c0cc0367f6aac6f0d33.Interface) : Prop :=
  (
    ∀ n i j : ℕ, MathGKM.Markov.coeff (MathGKM.Markov.LeftBranch0001.Q n) i j = MathGKM.Markov.LeftBranch0001.rawFormula n i j
  )
