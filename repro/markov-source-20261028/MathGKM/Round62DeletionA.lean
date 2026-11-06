/- Machine-authored round62; adapted retained deletion attempt. -/
import MathGKM.Accepted92c7f4249bfd5f9e6fac325b

namespace MatchingIdentificationR62
open FiniteMatchingR61
noncomputable section
open scoped BigOperators

theorem mem_matchings (N : ℕ) (M : Finset ℕ) :
    M ∈ matchings N ↔ Match N M := by
  simp only [matchings,Finset.mem_filter,Finset.mem_powerset]
  constructor
  · exact And.right
  · intro h
    refine ⟨?_,h⟩
    intro e he
    have := h.1 e he
    simp only [Finset.mem_range]
    omega

theorem last_absent {N : ℕ} {M : Finset ℕ} (h : Match N M) :
    N ∉ M := by
  intro hm
  have := h.1 N hm
  omega

theorem insert_match (n : ℕ) (M : Finset ℕ) (h : Match n M) :
    Match (n+2) (insert n M) := by
  constructor
  · intro e he
    rcases Finset.mem_insert.mp he with heq|he
    · subst e
      omega
    · have := h.1 e he
      omega
  · intro e he hen
    rcases Finset.mem_insert.mp he with heq|he
    · subst e
      rcases Finset.mem_insert.mp hen with hh|hh
      · omega
      · have := h.1 (n+1) hh
        omega
    · have hb := h.1 e he
      rcases Finset.mem_insert.mp hen with hh|hh
      · omega
      · exact h.2 e he hh

theorem matching_union (n : ℕ) :
    matchings (n+2) = matchings (n+1) ∪ (matchings n).image (insert n) := by
  ext M
  rw [mem_matchings,Finset.mem_union,Finset.mem_image]
  constructor
  · intro h
    rcases (Accepted92c7f4249bfd5f9e6fac325b.obligation.2.1 n M).mp h with h | h
    · left
      exact (mem_matchings _ _).mpr h.1
    · right
      exact ⟨M.erase n,(mem_matchings _ _).mpr h.1,
        Finset.insert_erase h.2⟩
  · rintro (h|⟨L,hL,rfl⟩)
    · have hh := (mem_matchings _ _).mp h
      exact (Accepted92c7f4249bfd5f9e6fac325b.obligation.2.1 n M).mpr (Or.inl ⟨hh,by
        intro hn; have := hh.1 n hn; omega⟩)
    · exact insert_match n L ((mem_matchings _ _).mp hL)

theorem matching_disjoint (n : ℕ) :
    Disjoint (matchings (n+1)) ((matchings n).image (insert n)) := by
  apply Finset.disjoint_left.mpr
  intro M hM hI
  rcases Finset.mem_image.mp hI with ⟨L,hL,he⟩
  have hn : n ∈ M := he ▸ Finset.mem_insert_self n L
  have := ((mem_matchings _ _).mp hM).1 n hn
  omega

variable {R : Type*} [CommRing R]
theorem finiteSum_step (t : R) (c : ℕ → R) (n : ℕ) :
    finiteSum t c (n+2) =
      t*finiteSum t c (n+1)+c n*finiteSum t c n := by
  classical
  unfold finiteSum
  rw [matching_union,Finset.sum_union (matching_disjoint n)]
  have inj : ∀ M ∈ matchings n, ∀ L ∈ matchings n,
      insert n M=insert n L → M=L := by
    intro M hM L hL he
    have hm := last_absent ((mem_matchings _ _).mp hM)
    have hl := last_absent ((mem_matchings _ _).mp hL)
    have := congrArg (fun S : Finset ℕ => S.erase n) he
    simpa [hm,hl] using this
  rw [Finset.sum_image inj]
  rw [Finset.mul_sum,Finset.mul_sum]
  congr 1
  · apply Finset.sum_congr rfl
    intro M hM
    have hb := Accepted92c7f4249bfd5f9e6fac325b.obligation.1 (n+1) M ((mem_matchings _ _).mp hM)
    have he : n+2-2*M.card = (n+1-2*M.card)+1 := by omega
    rw [he,pow_succ]
    ring
  · apply Finset.sum_congr rfl
    intro M hM
    have hm := last_absent ((mem_matchings _ _).mp hM)
    rw [Finset.card_insert_of_notMem hm,Finset.prod_insert hm]
    have he : n+2-2*(M.card+1) = n-2*M.card := by omega
    rw [he]
    ring

end
end MatchingIdentificationR62

