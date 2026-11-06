import MathGKM.Round28RecoveryA
import MathGKM.Markov
def MathGKM.Target9defed8a45b064c9c5843474.Interface :=
  (
    True
  )
def MathGKM.Target9defed8a45b064c9c5843474.Transport (StudyInterface : MathGKM.Target9defed8a45b064c9c5843474.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target9defed8a45b064c9c5843474.Goal (StudyInterface : MathGKM.Target9defed8a45b064c9c5843474.Interface) : Prop :=
  (
    (∀ k : ℕ,
      let f := MathGKM.Markov.frame (List.replicate k false)
      f.lo=⟨0,1,1⟩ ∧ f.mid.a=1 ∧ f.mid.b=k+2 ∧
        f.mid.p=RenewalR28.P (k+2) ∧ f.hi.p=RenewalR28.P (k+1)) ∧ (((1-PowerSeries.X)*(1-PowerSeries.C MathGKM.Markov.V*PowerSeries.X)-
        PowerSeries.C MathGKM.Markov.U*PowerSeries.X)*PowerSeries.mk RenewalR28.P=1-PowerSeries.X) ∧ (∀ b : ℕ, 1≤b → ∀ i j : ℕ,
      MathGKM.Markov.coeff (RenewalR28.P b) i j=
        if i=0 then (if j=b then 1 else 0) else
        if i+j≤b then ((i+j).choose i : ℤ)*((b-j-1).choose (i-1) : ℤ) else 0) ∧ (∀ k i j : ℕ,
      MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate k false)).mid.p i j=
        if i=0 then (if j=k+2 then 1 else 0) else
        if i+j≤k+2 then ((i+j).choose i : ℤ)*((k+2-j-1).choose (i-1) : ℤ) else 0)
  )
