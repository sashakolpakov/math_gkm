import MathGKM.Round53ControlA
import MathGKM.Markov
def MathGKM.Targetbb1899477ff3ac786222b87a.Interface :=
  (
    True
  )
def MathGKM.Targetbb1899477ff3ac786222b87a.Transport (StudyInterface : MathGKM.Targetbb1899477ff3ac786222b87a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetbb1899477ff3ac786222b87a.Goal (StudyInterface : MathGKM.Targetbb1899477ff3ac786222b87a.Interface) : Prop :=
  (
    (∀ j : ℕ, RealRowR52.Factorized (RealRowR52.realRow HorizontalR53.A j)) ∧
    (∀ j : ℕ, RealRowR52.Factorized (RealRowR52.realRow HorizontalR53.B j)) ∧
    RealRowR52.realRow (HorizontalR53.A*HorizontalR53.B) 2=Polynomial.X^2+Polynomial.X+2 ∧
    (RealRowR52.realRow (HorizontalR53.A*HorizontalR53.B) 2).coeff 0=2 ∧
    (RealRowR52.realRow (HorizontalR53.A*HorizontalR53.B) 2).coeff 1=1 ∧
    (RealRowR52.realRow (HorizontalR53.A*HorizontalR53.B) 2).coeff 2=1 ∧
    ¬RealRowR52.Factorized (RealRowR52.realRow (HorizontalR53.A*HorizontalR53.B) 2)
  )
