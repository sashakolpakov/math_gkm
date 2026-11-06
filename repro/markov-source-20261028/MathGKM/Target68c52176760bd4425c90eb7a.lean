import MathGKM.Round28ActualRunA
import MathGKM.Markov
def MathGKM.Target68c52176760bd4425c90eb7a.Interface :=
  (
    True
  )
def MathGKM.Target68c52176760bd4425c90eb7a.Transport (StudyInterface : MathGKM.Target68c52176760bd4425c90eb7a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target68c52176760bd4425c90eb7a.Goal (StudyInterface : MathGKM.Target68c52176760bd4425c90eb7a.Interface) : Prop :=
  (
    (∀ H r q m g : MathGKM.Markov.BiPoly,
      (1-PowerSeries.C (H+r+q)*PowerSeries.X+PowerSeries.C (r*q)*PowerSeries.X^2)*
        RenewalR28.series H r q m g =
      (1-PowerSeries.C q*PowerSeries.X)*PowerSeries.C m+PowerSeries.C (q*g)*PowerSeries.X) ∧ (∀ (f : MathGKM.Markov.Frame) (branch : Bool),
      let F := if branch then f.hi else f.lo
      let O := if branch then f.lo else f.hi
      let r := if branch then MathGKM.Markov.U^F.a else MathGKM.Markov.V^F.b
      let q := if branch then MathGKM.Markov.V^F.b else MathGKM.Markov.U^F.a
      let H := MathGKM.Markov.S*F.p-r-q
      let run := fun n : ℕ => (fun g : MathGKM.Markov.Frame => MathGKM.Markov.advance g branch)^[n] f
      (1-PowerSeries.C (H+r+q)*PowerSeries.X+PowerSeries.C (r*q)*PowerSeries.X^2)*
        PowerSeries.mk (fun n => (run n).mid.p) =
      (1-PowerSeries.C q*PowerSeries.X)*PowerSeries.C f.mid.p+
        PowerSeries.C (q*(f.mid.p-r*O.p))*PowerSeries.X)
  )
