import MathGKM.Round76RetilingA
import MathGKM.Markov
def MathGKM.Target4ebf960f96654d2066377da7.Interface :=
  (
    True
  )
def MathGKM.Target4ebf960f96654d2066377da7.Transport (StudyInterface : MathGKM.Target4ebf960f96654d2066377da7.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target4ebf960f96654d2066377da7.Goal (StudyInterface : MathGKM.Target4ebf960f96654d2066377da7.Interface) : Prop :=
  (
    (∀ (N sigma j L a b : ℕ) (z w : LocalRetilingR76.Pair), LocalRetilingR76.edge N sigma j L a b z w → LocalRetilingR76.dv N sigma z.1=LocalRetilingR76.dv N sigma w.1 ∧ LocalRetilingR76.dv N sigma z.2=LocalRetilingR76.dv N sigma w.2 ∧ LocalRetilingR76.du sigma z.1+LocalRetilingR76.du sigma z.2=LocalRetilingR76.du sigma w.1+LocalRetilingR76.du sigma w.2 ∧ MatchingSeparatorR63.p sigma z.1.1+MatchingSeparatorR63.p sigma z.2.1=MatchingSeparatorR63.p sigma w.1.1+MatchingSeparatorR63.p sigma w.2.1 ∧ MatchingSeparatorR63.q sigma z.1.1+MatchingSeparatorR63.q sigma z.2.1=MatchingSeparatorR63.q sigma w.1.1+MatchingSeparatorR63.q sigma w.2.1) ∧ (∀ (N sigma j L a b : ℕ) (C : Finset LocalRetilingR76.Pair), (∀ z ∈ C, LocalRetilingR76.fiber N sigma j L a b z) → (∀ z ∈ C, ∀ w, LocalRetilingR76.edge N sigma j L a b z w → w ∈ C) → ∀ r : ℕ, r≤L → (C.filter (fun z => LocalRetilingR76.rank sigma z=r)).card = (C.filter (fun z => LocalRetilingR76.rank sigma z=L-r)).card)
  )
