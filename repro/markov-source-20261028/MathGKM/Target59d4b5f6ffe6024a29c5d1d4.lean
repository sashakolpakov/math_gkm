import MathGKM.Round121SubmissionA
import MathGKM.Markov
def MathGKM.Target59d4b5f6ffe6024a29c5d1d4.Interface :=
  (
    True
  )
def MathGKM.Target59d4b5f6ffe6024a29c5d1d4.Transport (StudyInterface : MathGKM.Target59d4b5f6ffe6024a29c5d1d4.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target59d4b5f6ffe6024a29c5d1d4.Goal (StudyInterface : MathGKM.Target59d4b5f6ffe6024a29c5d1d4.Interface) : Prop :=
  (
    ∀ (N sigma : ℕ) (o : LocalRetilingR76.Obj) (ho : LocalRetilingR76.valid N o),
    LocalRetilingR76.du sigma o + LocalRetilingR76.dv N sigma o + o.1.card = N
  )
