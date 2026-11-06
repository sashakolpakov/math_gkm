import MathGKM.Round108CountingA
import MathGKM.Round108SeparatorA

/- Machine-authored r108. Exact typed submissions, independently checked elsewhere. -/
namespace ColorForgettingSubmissionR108

theorem structure_laws :
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
    (C.filter (fun z => LocalRetilingR76.rank sigma z=L-r)).card) :=
  ⟨ColorForgettingR108.conservation,ColorForgettingR108.closed_rank_symmetry⟩

theorem counting :
(∀ N sigma i t : ℕ,
  MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma i t) =
    ((ColorForgettingR108.single N sigma i t).card : ℤ)) ∧
(∀ N sigma i k t : ℕ,
  MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma i t)*
    MatchingProjectionR64.unit (MatchingProjectionR64.B N sigma k t) =
    ((ColorForgettingR108.rankFiber N sigma t (i+k) i).card : ℤ)) ∧
(∀ N sigma i t : ℕ,
  MatchingProjectionR64.unit (MatchingProjectionR64.defect N sigma i t) =
    ((ColorForgettingR108.rankFiber N sigma t (2*i+2) (i+1)).card : ℤ) -
    ((ColorForgettingR108.rankFiber N sigma t (2*i+2) i).card : ℤ)) :=
  ⟨ColorForgettingR108.unit_single,ColorForgettingR108.unit_pair,ColorForgettingR108.unit_margin⟩

theorem separator :
ColorForgettingSeparatorR108.z ∈ ColorForgettingSeparatorR108.C ∧
(∀ w ∈ ColorForgettingSeparatorR108.C, ColorForgettingR108.fiber 10 1 5 2 w) ∧
(∀ w ∈ ColorForgettingSeparatorR108.C, ∀ v,
  ColorForgettingR108.edge 10 1 5 2 w v → v∈ColorForgettingSeparatorR108.C) ∧
(∀ w ∈ ColorForgettingSeparatorR108.C,
  Relation.ReflTransGen (ColorForgettingR108.edge 10 1 5 2) ColorForgettingSeparatorR108.z w) ∧
(ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=0)).card=1 ∧
(ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=1)).card=0 ∧
(ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=2)).card=1 ∧
¬((ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=0)).card ≤
  (ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=1)).card) :=
  ColorForgettingSeparatorR108.component_certificate

end ColorForgettingSubmissionR108
#print axioms ColorForgettingSubmissionR108.structure_laws
#print axioms ColorForgettingSubmissionR108.counting
#print axioms ColorForgettingSubmissionR108.separator
