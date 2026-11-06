import MathGKM.Round121SubmissionA
import MathGKM.Markov
def MathGKM.Target19c1a6d9f3413888c5e7e4d7.Interface :=
  (
    True
  )
def MathGKM.Target19c1a6d9f3413888c5e7e4d7.Transport (StudyInterface : MathGKM.Target19c1a6d9f3413888c5e7e4d7.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target19c1a6d9f3413888c5e7e4d7.Goal (StudyInterface : MathGKM.Target19c1a6d9f3413888c5e7e4d7.Interface) : Prop :=
  (
    ∀ (N sigma r t : ℕ) (z w : LocalRetilingR76.Pair)
        (hz : LocalRetilingR76.valid N z.1 ∧ LocalRetilingR76.valid N z.2)
        (hw : LocalRetilingR76.valid N w.1 ∧ LocalRetilingR76.valid N w.2)
        (hd : LocalRetilingR76.du sigma z.1=r ∧ LocalRetilingR76.du sigma z.2=r+2 ∧
          LocalRetilingR76.du sigma w.1=r+1 ∧ LocalRetilingR76.du sigma w.2=r+1 ∧
          LocalRetilingR76.dv N sigma z.1=t ∧ LocalRetilingR76.dv N sigma z.2=t ∧
          LocalRetilingR76.dv N sigma w.1=t ∧ LocalRetilingR76.dv N sigma w.2=t),
    PacketsR120.packet N z w ↔
          (PacketStructureR121.splitEdit N z.1 w.1 ∧ PacketStructureR121.joinRepair N z.2 w.2) ∨
          (PacketStructureR121.splitRepair N z.1 w.1 ∧ PacketStructureR121.joinEdit N z.2 w.2)
  )
