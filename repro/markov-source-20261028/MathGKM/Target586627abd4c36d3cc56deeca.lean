import MathGKM.Round120PacketsA
import MathGKM.Markov
def MathGKM.Target586627abd4c36d3cc56deeca.Interface :=
  (
    True
  )
def MathGKM.Target586627abd4c36d3cc56deeca.Transport (StudyInterface : MathGKM.Target586627abd4c36d3cc56deeca.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target586627abd4c36d3cc56deeca.Goal (StudyInterface : MathGKM.Target586627abd4c36d3cc56deeca.Interface) : Prop :=
  (
    LocalRetilingR76.valid 10 PacketsR120.A ∧ LocalRetilingR76.valid 10 PacketsR120.B ∧
        LocalRetilingR76.dv 10 1 PacketsR120.A=5 ∧ LocalRetilingR76.dv 10 1 PacketsR120.B=5 ∧ LocalRetilingR76.du 1 PacketsR120.A=0 ∧ LocalRetilingR76.du 1 PacketsR120.B=2 ∧
        LocalRetilingR76.valid 10 PacketsR120.A' ∧ LocalRetilingR76.valid 10 PacketsR120.B'' ∧
        LocalRetilingR76.dv 10 1 PacketsR120.A'=5 ∧ LocalRetilingR76.dv 10 1 PacketsR120.B''=5 ∧ LocalRetilingR76.du 1 PacketsR120.A'=1 ∧ LocalRetilingR76.du 1 PacketsR120.B''=1 ∧
        PacketsR120.packet 10 (PacketsR120.A,PacketsR120.B) (PacketsR120.A',PacketsR120.B'')
  )
