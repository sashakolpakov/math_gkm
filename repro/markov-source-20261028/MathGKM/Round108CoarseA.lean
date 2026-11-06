import MathGKM.Round78PairA

/- Machine-authored r108. The committed color-forgetting relation uses the
unchanged objects, rank and local moves. No rank inequality is assumed. -/
namespace ColorForgettingR108
open LocalRetilingR76
open scoped BigOperators
noncomputable section

def fiber (N sigma t L : ℕ) (z : Pair) : Prop :=
  valid N z.1 ∧ valid N z.2 ∧ dv N sigma z.1=t ∧ dv N sigma z.2=t ∧
    du sigma z.1+du sigma z.2=L
def edge (N sigma t L : ℕ) (z w : Pair) : Prop :=
  fiber N sigma t L z ∧ fiber N sigma t L w ∧
    (w=swap z ∨ retile N sigma z w)

theorem swap_fiber (N sigma t L : ℕ) (z : Pair)
    (hz : fiber N sigma t L z) : fiber N sigma t L (swap z) := by
  rcases hz with ⟨h1,h2,h3,h4,h5⟩
  exact ⟨h2,h1,h4,h3,by simpa [swap,add_comm] using h5⟩
theorem swap_rank (N sigma t L : ℕ) (z : Pair)
    (hz : fiber N sigma t L z) : rank sigma (swap z)=L-rank sigma z := by
  have h := hz.2.2.2.2
  simp only [rank,swap]
  omega
theorem swap_edge (N sigma t L : ℕ) (z : Pair)
    (hz : fiber N sigma t L z) : edge N sigma t L z (swap z) :=
  ⟨hz,swap_fiber N sigma t L z hz,Or.inl rfl⟩
theorem conservation (N sigma t L : ℕ) (z w : Pair)
    (h : edge N sigma t L z w) :
    dv N sigma z.1=dv N sigma w.1 ∧ dv N sigma z.2=dv N sigma w.2 ∧
    du sigma z.1+du sigma z.2=du sigma w.1+du sigma w.2 := by
  rcases h with ⟨⟨_,_,z1,z2,z3⟩,⟨_,_,w1,w2,w3⟩,_⟩
  exact ⟨z1.trans w1.symm,z2.trans w2.symm,z3.trans w3.symm⟩
theorem closed_rank_symmetry (N sigma t L : ℕ) (C : Finset Pair)
    (hv : ∀ z ∈ C, fiber N sigma t L z)
    (hc : ∀ z ∈ C, ∀ w, edge N sigma t L z w → w ∈ C)
    (r : ℕ) (hr : r≤L) :
    (C.filter (fun z => rank sigma z=r)).card =
      (C.filter (fun z => rank sigma z=L-r)).card := by
  classical
  apply Finset.card_bij (fun z _ => swap z)
  · intro z hz
    obtain ⟨hz,hrz⟩ := Finset.mem_filter.mp hz
    exact Finset.mem_filter.mpr ⟨hc z hz _ (swap_edge N sigma t L z (hv z hz)),
      by rw [swap_rank N sigma t L z (hv z hz),hrz]⟩
  · intro x hx y hy hxy
    exact Prod.ext (congrArg (fun z : Pair => z.2) hxy)
      (congrArg (fun z : Pair => z.1) hxy)
  · intro w hw
    obtain ⟨hw,hrw⟩ := Finset.mem_filter.mp hw
    refine ⟨swap w,?_,rfl⟩
    apply Finset.mem_filter.mpr
    refine ⟨hc w hw _ (swap_edge N sigma t L w (hv w hw)),?_⟩
    rw [swap_rank N sigma t L w (hv w hw),hrw]
    omega
end
end ColorForgettingR108
#print axioms ColorForgettingR108.conservation
#print axioms ColorForgettingR108.closed_rank_symmetry
