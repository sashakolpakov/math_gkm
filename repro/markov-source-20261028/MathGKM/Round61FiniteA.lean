import Mathlib
import MathGKM.ResearchSemantics
/- Machine-authored round61. Finite subsets retain absolute edge indices. -/
namespace FiniteMatchingR61
noncomputable section
open scoped BigOperators
def Match (N : ℕ) (M : Finset ℕ) : Prop :=
  (∀ e ∈ M, e+1 < N) ∧ (∀ e ∈ M, e+1 ∉ M)
instance (N : ℕ) (M : Finset ℕ) : Decidable (Match N M) := by
  unfold Match
  infer_instance
def matchings (N : ℕ) : Finset (Finset ℕ) :=
  ((Finset.range (N-1)).powerset).filter (Match N)

theorem unmatched {n : ℕ} {M : Finset ℕ} (h : Match (n+2) M)
    (hn : n ∉ M) : Match (n+1) M := by
  constructor
  · intro e he
    have hb := h.1 e he
    have hne : e ≠ n := by intro hh; subst e; exact hn he
    omega
  · exact h.2

theorem matched {n : ℕ} {M : Finset ℕ} (h : Match (n+2) M)
    (hn : n ∈ M) : Match n (M.erase n) := by
  constructor
  · intro e he
    obtain ⟨hne,hem⟩ := Finset.mem_erase.mp he
    have hb := h.1 e hem
    have hnext := h.2 e hem
    have hne2 : e+1 ≠ n := by intro hh; rw [hh] at hnext; exact hnext hn
    omega
  · intro e he hnext
    exact h.2 e (Finset.mem_of_mem_erase he) (Finset.mem_of_mem_erase hnext)

theorem cardinality : ∀ N M, Match N M → 2*M.card ≤ N := by
  intro N
  refine Nat.twoStepInduction ?_ ?_ ?_ N
  · intro M h
    have he : M=∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro e he
      have := h.1 e he
      omega
    simp [he]
  · intro M h
    have he : M=∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro e he
      have := h.1 e he
      omega
    simp [he]
  · intro n ih0 ih1 M h
    by_cases hn : n ∈ M
    · have hi := ih0 (M.erase n) (matched h hn)
      have hc := Finset.card_erase_add_one hn
      omega
    · exact le_trans (ih1 M (unmatched h hn)) (by omega)

theorem deletion_partition (n : ℕ) (M : Finset ℕ) :
    Match (n+2) M ↔
      (Match (n+1) M ∧ n ∉ M) ∨
      (Match n (M.erase n) ∧ n ∈ M) := by
  constructor
  · intro h
    by_cases hn : n ∈ M
    · exact Or.inr ⟨matched h hn,hn⟩
    · exact Or.inl ⟨unmatched h hn,hn⟩
  · rintro (⟨h,hn⟩|⟨h,hn⟩)
    · constructor
      · intro e he
        have := h.1 e he
        omega
      · exact h.2
    · constructor
      · intro e he
        by_cases hh : e=n
        · omega
        · have := h.1 e (Finset.mem_erase.mpr ⟨hh,he⟩)
          omega
      · intro e he henext
        by_cases hh : e=n
        · subst e
          have := h.1 (n+1) (Finset.mem_erase.mpr ⟨by omega,henext⟩)
          omega
        · have hem := Finset.mem_erase.mpr ⟨hh,he⟩
          have hb := h.1 e hem
          have hnm : e+1 ≠ n := by omega
          exact h.2 e hem (Finset.mem_erase.mpr ⟨hnm,henext⟩)

variable {R : Type*} [CommRing R]
def finiteSum (t : R) (c : ℕ → R) (N : ℕ) : R :=
  ∑ M ∈ matchings N, t^(N-2*M.card) * ∏ e ∈ M, c e

theorem boundaries (t : R) (c : ℕ → R) :
    finiteSum t c 0=1 ∧ finiteSum t c 1=t := by
  have h0 : matchings 0={∅} := by decide
  have h1 : matchings 1={∅} := by decide
  simp [finiteSum,h0,h1]
end
end FiniteMatchingR61

