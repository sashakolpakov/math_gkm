import MathGKM.Round66FiberDefinitionsA

/- Machine-authored round76. Fixed actual-object relation from the commitment.
No component rank inequality is assumed by the conservation or symmetry laws. -/
namespace LocalRetilingR76
open scoped BigOperators
open MatchingSeparatorR63
noncomputable section
abbrev Obj := Finset ℕ × Finset ℕ
abbrev Pair := Obj × Obj
def valid (N : ℕ) (o : Obj) : Prop :=
  FiniteMatchingR61.Match N o.1 ∧ o.2 ⊆ ColorFibersR66.uncovered N o.1
def du (sigma : ℕ) (o : Obj) := p sigma o.1 + o.2.card
def dv (N sigma : ℕ) (o : Obj) :=
  q sigma o.1 + ((ColorFibersR66.uncovered N o.1).card-o.2.card)
def rank (sigma : ℕ) (z : Pair) := du sigma z.1
def fiber (N sigma j L a b : ℕ) (z : Pair) : Prop :=
  valid N z.1 ∧ valid N z.2 ∧ dv N sigma z.1=j ∧ dv N sigma z.2=j ∧
  du sigma z.1+du sigma z.2=L ∧
  p sigma z.1.1+p sigma z.2.1=a ∧ q sigma z.1.1+q sigma z.2.1=b
def swap (z : Pair) : Pair := (z.2,z.1)
def clear (lo hi : ℕ) (o : Obj) : Prop :=
  ∀ e ∈ o.1, ¬(e<lo ∧ lo<e+2) ∧ ¬(e<hi ∧ hi<e+2)
def outside (lo hi : ℕ) (o t : Obj) : Prop :=
  o.1.filter (fun e => e<lo ∨ hi≤e) = t.1.filter (fun e => e<lo ∨ hi≤e) ∧
  o.2.filter (fun e => e<lo ∨ hi≤e) = t.2.filter (fun e => e<lo ∨ hi≤e)
def retile (N sigma : ℕ) (z w : Pair) : Prop :=
  ∃ lo d : ℕ, 1≤d ∧ d≤4 ∧ lo+d≤N ∧
    clear lo (lo+d) z.1 ∧ clear lo (lo+d) z.2 ∧
    clear lo (lo+d) w.1 ∧ clear lo (lo+d) w.2 ∧
    outside lo (lo+d) z.1 w.1 ∧ outside lo (lo+d) z.2 w.2 ∧
    rank sigma z ≤ rank sigma w+1 ∧ rank sigma w ≤ rank sigma z+1
def edge (N sigma j L a b : ℕ) (z w : Pair) : Prop :=
  fiber N sigma j L a b z ∧ fiber N sigma j L a b w ∧
    (w=swap z ∨ retile N sigma z w)

theorem swap_fiber (N sigma j L a b : ℕ) (z : Pair)
    (hz : fiber N sigma j L a b z) : fiber N sigma j L a b (swap z) := by
  rcases hz with ⟨h1,h2,h3,h4,h5,h6,h7⟩
  exact ⟨h2,h1,h4,h3,by simpa [swap,add_comm] using h5,
    by simpa [swap,add_comm] using h6,by simpa [swap,add_comm] using h7⟩
theorem swap_rank (N sigma j L a b : ℕ) (z : Pair)
    (hz : fiber N sigma j L a b z) : rank sigma (swap z)=L-rank sigma z := by
  have h := hz.2.2.2.2.1
  simp only [rank,swap]
  omega
theorem swap_edge (N sigma j L a b : ℕ) (z : Pair)
    (hz : fiber N sigma j L a b z) : edge N sigma j L a b z (swap z) :=
  ⟨hz,swap_fiber N sigma j L a b z hz,Or.inl rfl⟩

theorem edge_conservation (N sigma j L a b : ℕ) (z w : Pair)
    (h : edge N sigma j L a b z w) :
    dv N sigma z.1=dv N sigma w.1 ∧ dv N sigma z.2=dv N sigma w.2 ∧
    du sigma z.1+du sigma z.2=du sigma w.1+du sigma w.2 ∧
    p sigma z.1.1+p sigma z.2.1=p sigma w.1.1+p sigma w.2.1 ∧
    q sigma z.1.1+q sigma z.2.1=q sigma w.1.1+q sigma w.2.1 := by
  rcases h with ⟨⟨_,_,z1,z2,z3,z4,z5⟩,⟨_,_,w1,w2,w3,w4,w5⟩,_⟩
  exact ⟨z1.trans w1.symm,z2.trans w2.symm,z3.trans w3.symm,
    z4.trans w4.symm,z5.trans w5.symm⟩

/- This law is conditional on the supplied set being closed under the exact
edge relation. It proves symmetry, never monotonicity. -/
theorem closed_rank_symmetry (N sigma j L a b : ℕ) (C : Finset Pair)
    (hv : ∀ z ∈ C, fiber N sigma j L a b z)
    (hc : ∀ z ∈ C, ∀ w, edge N sigma j L a b z w → w ∈ C)
    (r : ℕ) (hr : r≤L) :
    (C.filter (fun z => rank sigma z=r)).card =
      (C.filter (fun z => rank sigma z=L-r)).card := by
  classical
  apply Finset.card_bij (fun z _ => swap z)
  · intro z hz
    obtain ⟨hz,hrz⟩ := Finset.mem_filter.mp hz
    apply Finset.mem_filter.mpr
    exact ⟨hc z hz (swap z) (swap_edge N sigma j L a b z (hv z hz)),
      by rw [swap_rank N sigma j L a b z (hv z hz),hrz]⟩
  · intro x hx y hy hxy
    exact Prod.ext (congrArg (fun z : Pair => z.2) hxy)
      (congrArg (fun z : Pair => z.1) hxy)
  · intro w hw
    obtain ⟨hw,hrw⟩ := Finset.mem_filter.mp hw
    refine ⟨swap w,?_,rfl⟩
    apply Finset.mem_filter.mpr
    refine ⟨hc w hw (swap w) (swap_edge N sigma j L a b w (hv w hw)),?_⟩
    rw [swap_rank N sigma j L a b w (hv w hw),hrw]
    omega

theorem component_sum_comparison {ι : Type} (cs : Finset ι)
    (h : ι → ℕ → ℕ) (r : ℕ)
    (hc : ∀ c ∈ cs, h c r ≤ h c (r+1)) :
    ∑ c ∈ cs, h c r ≤ ∑ c ∈ cs, h c (r+1) :=
  Finset.sum_le_sum hc
end
end LocalRetilingR76
