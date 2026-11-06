import MathGKM.Round108SubmissionA
import MathGKM.Markov
def MathGKM.Targetcb7b4462ac957484dd05554a.Interface :=
  (
    True
  )
def MathGKM.Targetcb7b4462ac957484dd05554a.Transport (StudyInterface : MathGKM.Targetcb7b4462ac957484dd05554a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetcb7b4462ac957484dd05554a.Goal (StudyInterface : MathGKM.Targetcb7b4462ac957484dd05554a.Interface) : Prop :=
  (
    (∀ (N sigma t L : ℕ) (z w : LocalRetilingR76.Pair),
      ColorForgettingR108.edge N sigma t L z w →
      LocalRetilingR76.dv N sigma z.1=LocalRetilingR76.dv N sigma w.1 ∧
      LocalRetilingR76.dv N sigma z.2=LocalRetilingR76.dv N sigma w.2 ∧
      LocalRetilingR76.du sigma z.1+LocalRetilingR76.du sigma z.2=
        LocalRetilingR76.du sigma w.1+LocalRetilingR76.du sigma w.2) ∧
    (∀ (N sigma t L : ℕ) (C : Finset LocalRetilingR76.Pair),
      (∀ z ∈ C, ColorForgettingR108.fiber N sigma t L z) →
      (∀ z ∈ C, ∀ w, ColorForgettingR108.edge N sigma t L z w → w ∈ C) →
      ∀ r : ℕ, r≤L →
      (C.filter (fun z => LocalRetilingR76.rank sigma z=r)).card =
        (C.filter (fun z => LocalRetilingR76.rank sigma z=L-r)).card)
  )
